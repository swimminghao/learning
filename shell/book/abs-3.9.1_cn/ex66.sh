#!/bin/bash


area[11]=23
area[13]=37
area[51]=UFOs

#  �����Ա��һ���ǵ������ڻ�������. 

#  ����Ĳ��ֳ�Ա���Բ�����ʼ��. 
#  �����������ȱԪ��. 
#  ʵ����, ������ϡ�����ݵ�����("ϡ������")
#+ �ڵ��ӱ����������Ƿǳ����õ�. 


echo -n "area[11] = "
echo ${area[11]}    #  ��Ҫ{������}. 

echo -n "area[13] = "
echo ${area[13]}

echo "Contents of area[51] are ${area[51]}."

# û����ʼ���������Ա��ӡΪ��ֵ(null����). 
echo -n "area[43] = "
echo ${area[43]}
echo "(area[43] unassigned)"

echo

# ��������Ԫ�صĺͱ���ֵ����һ������Ԫ��
area[5]=`expr ${area[11]} + ${area[13]}`
echo "area[5] = area[11] + area[13]"
echo -n "area[5] = "
echo ${area[5]}

area[6]=`expr ${area[11]} + ${area[51]}`
echo "area[6] = area[11] + area[51]"
echo -n "area[6] = "
echo ${area[6]}
# �����ʧ��, ����Ϊ�������������ַ������. 

echo; echo; echo

# -----------------------------------------------------------------
# ��һ������, "area2".
# ��һ�ָ����������ֵ�ķ���...
# array_name=( XXX YYY ZZZ ... )

area2=( zero one two three four )

echo -n "area2[0] = "
echo ${area2[0]}
# ����, ��0��ʼ���������±�(Ҳ��������ĵ�һ��Ԫ��Ϊ[0], ������[1]). 

echo -n "area2[1] = "
echo ${area2[1]}    # [1]������ĵ�2��Ԫ��. 
# -----------------------------------------------------------------

echo; echo; echo

# -----------------------------------------------
# ��3������, "area3".
# ��3�ָ�����Ԫ�ظ�ֵ�ķ���...
# array_name=([xx]=XXX [yy]=YYY ...)

area3=([17]=seventeen [24]=twenty-four)

echo -n "area3[17] = "
echo ${area3[17]}

echo -n "area3[24] = "
echo ${area3[24]}
# -----------------------------------------------

exit 0
