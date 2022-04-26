#!/bin/bash
# fc4upd.sh

# �ű�����: Frank Wang.
# �����������������޸�.
# ��Ȩ�ڱ�����ʹ��.


#  ʹ��rsync����Ӿ���վ��������Fedora 4�ĸ���. 
#  Ϊ�˽�ʡ�ռ�, ����ж���汾���ڵĻ�, 
#+ ֻ�������µİ�. 

URL=rsync://distro.ibiblio.org/fedora-linux-core/updates/
# URL=rsync://ftp.kddilabs.jp/fedora/core/updates/
# URL=rsync://rsync.planetmirror.com/fedora-linux-core/updates/

DEST=${1:-/var/www/html/fedora/updates/}
LOG=/tmp/repo-update-$(/bin/date +%Y-%m-%d).txt
PID_FILE=/var/run/${0##*/}.pid

E_RETURN=65        # ĳЩ���벻���Ĵ���.


# һ��rsyncѡ��
# -r: �ݹ�����
# -t: ����ʱ��
# -v: verbose

OPTS="-rtv --delete-excluded --delete-after --partial"

# rsync includeģʽ
# ��ͷ��"/"�ᵼ�¾���·����ƥ��. 
INCLUDE=(
    "/4/i386/kde-i18n-Chinese*" 
#   ^                         ^
# ˫�����Ǳ����, ������ֹglobbing.
) 


# rsync excludeģʽ
# ʹ��"#"��ʱע�͵�һЩ����Ҫ�İ�.
EXCLUDE=(
    /1
    /2
    /3
    /testing
    /4/SRPMS
    /4/ppc
    /4/x86_64
    /4/i386/debug
   "/4/i386/kde-i18n-*"
   "/4/i386/openoffice.org-langpack-*"
   "/4/i386/*i586.rpm"
   "/4/i386/GFS-*"
   "/4/i386/cman-*"
   "/4/i386/dlm-*"
   "/4/i386/gnbd-*"
   "/4/i386/kernel-smp*"
#  "/4/i386/kernel-xen*" 
#  "/4/i386/xen-*" 
)


init () {
    # �ùܵ�����ؿ��ܵ�rsync����, ����, ������ʱ(stalled network).
    set -o pipefail

    TMP=${TMPDIR:-/tmp}/${0##*/}.$$     # ���澫���������б�.
    trap "{                                                   
        rm -f $TMP 2>/dev/null                                
    }" EXIT                             # ɾ�����ڵ���ʱ�ļ�.
}


check_pid () {
# �������Ƿ����. 
    if [ -s "$PID_FILE" ]; then
        echo "PID file exists. Checking ..."
        PID=$(/bin/egrep -o "^[[:digit:]]+" $PID_FILE)
        if /bin/ps --pid $PID &>/dev/null; then
            echo "Process $PID found. ${0##*/} seems to be running!"
           /usr/bin/logger -t ${0##*/} \
                 "Process $PID found. ${0##*/} seems to be running!"
            exit $E_RETURN
        fi
        echo "Process $PID not found. Start new process . . ."
    fi
}


#  �����ϱߵ�ģʽ,
#+ ���������ļ��ĸ��·�Χ, ��root��$URL��ʼ.
set_range () {
    include=
    exclude=
    for p in "${INCLUDE[@]}"; do
        include="$include --include \"$p\""
    done

    for p in "${EXCLUDE[@]}"; do
        exclude="$exclude --exclude \"$p\""
    done
}


# ��ò�����rsync�����б�.
get_list () {
    echo $$ > $PID_FILE || {
        echo "Can't write to pid file $PID_FILE"
        exit $E_RETURN
    }

    echo -n "Retrieving and refining update list . . ."

    # ����б� -- ��Ϊ��������������rsync�Ļ���Ҫ'eval'.
    # $3��$4���ļ����������ں�ʱ��.
    # $5�������İ�����.
    previous=
    pre_file=
    pre_date=0
    eval /bin/nice /usr/bin/rsync \
        -r $include $exclude $URL | \
        egrep '^dr.x|^-r' | \
        awk '{print $3, $4, $5}' | \
        sort -k3 | \
        { while read line; do
            # ���������е�����, ���˵����õİ�. 
            cur_date=$(date -d "$(echo $line | awk '{print $1, $2}')" +%s)
            #  echo $cur_date

            # ȡ���ļ���. 
            cur_file=$(echo $line | awk '{print $3}')
            #  echo $cur_file

            # ������ܵĻ�, ���ļ�����ȡ��rpm�İ�����. 
            if [[ $cur_file == *rpm ]]; then
                pkg_name=$(echo $cur_file | sed -r -e \
                    's/(^([^_-]+[_-])+)[[:digit:]]+\..*[_-].*$/\1/')
            else
                pkg_name=
            fi
            # echo $pkg_name

            if [ -z "$pkg_name" ]; then   #  �������һ��rpm�ļ�,
                echo $cur_file >> $TMP    #+ Ȼ����ӵ������б���.
            elif [ "$pkg_name" != "$previous" ]; then   # ����һ���°�.
                echo $pre_file >> $TMP                  # ������µ��ļ�.
                previous=$pkg_name                      # ���浱ǰ״̬.
                pre_date=$cur_date
                pre_file=$cur_file
            elif [ "$cur_date" -gt "$pre_date" ]; then  #  �������ͬ�İ�, �������������һЩ, 
                pre_date=$cur_date                      #+ ��ô�͸������µ�. 
                pre_file=$cur_file
            fi
            done
            echo $pre_file >> $TMP                      #  TMP���ڰ�������
                                                        #+ ���������б�. 
            # echo "subshell=$BASH_SUBSHELL"

    }       # ����Ĵ�������Ϊ����������"echo $pre_file >> $TMP"
            # Ҳ��������ѭ��һ��ŵ�ͬһ����shell ( 1 )��. 

    RET=$?  # ȡ�ùܵ�����ķ���״̬. 

    [ "$RET" -ne 0 ] && {
        echo "List retrieving failed with code $RET"
        exit $E_RETURN
    }

    echo "done"; echo
}

# ������rsync���ز���. 
get_file () {

    echo "Downloading..."
    /bin/nice /usr/bin/rsync \
        $OPTS \
        --filter "merge,+/ $TMP" \
        --exclude '*'  \
        $URL $DEST     \
        | /usr/bin/tee $LOG

    RET=$?

        #  --filter merge,+/ �������Ŀ����˵, �����������Ҫ��. 
        #  + ��������Ϊ�Ű���, / ��ζ�ž���·��. 
        #  Ȼ��$TMP���Ź�����б�����������·����, 
        #+ ����"�򻯵�����"(shortcutting the circuit)����ֹ�±ߵ� --exclude '*'. 

    echo "Done"

    rm -f $PID_FILE 2>/dev/null

    return $RET
}

# -------
# Main
init
check_pid
set_range
get_list
get_file
RET=$?
# -------

if [ "$RET" -eq 0 ]; then
    /usr/bin/logger -t ${0##*/} "Fedora update mirrored successfully."
else
    /usr/bin/logger -t ${0##*/} "Fedora update mirrored with failure code: $RET"
fi

exit $RET
