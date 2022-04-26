#!/bin/bash
# numbers.sh: ���ֲ�ͬ���Ƶ����ֱ�ʾ��.

# 10����: Ĭ�����
let "dec = 32"
echo "decimal number = $dec"             # 32
# ��ûʲô�ر��.


# 8����: ��'0'(��)��ͷ 
let "oct = 032"
echo "octal number = $oct"               # 26
# ���ʽ�������10���Ʊ�ʾ��.
# ---------------------------

# 16����: ��'0x'����'0X'��ͷ������
let "hex = 0x32"
echo "hexadecimal number = $hex"         # 50
# ���ʽ�������10���Ʊ�ʾ��.

# ��������: BASE#NUMBER
# BASE�ķ�Χ��2��64֮��.
# NUMBER��ֵ����ʹ��BASE��Χ�ڵķ�������ʾ, ���忴�±ߵ�ʾ��. 


let "bin = 2#111100111001101"
echo "binary number = $bin"              # 31181

let "b32 = 32#77"
echo "base-32 number = $b32"             # 231

let "b64 = 64#@_"
echo "base-64 number = $b64"             # 4031
# �����ʾ��ֻ�ܹ��������޵�ASCII�ַ���Χ(2 - 64).
# 10������ + 26��Сд��ĸ + 26����д�ַ� + @ + _


echo

echo $((36#zz)) $((2#10101010)) $((16#AF16)) $((53#1aA))
                                         # 1295 170 44822 3375


#  ��Ҫ��ע������:
#  ---------------
#  ʹ��һ�������������Ƶ����ֵĻ�, 
#+ ��������һ������. 

let "bad_oct = 081"
# (���ֵ�) ������Ϣ���:
#  bad_oct = 081: value too great for base (error token is "081")
#              Octal numbers use only digits in the range 0 - 7.

exit 0       # ��л, Rich Bartell �� Stephane Chazelas��ָ��. 
