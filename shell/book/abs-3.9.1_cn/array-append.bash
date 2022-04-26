#! /bin/bash
# array-append.bash

# Copyright (c) Michael S. Zick, 2003, All rights reserved.
# License: Unrestricted reuse in any form, for any purpose.
# Version: $ID$
#
# �ڸ�ʽ��, ��M.C����һЩ�޸�. 


# ���������Bash���е�����. 
# ��ͳ��UNIX /bin/shȱ�����ƵĹ���. 


#  ������ű������ͨ���ܵ����ݸ�'more', 
#+ ��ô����Ŀ���Ƿ�ֹ��������ݳ����ն��ܹ���ʾ�ķ�Χ. 


# ����ʹ���±�. 
declare -a array1=( zero1 one1 two1 )
# �����д��ڿ�ȱ��Ԫ��([1]δ����). 
declare -a array2=( [0]=zero2 [2]=two2 [3]=three2 )

echo
echo '- Confirm that the array is really subscript sparse. -'
echo "Number of elements: 4"        # ����Ϊ����ʾ, ���Ծ�д����. 
for (( i = 0 ; i < 4 ; i++ ))
do
    echo "Element [$i]: ${array2[$i]}"
done
# Ҳ���Բο�һ����ͨ�õ�����, basics-reviewed.bash. 


declare -a dest

# ����������ϲ�(����)����3������. 
echo
echo 'Conditions: Unquoted, default IFS, All-Elements-Of operator'
echo '- Undefined elements not present, subscripts not maintained. -'
# # ��Щδ�����Ԫ�ز������; ���ʱ�ᶪ����ЩԪ��. 

dest=( ${array1[@]} ${array2[@]} )
# dest=${array1[@]}${array2[@]}     # ������ֵĽ��, �����Ǹ�bug. 

# ����, ��ӡ���. 
echo
echo '- - Testing Array Append - -'
cnt=${#dest[@]}

echo "Number of elements: $cnt"
for (( i = 0 ; i < cnt ; i++ ))
do
    echo "Element [$i]: ${dest[$i]}"
done

# �����鸳ֵ��һ�������е�Ԫ��(����). 
dest[0]=${array1[@]}
dest[1]=${array2[@]}

# ��ӡ���. 
echo
echo '- - Testing modified array - -'
cnt=${#dest[@]}

echo "Number of elements: $cnt"
for (( i = 0 ; i < cnt ; i++ ))
do
    echo "Element [$i]: ${dest[$i]}"
done

# ���ڶ���Ԫ�ص��޸�״��. 
echo
echo '- - Reassign and list second element - -'

declare -a subArray=${dest[1]}
cnt=${#subArray[@]}

echo "Number of elements: $cnt"
for (( i = 0 ; i < cnt ; i++ ))
do
    echo "Element [$i]: ${subArray[$i]}"
done

#  �����ʹ��'=${ ... }'��ʽ
#+ ��һ�����鸳ֵ����һ�������һ��Ԫ����, 
#+ ��ô������������Ԫ�ض��ᱻת��Ϊһ���ַ���, 
#+ ����ַ����е�ÿ������Ԫ�ض��Կո���зָ�(��ʵ��IFS�ĵ�һ���ַ�). 

# ���ԭ�������е�����Ԫ�ض��������հ׷� . . .
# ���ԭ���������±궼�������� . . .
# ��ô���ǾͿ��Խ�ԭ����������лָ�. 

# ���޸Ĺ��ĵڶ���Ԫ����, ��ԭ��������ָ�����. 
echo
echo '- - Listing restored element - -'

declare -a subArray=( ${dest[1]} )
cnt=${#subArray[@]}

echo "Number of elements: $cnt"
for (( i = 0 ; i < cnt ; i++ ))
do
    echo "Element [$i]: ${subArray[$i]}"
done
echo '- - Do not depend on this behavior. - -'
echo '- - This behavior is subject to change - -'
echo '- - in versions of Bash newer than version 2.05b - -'

# MSZ: ��Ǹ, ֮ǰ������һЩҪ��(����ע: ָ���Ǳ�����ǰ�İ汾). 

exit 0
