#!/bin/bash
# logevents.sh, ��Stephane Chazelas����д. 

# ���¼���¼��һ���ļ���. 
# ������root������� (��������Ȩ�޷���/var/log). 

ROOT_UID=0     # ֻ��$UIDֵΪ0���û��ž���rootȨ��.
E_NOTROOT=67   # ��root�û����˳�����. 


if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi  


FD_DEBUG1=3
FD_DEBUG2=4
FD_DEBUG3=5

# ȥ���±�����ע���е�һ��, ������ű�. 
# LOG_EVENTS=1
# LOG_VARS=1


log()  # ��ʱ�������д����־�ļ�. 
{
echo "$(date)  $*" &gt;&7     # ��������*����*���ļ���. 
                              # �ο��±ߵĴ���. 
}



case $LOG_LEVEL in
 1) exec 3&gt;&2         4&gt; /dev/null 5&gt; /dev/null;;
 2) exec 3&gt;&2         4&gt;&2         5&gt; /dev/null;;
 3) exec 3&gt;&2         4&gt;&2         5&gt;&2;;
 *) exec 3&gt; /dev/null 4&gt; /dev/null 5&gt; /dev/null;;
esac

FD_LOGVARS=6
if [[ $LOG_VARS ]]
then exec 6&gt;&gt; /var/log/vars.log
else exec 6&gt; /dev/null               # �������. 
fi

FD_LOGEVENTS=7
if [[ $LOG_EVENTS ]]
then
  # then exec 7 &gt;(exec gawk '{print strftime(), $0}' &gt;&gt; /var/log/event.log)
  # �������в�����2.04�汾��Bash������. 
  exec 7&gt;&gt; /var/log/event.log        # ���ӵ�"event.log". 
  log                                      # ��¼������ʱ��. 
else exec 7&gt; /dev/null                  # �������. 
fi

echo "DEBUG3: beginning" &gt;&${FD_DEBUG3}

ls -l &gt;&5 2&gt;&4                       # command1 &gt;&5 2&gt;&4

echo "Done"                                # command2 

echo "sending mail" &gt;&${FD_LOGEVENTS}   # ���ַ���"sending mail"д���ļ�������#7. 


exit 0
