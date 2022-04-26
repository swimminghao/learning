#!/bin/bash

if [ -z "$1" ]
then
  Filename=names.data          # ���û��ָ���ļ���, ��ʹ��Ĭ��ֵ. 
else
  Filename=$1
fi  

Savefile=$Filename.new         # �������ս�����ļ���. 
FinalName=Jonah                # ��ֹ"read"ʱ������. 

line_count=`wc $Filename | awk '{ print $1 }'`  # Ŀ���ļ�������. 


for name in `seq $line_count`
do
  read name
  echo "$name"
  if [ "$name" = "$FinalName" ]
  then
    break
  fi  
done < "$Filename" > "$Savefile"     # �ض���stdin���ļ�$Filename, 
#    ^^^^^^^^^^^^^^^^^^^^^^^^^^^       ���ҽ������浽�����ļ���. 

exit 0
