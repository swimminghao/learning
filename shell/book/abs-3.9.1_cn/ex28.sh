#!/bin/bash

LIMIT=19  # ����

echo
echo "Printing Numbers 1 through 20 (but not 3 and 11)."

a=0

while [ $a -le "$LIMIT" ]
do
 a=$(($a+1))

 if [ "$a" -eq 3 ] || [ "$a" -eq 11 ]  # ����3��11.
 then
   continue      # ��������ѭ��ʣ������.
 fi

 echo -n "$a "   # ��$a����3��11��ʱ����佫����ִ��.
done 

# ��ϰ:
# Ϊʲôѭ�����ӡ��20?

echo; echo

echo Printing Numbers 1 through 20, but something happens after 2.

##################################################################

# ͬ����ѭ��, ������'break'������'continue'.

a=0

while [ "$a" -le "$LIMIT" ]
do
 a=$(($a+1))

 if [ "$a" -gt 2 ]
 then
   break  # ������������ѭ��.
 fi

 echo -n "$a "
done

echo; echo; echo

exit 0
