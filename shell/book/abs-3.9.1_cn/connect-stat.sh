#!/bin/bash

PROCNAME=pppd        # ppp�ػ�����
PROCFILENAME=status  # ������Ѱ����Ϣ. 
NOTCONNECTED=65
INTERVAL=2           # ÿ2��ˢ��һ��. 

pidno=$( ps ax | grep -v "ps ax" | grep -v grep | grep $PROCNAME | awk '{ print $1 }' )
# �ҳ�'pppd'����Ӧ�Ľ��̺�, ��'ppp�ػ�����'. 
# ������˵������������������Ľ�����. 
#
#  Ȼ��, ����Oleg Philon��ָ��������, 
#+ ���ʹ��"pidof"�Ļ�, �ͻ�ǳ���. 
#  pidno=$( pidof $PROCNAME )
#
#  �Ӿ������ܽ�������Ҹ�: 
#+ ���������б�÷ǳ����ӵ�ʱ��, һ��Ҫ�ҵ������ķ���. 


if [ -z "$pidno" ]   # ���û���ҵ�ƥ���pid, ��ô��˵����Ӧ�Ľ���û����. 
then
  echo "Not connected."
  exit $NOTCONNECTED
else
  echo "Connected."; echo
fi

while [ true ]       # ��ѭ��, ������ԸĽ�һ��. 
do

  if [ ! -e "/proc/$pidno/$PROCFILENAME" ]
  # ��������ʱ, ��Ӧ��"status"�ļ��ͻ����. 
  then
    echo "Disconnected."
    exit $NOTCONNECTED
  fi

netstat -s | grep "packets received"  # ���һЩ����ͳ��. 
netstat -s | grep "packets delivered"


  sleep $INTERVAL
  echo; echo

done

exit 0

# �������ֹͣ����ű�, ֻ��ʹ��Control-C. 

#    ��ϰ:
#    -----
#    �Ľ�����ű�, ʹ�����԰�"q"���˳�. 
#    �������ű����û��Ѻ���. 
