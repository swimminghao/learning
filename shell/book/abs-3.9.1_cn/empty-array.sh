#!/bin/bash
# empty-array.sh

#  ��лStephane Chazelas����������ӵ�ԭʼ�汾, 
#+ ͬʱ��лMichael Zick�����������������չ. 


# ������������п�Ԫ�ص�����, ���������ͬ. 

array0=( first second third )
array1=( '' )   # "array1"����һ����Ԫ��. 
array2=( )      # û��Ԫ�� . . . "array2"Ϊ��. 

echo
ListArray()
{
echo
echo "Elements in array0:  ${array0[@]}"
echo "Elements in array1:  ${array1[@]}"
echo "Elements in array2:  ${array2[@]}"
echo
echo "Length of first element in array0 = ${#array0}"
echo "Length of first element in array1 = ${#array1}"
echo "Length of first element in array2 = ${#array2}"
echo
echo "Number of elements in array0 = ${#array0[*]}"  # 3
echo "Number of elements in array1 = ${#array1[*]}"  # 1  (����!)
echo "Number of elements in array2 = ${#array2[*]}"  # 0
}

# ===================================================================

ListArray

# ������չ��Щ����. 

# ���һ��Ԫ�ص��������. 
array0=( "${array0[@]}" "new1" )
array1=( "${array1[@]}" "new1" )
array2=( "${array2[@]}" "new1" )

ListArray

# ��
array0[${#array0[*]}]="new2"
array1[${#array1[*]}]="new2"
array2[${#array2[*]}]="new2"

ListArray

# ����㰴���ϱߵķ��������������չ�Ļ�; ����Ƚ���'ջ' 
# �ϱߵĲ�������'ѹջ' 
# ջ'��'Ϊ: 
height=${#array2[@]}
echo
echo "Stack height for array2 = $height"

# '��ջ'����: 
unset array2[${#array2[@]}-1]	#  �����0��ʼ����, 
height=${#array2[@]}            #+ ����ζ�ŵ�һ�������±�Ϊ0. 
echo
echo "POP"
echo "New stack height for array2 = $height"

ListArray

# ֻ�г�����array0�ĵڶ����͵�����Ԫ��.
from=1		# ��0��ʼ����. 
to=2		#
array3=( ${array0[@]:1:2} )
echo
echo "Elements in array3:  ${array3[@]}"

# ����ʽ�������ַ���(�ַ�����). 
# ����������"�ַ���"��ʽ. 

# �滻: 
array4=( ${array0[@]/second/2nd} )
echo
echo "Elements in array4:  ${array4[@]}"

# �滻������ƥ��ͨ������ַ���. 
array5=( ${array0[@]//new?/old} )
echo
echo "Elements in array5:  ${array5[@]}"

# ���㿪ʼ���öԴ��а��յ�ʱ�� . . .
array6=( ${array0[@]#*new} )
echo # ������ܻ�����е�����. 
echo "Elements in array6:  ${array6[@]}"

array7=( ${array0[@]#new1} )
echo # ����array6֮���û�о�����. 
echo "Elements in array7:  ${array7[@]}"

# �������ǳ��� . . .
array8=( ${array0[@]/new1/} )
echo
echo "Elements in array8:  ${array8[@]}"

#  ����, ��������ô������? 

#  ������var[@]�е�ÿ��Ԫ��
#+ �����������ַ�������. 
#  ���: �������ǳ���Ϊ0���ַ���, 
#+ Bash֧���ַ�����������, 
#+ Ԫ�ػ��ڽ����ֵ����ʧ����. 

#  һ������, ��Щ�ַ�����ǿ���û���������? 

zap='new*'
array9=( ${array0[@]/$zap/} )
echo
echo "Elements in array9:  ${array9[@]}"

# ���㻹�ڿ���, ������Kansas�ݺδ�ʱ . . .
array10=( ${array0[@]#$zap} )
echo
echo "Elements in array10:  ${array10[@]}"

# �Ƚ�array7��array10. 
# �Ƚ�array8��array9. 

# ��: ������������. 

exit 0
