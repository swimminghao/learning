#!/bin/bash

if [ -z "$1" ]
then
  Filename=names.data          # ���û��ָ���ļ�����ʹ��Ĭ��ֵ. 
else
  Filename=$1
fi  

line_count=`wc $Filename | awk '{ print $1 }'`
#           Ŀ���ļ�������. 
#
#  �˴��Ĵ���̫������, ����д�ú��ѿ�, 
#+ ������չʾ��"for"ѭ����stdin�����ض���...
#+ ��Ȼ, ����㹻����, ���ܿ��ó���. 
#
# ������д����     line_count=$(wc -l < "$Filename")


for name in `seq $line_count`  # "seq"��ӡ����������. 
# while [ "$name" != Smith ]   --   ��"while"ѭ��������   --
do
  read name                    # ��$Filename��, ���Ǵ�stdin�ж�ȡ. 
  echo $name
  if [ "$name" = Smith ]       # ��Ϊ��forѭ��, ������Ҫ����������. 
  then
    break
  fi  
done <"$Filename"              # �ض���stdin���ļ�$Filename. 
#    ^^^^^^^^^^^^

exit 0
