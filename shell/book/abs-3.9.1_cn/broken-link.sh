#!/bin/bash
# broken-link.sh
# ��Lee bigelow����д &lt;ligelowbee@yahoo.com&gt;
# �Ѿ��������ߵ���Ȩ�����ڱ�����.

#һ�������shell�ű������ҳ���Щ�ϵ��ķ��������ļ��������������ָ����ļ�.
#�Ա������ǿ��԰�����ṩ��xargs�����д��� :)
#����. broken-link.sh /somedir /someotherdir|xargs rm
#
#�±ߵķ���, ������ô˵, ����һ�ָ��õİ취:
#
#find "somedir" -type l -print0|\
#xargs -r0 file|\
#grep "broken symbolic"|
#sed -e 's/^\|: *broken symbolic.*$/"/g'
#
#���ⲻ��һ�������bash�ű�, ���������ڲ���.
#ע��: ������/proc�ļ�ϵͳ���κ���ѭ��������ʹ��!
##############################################################


#���û�в��������ݵ��ű���, ��ô��ʹ��
#��ǰĿ¼. ��������ô��ݽ����Ĳ�����ΪĿ¼
#������.
####################
[ $# -eq 0 ] && directorys=`pwd` || directorys=$@

#��д����linkchk������鴫�ݽ�����Ŀ¼���ļ��Ƿ�������, 
#���ж���Щ�ļ���Ŀ¼�Ƿ����. Ȼ���ӡ������ָ����ļ�.
#������ݽ�����Ԫ�ذ�����Ŀ¼, 
#��ô����Ŀ¼Ҳ�ŵ�linkcheck�����д���, �����ʹﵽ�˵ݹ��Ŀ��.
##########
linkchk () {
    for element in $1/*; do
    [ -h "$element" -a ! -e "$element" ] && echo \"$element\"
    [ -d "$element" ] && linkchk $element
    # ��Ȼ, '-h'�������Է�������, '-d'��������Ŀ¼.
    done
}

#��ÿ�����ݵ��ű��Ĳ������͵�linkchk�����н��д���, 
#����Ƿ��п���Ŀ¼. ���û��, ��ô�ʹ�ӡ������Ϣ��
#ʹ����Ϣ.
################
for directory in $directorys; do
    if [ -d $directory ]
	then linkchk $directory
	else 
	    echo "$directory is not a directory"
	    echo "Usage: $0 dir1 dir2 ..."
    fi
done

exit 0
