#!/bin/bash
# ���, �汾 3

#  ����:
#  -----
#  ����ű��кö�����,
#+ ��Щ�������ں���½ڽ��н��͵�.
#  ����ǽ��е������һ���ʱ��,
#+ ��ͻ������û��ʲô���ص���.



LOG_DIR=/var/log
ROOT_UID=0     # $UIDΪ0��ʱ��,�û��ž���root�û���Ȩ��
LINES=50       # Ĭ�ϵı�������
E_XCD=66       # �����޸�Ŀ¼?
E_NOTROOT=67   # ��root�û�����error�˳�


# ��ȻҪʹ��root�û�������.
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi  

if [ -n "$1" ]
# �����Ƿ��������в���(�ǿ�).
then
  lines=$1
else  
  lines=$LINES # Ĭ��,���������������ָ��.
fi  


#  Stephane Chazelas ����ʹ���±�
#+ �ĸ��÷�������������в���.
#+ ������������˵�����е㳬ǰ.
#
#    E_WRONGARGS=65  # ����ֵ����(����Ĳ�����ʽ)
#
#    case "$1" in
#    ""      ) lines=50;;
#    *[!0-9]*) echo "Usage: `basename $0` file-to-cleanup"; exit $E_WRONGARGS;;
#    *       ) lines=$1;;
#    esac
#
#* ֱ��"Loops"���½ڲŻ���ϱߵ����ݽ�����ϸ������.


cd $LOG_DIR

if [ `pwd` != "$LOG_DIR" ]  # ����	if[ "$PWD" != "$LOG_DIR" ]
                            # ���� /var/log��?
then
  echo "Can't change to $LOG_DIR."
  exit $E_XCD
fi  # �ڴ���log file֮ǰ,��ȷ��һ�鵱ǰĿ¼�Ƿ���ȷ.

# ����Ч�ʵ�������:
#
# cd /var/log || {
#   echo "Cannot change to necessary directory." >&2
#   exit $E_XCD;
# }




tail -$lines messages > mesg.temp # ����log file��Ϣ����󲿷�.
mv mesg.temp messages             # ��Ϊ�µ�logĿ¼.


# cat /dev/null > messages
#* ������Ҫ��,ʹ���ϱߵķ�������ȫ.

cat /dev/null > wtmp  #  ': > wtmp' �� '> wtmp'������ͬ������
echo "Logs cleaned up."

exit 0
#  �˳�֮ǰ����0,
#+ ����0��ʾ�ɹ�.
