#!/bin/bash
# logon.sh: һ��������Ƿ����ߵĽű�, ����ű�ʵ�ֵĺܼ�ª. 

umask 177  # ȷ��temp�ļ������������û�����Ȩ�޷���. 


TRUE=1
LOGFILE=/var/log/messages
#  ע��: $LOGFILE�����ǿɶ���
#+ (ʹ��root�����ִ��, chmod 644 /var/log/messages).
TEMPFILE=temp.$$
#  ʹ�ýű��Ľ���ID, ������һ��"Ψһ"����ʱ�ļ���. 
#     Ҳ����ʹ��'mktemp'. 
#     ����: 
#     TEMPFILE=`mktemp temp.XXXXXX`
KEYWORD=address
#  ��½ʱ, ��"remote IP address xxx.xxx.xxx.xxx"
#                      ��ӵ�/var/log/messages��. 
ONLINE=22
USER_INTERRUPT=13
CHECK_LINES=100
#  ��־�ļ��ж�������Ҫ���. 

trap 'rm -f $TEMPFILE; exit $USER_INTERRUPT' TERM INT
#  ����ű���control-c��;�жϵĻ�, ��ô���������ʱ�ļ�. 

echo

while [ $TRUE ]  #��ѭ��. 
do
  tail -$CHECK_LINES $LOGFILE> $TEMPFILE
  #  ��ϵͳ��־�ļ������100�б��浽��ʱ�ļ���. 
  #  ��ô�����б�Ҫ, ��Ϊ�°汾���ں��ڵ�½��ʱ��, ���������½��Ϣ. 
  search=`grep $KEYWORD $TEMPFILE`
  #  ����Ƿ����"IP address"Ƭ��, 
  #+ ��������ʾ, ����һ�γɹ��������½. 

  if [ ! -z "$search" ] #  ����ʹ������, ��Ϊ�������ܻ����һЩ�հ׷�. 
  then
     echo "On-line"
     rm -f $TEMPFILE    #  �����ʱ�ļ�. 
     exit $ONLINE
  else
     echo -n "."        #  echo��-nѡ���������з�. 
                        #+ ������Ϳ�����һ����������ӡ. 
  fi

  sleep 1  
done  


#  ע��: ����㽫����KEYWORD��ֵ��Ϊ"Exit", 
#+ ������ʱ, ����ű��Ϳ��Ա��������
#+ ����ĵ������. 

# ��ϰ: ��������"ע��"����˵���������޸�����ű�, 
#       �������ֵĸ���. 

exit 0


# Nick Drage����ʹ����һ�ַ���: 

while true
  do ifconfig ppp0 | grep UP 1> /dev/null && echo "connected" && exit 0
  echo -n "."   # ��ͣ�Ĵ�ӡ(.....), ������ʾ�û��ȴ�, ֱ��������λ��. 
  sleep 2
done

# ����: ʹ��Control-C����ֹ������̿����ǲ�����. 
#+         (���ܻ��������ӡ"...")
# ��ϰ: �޸��������. 



# Stephane Chazelas�������һ�ַ���: 

CHECK_INTERVAL=1

while ! tail -1 "$LOGFILE" | grep -q "$KEYWORD"
do echo -n .
   sleep $CHECK_INTERVAL
done
echo "On-line"

# ��ϰ: ����һ���⼸�ֲ�ͬ����
#       ���Ե���ȱ��. 
