#!/bin/bash
# hexconvert.sh: ��10��������ת��Ϊ16��������.

E_NOARGS=65 # ȱ�������в�������.
BASE=16     # 16����.

if [ -z "$1" ]
then
  echo "Usage: $0 number"
  exit $E_NOARGS
  # ��Ҫһ�������в���. 
fi
# ��ϰ: ��������в������. 


hexcvt ()
{
if [ -z "$1" ]
then
  echo 0
  return    # ���û�в������ݵ���������еĻ���"return" 0.
fi

echo ""$1" "$BASE" o p" | dc
#                 "o" ��������Ļ���(����).
#                   "p" ��ӡջ��.
# �ο�dc��manҳ���˽�������ѡ��. 
return
}

hexcvt "$1"

exit 0
