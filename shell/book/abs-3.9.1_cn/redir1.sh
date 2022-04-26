#!/bin/bash
# ʹ��'exec'�ض���stdin. 


exec 6<&0          # ���ļ�������#6��stdin��������. 
                   # ����stdin. 

exec < data-file   # stdin���ļ�"data-file"������. 

read a1            # ��ȡ�ļ�"data-file"�ĵ�һ��. 
read a2            # ��ȡ�ļ�"data-file"�ĵڶ���. 

echo
echo "Following lines read from file."
echo "-------------------------------"
echo $a1
echo $a2

echo; echo; echo

exec 0<&6 6<&-
#  ���ڽ�stdin��fd #6�лָ�, ��Ϊ�ղ����ǰ�stdin�ض���#6��, 
#+ Ȼ��ر�fd #6 ( 6<&- ), �����������������������������ʹ��. 
#
# <&6 6<&-    ��ô��Ҳ����. 

echo -n "Enter data  "
read b1  # ����"read"�Ѿ��ָ�������, �����ܹ������Ĵ�stdin�ж�ȡ.
echo "Input read from stdin."
echo "----------------------"
echo "b1 = $b1"

echo

exit 0
