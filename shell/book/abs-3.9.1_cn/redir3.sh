#!/bin/bash
# ��ǰ���������ͬ, ��ʹ�õ���"until"ѭ��. 

if [ -z "$1" ]
then
  Filename=names.data         # ���û��ָ���ļ����Ǿ�ʹ��Ĭ��ֵ. 
else
  Filename=$1
fi  

# while [ "$name" != Smith ]
until [ "$name" = Smith ]     # ��!=��Ϊ=.
do
  read name                   # ��$Filename�ж�ȡ, �����Ǵ�stdin�ж�ȡ. 
  echo $name
done <"$Filename"             # �ض���stdin���ļ�$Filename. 
#    ^^^^^^^^^^^^

# �����ǰ�����ӵ�"while"ѭ����ͬ. 

exit 0
