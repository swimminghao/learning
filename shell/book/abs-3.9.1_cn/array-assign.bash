#! /bin/bash
# array-assign.bash

#  ���������Bash�����е�, 
#+ ���Բ�ʹ��".bash"��Ϊ�ű���չ��. 

# Copyright (c) Michael S. Zick, 2003, All rights reserved.
# License: Unrestricted reuse in any form, for any purpose.
# Version: $ID$
#
# ˵����ע����William Park�����. 

#  ����Stephane Chazelas���ṩ��
#+ �����ڱ����е�һ������. 

# 'times'����������ʽ: 
# User CPU &lt;space&gt; System CPU
# User CPU of dead children &lt;space&gt; System CPU of dead children

#  Bash�����ַ���, 
#+ ���Խ�һ�����������Ԫ�ض���ֵ��һ���µ��������. 
#  ��2.04, 2.05a��2.05b�汾��Bash��, 
#+ �����ַ������ᶪ�������е�"������"(nullֵ)Ԫ��. 
#  ��һ�ָ����鸳ֵ�ķ������ᱻ��ӵ��°汾��Bash��, 
#+ ���ַ�������[subscript]=value��ʽ, ��ά�������±���Ԫ��ֵ֮��Ĺ�ϵ. 

#  ����ʹ���ڲ�����������һ��������, 
#+ ��Ȼ, ����һ��������ǧԪ���������������
#+ Ҳ�ܺܺõ��������. 

declare -a bigOne=( /dev/* )
echo
echo 'Conditions: Unquoted, default IFS, All-Elements-Of'
echo "Number of elements in array is ${#bigOne[@]}"

# set -vx



echo
echo '- - testing: =( ${array[@]} ) - -'
times
declare -a bigTwo=( ${bigOne[@]} )
#                 ^              ^
times

echo
echo '- - testing: =${array[@]} - -'
times
declare -a bigThree=${bigOne[@]}
# ���û������. 
times

#  ����Stephane Chazelas��ָ����, ͨ���Ƚ�, 
#+ �����˽⵽�ڶ��ָ�ʽ�ĸ�ֵ�ȵ������������ʽ����. 
#
#  William Park����: 
#+ ����bigTwo����Ϊһ�������ַ�������ֵ��, 
#+ ������bigThree, ����һ��Ԫ��һ��Ԫ�ؽ��еĸ�ֵ. 
#  ����, ʵ������: 
#                   bigTwo=( [0]="... ... ..." )
#                   bigThree=( [0]="..." [1]="..." [2]="..." ... )


#  �ڱ����������, �һ��ǻ����ʹ�õ�һ����ʽ, 
#+ ��Ϊ����Ϊ������ʽ�������ڽ�����������. 

#  ������ʹ�õ�������, �����и��õĲ���, 
#+ ����ʹ���˵ڶ�����ʽ, ������Ϊ������ʽ����. 

# MSZ: �ܱ�Ǹ���ȵ����(����: Ӧ��ָ������ϰ汾). 


#  ע������:
#  ---------
#  31�к�43�е�"declare -a"�����ʵ���Ǳ����, 
#+ ��ΪArray=( ... )��ʽ
#+ ֻ���������鸳ֵ. 
#  Ȼ��, ���ʡ����Щ�����Ļ�, 
#+ �ᵼ�½ű���ߵ���ز�������. 
#  ��һ��, ����������ʲô. 

exit 0
