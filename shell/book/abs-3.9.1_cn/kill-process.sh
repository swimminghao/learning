#!/bin/bash
# kill-process.sh

NOPROCESS=2

process=xxxyyyzzz  # ʹ�ò����ڵĽ���. 
# ֻ������Ϊ����ʾ...
# ... ������������ű���ɱ���κ������Ľ���. 
#
# �ٸ�����, �������ʹ������ű�������Internet, 
#     process=pppd

t=`pidof $process`       # ȡ��$process��pid(����id). 
# 'kill'ֻ��ʹ��pid(�����ó�����)��Ϊ����. 

if [ -z "$t" ]           # ���û�������, 'pidof' ���ؿ�. 
then
  echo "Process $process was not running."
  echo "Nothing killed."
  exit $NOPROCESS
fi  

kill $t                  # ����ĳЩ��̵Ľ��̿�����Ҫʹ��'kill -9'. 

# ������Ҫ��һ�����, ���������Ƿ���������kill. 
# ������һ�� " t=`pidof $process` " ���� ...


# �����ű�������ʹ���±�������滻: 
#        kill $(pidof -x process_name)
# ����
#        killall process_name
# �������û�н���������. 

exit 0
