#!/bin/bash

var0=0
LIMIT=10

while [ "$var0" -lt "$LIMIT" ]
do
  echo -n "$var0 "        # -n ������ֹ��������. 
  #             ^           �ո�, ����֮��ķָ�.

  var0=`expr $var0 + 1`   # var0=$(($var0+1))  Ҳ����.
                          # var0=$((var0 + 1)) Ҳ����.
                          # let "var0 += 1"    Ҳ����.
done                      # ʹ�������ķ���Ҳ��.

echo

exit 0
