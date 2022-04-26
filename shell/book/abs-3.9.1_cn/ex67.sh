#!/bin/bash

declare -a colors
#  �ű������еĺ���������
#+ ����"colors"��������. 

echo "Enter your favorite colors (separated from each other by a space)."

read -a colors    # ������Ҫ����3����ɫ, �Ա��ں�ߵ���ʾ. 
#  'read'���������ѡ��, 
#+ ���������Ԫ�ظ�ֵ. 

echo

element_count=${#colors[@]}
# ��ȡ����Ԫ�ظ����������﷨. 
#     ��element_count=${#colors[*]}Ҳһ��. 
#
#  "@"���������������д��ڵ��ʷָ�(word splitting)
#+ (�����հ��ַ����ָ�����). 
#
#  ��ͺ���"$@"��"$*"
#+ ��λ�ò����е������ֳ�������Ϊһ��. 

index=0

while [ "$index" -lt "$element_count" ]
do    # �г������е�����Ԫ��. 
  echo ${colors[$index]}
  let "index = $index + 1"
  # ��:
  #    index+=1
  # ��������е�Bash�汾��3.1�Ժ�Ļ�, ��֧�������﷨. 
done
# ÿ������Ԫ�ر���Ϊ������һ��. 
# ���û������Ҫ��Ļ�, ����ʹ��echo -n "${colors[$index]} "
#
# Ҳ����ʹ��"for"ѭ������: 
#   for i in "${colors[@]}"
#   do
#     echo "$i"
#   done
# (��л, S.C.)

echo

# �ٴ��г������е�����Ԫ��, ������ε�����������. 
  echo ${colors[@]}          # ��echo ${colors[*]}Ҳ��. 

echo

# "unset"�������ɾ����������, Ҳ����ɾ����������. 
unset colors[1]              # ɾ������ĵ�2��Ԫ��. 
                             # ���õ�Ч��   colors[1]=
echo  ${colors[@]}           # �ٴ��г���������, ��2��Ԫ��û��. 

unset colors                 # ɾ����������. 
                             #  unset colors[*] ��
                             #+ unset colors[@] ������. 
echo; echo -n "Colors gone."			   
echo ${colors[@]}            # �ٴ��г���������, ����Ϊ��. 

exit 0
