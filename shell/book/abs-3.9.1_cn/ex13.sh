#!/bin/bash

a=4
b=5

#  �����"a"��"b"�ȿ��Ա���Ϊ������Ҳ�ɱ���Ϊ���ַ���. 
#  �����������Ƚ����ַ����Ƚ�֮�����������˲�������, 
#+ ��ΪBash����������ǿ���͵�.

#  Bash������ڱ����������β�����Ƚϲ���.
#+ ��ǰ���Ǳ�����ֻ�ܰ��������ַ�.
#  ������ô��, ����ҪС��. 

echo

if [ "$a" -ne "$b" ]
then
  echo "$a is not equal to $b"
  echo "(arithmetic comparison)"
fi

echo

if [ "$a" != "$b" ]
then
  echo "$a is not equal to $b."
  echo "(string comparison)"
  #     "4"  != "5"
  # ASCII 52 != ASCII 53
fi

# ������ض���������, "-ne"��"!="������. 

echo

exit 0
