#!/bin/bash

echo
                               # �ȼ���:
while [ "$var1" != "end" ]     # while test "$var1" != "end"
do
  echo "Input variable #1 (end to exit) "
  read var1                    # Ϊʲô��ʹ��'read $var1'?
  echo "variable #1 = $var1"   # ��Ϊ����"#", ������Ҫ""
  # �������Ϊ'end', ��ô��������echo.
  # ���������жϽ���, ��ѭ�����ж�.
  echo
done  

exit 0
