#!/bin/bash

if [ -z "$1" ]
then
  Filename=names.data   # ����ļ���û��ָ��, ʹ��Ĭ��ֵ. 
else
  Filename=$1
fi  

TRUE=1

if [ "$TRUE" ]          # if true    ��   if :   ������. 
then
 read name
 echo $name
fi <"$Filename"
#  ^^^^^^^^^^^^

# ֻ��ȡ���ļ��ĵ�һ��. 
# An "if/then"���Խṹ�����Զ��ط�����ִ��, ���ǰ�����Ƕ��ѭ����. 

exit 0
