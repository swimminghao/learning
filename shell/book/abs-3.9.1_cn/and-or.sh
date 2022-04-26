#!/bin/bash

a=24
b=47

if [ "$a" -eq 24 ] && [ "$b" -eq 47 ]
then
  echo "Test #1 succeeds."
else
  echo "Test #1 fails."
fi

# ERROR:   if [ "$a" -eq 24 && "$b" -eq 47 ]
#+         ��������' [ "$a" -eq 24 '
#+         ��Ϊû�ҵ�ƥ���']'����ʧ����.
#
#  ע��:  if [[ $a -eq 24 && $b -eq 24 ]]  Ҳ����������.
#  ˫�����ŵ�if-test�ṹҪ��
#+ �������ŵ�if-test�ṹ�������.
#    (�ڵ�17��"&&"���6�е�"&&"���в�ͬ�ĺ���.)
#    ��л, Stephane Chazelas, ָ�����.


if [ "$a" -eq 98 ] || [ "$b" -eq 47 ]
then
  echo "Test #2 succeeds."
else
  echo "Test #2 fails."
fi


#  -a��-oѡ���ṩ��
#+ һ�ֿ�ѡ�Ļ���������Եķ���.
#  ��лPatrick Callahanָ�����. 


if [ "$a" -eq 24 -a "$b" -eq 47 ]
then
  echo "Test #3 succeeds."
else
  echo "Test #3 fails."
fi


if [ "$a" -eq 98 -o "$b" -eq 47 ]
then
  echo "Test #4 succeeds."
else
  echo "Test #4 fails."
fi


a=rhino
b=crocodile
if [ "$a" = rhino ] && [ "$b" = crocodile ]
then
  echo "Test #5 succeeds."
else
  echo "Test #5 fails."
fi

exit 0
