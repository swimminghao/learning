#!/bin/bash
# array-ops.sh: ������Ȥ�������÷�. 


array=( zero one two three four five )
# ����Ԫ�� 0   1   2    3     4    5

echo ${array[0]}       #  0
echo ${array:0}        #  0
                       #  ��һ��Ԫ�صĲ�����չ, 
                       #+ ��λ��0(#0)��ʼ(����һ���ַ�). 
echo ${array:1}        #  ero
                       #  ��һ��Ԫ�صĲ�����չ, 
                       #+ ��λ��1(#1)��ʼ(����2���ַ�). 

echo "--------------"

echo ${#array[0]}      #  4
                       #  ��һ������Ԫ�صĳ���. 
echo ${#array}         #  4
                       #  ��һ������Ԫ�صĳ���. 
                       #  (��һ�ֱ�ʾ��ʽ)

echo ${#array[1]}      #  3
                       #  �ڶ�������Ԫ�صĳ���. 
                       #  Bash�е������Ǵ�0��ʼ������. 

echo ${#array[*]}      #  6
                       #  �����е�Ԫ�ظ���. 
echo ${#array[@]}      #  6
                       #  �����е�Ԫ�ظ���.

echo "--------------"

array2=( [0]="first element" [1]="second element" [3]="fourth element" )

echo ${array2[0]}      # ��һ��Ԫ��
echo ${array2[1]}      # �ڶ���Ԫ��
echo ${array2[2]}      #
                       # ��Ϊ��û�б���ʼ��, ���Դ�ֵΪnull. 
echo ${array2[3]}      # ���ĸ�Ԫ��


exit 0
