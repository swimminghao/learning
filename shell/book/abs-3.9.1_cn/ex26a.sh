#!/bin/bash

var1=unset
previous=$var1

while echo "previous-variable = $previous"
      echo
      previous=$var1
      [ "$var1" != end ] # ��¼֮ǰ��$var1.
      # ���"while"����4������, ����ֻ�����һ���ܹ�����ѭ��.
      # *���*���˳�״̬�����������һ������������. 
do
echo "Input variable #1 (end to exit) "
  read var1
  echo "variable #1 = $var1"
done  

# �����������ű������й���.
# ���ﻹ���е�С���ɵ�.

exit 0
