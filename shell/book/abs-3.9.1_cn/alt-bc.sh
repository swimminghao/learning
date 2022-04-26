#!/bin/bash
# ʹ�������滻������'bc'
# ����'here document'����. 


var1=`bc << EOF
18.33 * 19.78
EOF
`
echo $var1       # 362.56


#  ʹ��$( ... )���ֱ�Ƿ�Ҳ����. 
v1=23.53
v2=17.881
v3=83.501
v4=171.63

var2=$(bc << EOF
scale = 4
a = ( $v1 + $v2 )
b = ( $v3 * $v4 )
a * b + 15.35
EOF
)
echo $var2       # 593487.8452


var3=$(bc -l << EOF
scale = 9
s ( 1.7 )
EOF
)
# ���ػ���Ϊ1.7������. 
# "-l"ѡ������'bc'������. 
echo $var3       # .991664810


# ����, �ں�������һ��...
hyp=             # ����ȫ�ֱ���. 
hypotenuse ()    # ����ֱ�������ε�б��. 
{
hyp=$(bc -l << EOF
scale = 9
sqrt ( $1 * $1 + $2 * $2 )
EOF
)
# ���ҵ���, ���ܴ�bash�����з��ظ���ֵ. 
}

hypotenuse 3.68 7.31
echo "hypotenuse = $hyp"    # 8.184039344


exit 0
