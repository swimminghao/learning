#!/bin/bash
# csubloop.sh: ��ѭ��������������õ�������. 

variable1=`for i in 1 2 3 4 5
do
  echo -n "$i"                 #  ����������������滻��˵
done`                          #+ ���'echo'�����Ƿǳ��ؼ���. 

echo "variable1 = $variable1"  # variable1 = 12345


i=0
variable2=`while [ "$i" -lt 10 ]
do
  echo -n "$i"                 # ����һ��, 'echo'�Ǳ����. 
  let "i += 1"                 # ����. 
done`

echo "variable2 = $variable2"  # variable2 = 0123456789

#  ���֤������һ��������������
#+ Ƕ��һ��ѭ���ǿ��е�. 

exit 0
