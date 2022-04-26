#!/bin/bash

# չʾһЩʹ��'expr'������
# ========================

echo

# ���� ����
# ---- ----

echo "Arithmetic Operators"
echo
a=`expr 5 + 3`
echo "5 + 3 = $a"

a=`expr $a + 1`
echo
echo "a + 1 = $a"
echo "(incrementing a variable)"

a=`expr 5 % 3`
# ȡģ����
echo
echo "5 mod 3 = $a"

echo
echo

# �߼� ����
# ---- ----

#  true����1, false����0,
#+ ��Bash��ʹ�ù������෴.

echo "Logical Operators"
echo

x=24
y=25
b=`expr $x = $y`         # �������.
echo "b = $b"            # 0  ( $x -ne $y )
echo

a=3
b=`expr $a \> 10`
echo 'b=`expr $a \> 10`, therefore...'
echo "If a > 10, b = 0 (false)"
echo "b = $b"            # 0  ( 3 ! -gt 10 )
echo

b=`expr $a \< 10`
echo "If a < 10, b = 1 (true)"
echo "b = $b"            # 1  ( 3 -lt 10 )
echo
# ע��ת�����.

b=`expr $a \<= 3`
echo "If a <= 3, b = 1 (true)"
echo "b = $b"            # 1  ( 3 -le 3 )
# Ҳ�� "\>=" ���� (���ڵ���).


echo
echo



# �ַ��� ����
# ------ ----

echo "String Operators"
echo

a=1234zipper43231
echo "The string being operated upon is \"$a\"."

# ����: �ַ�������
b=`expr length $a`
echo "Length of \"$a\" is $b."

# ����: ���ַ����Ŀ�ͷ����ƥ����Ӵ�,
#       ��ȡ�õ�һ��ƥ���Ӵ���λ��.
b=`expr index $a 23`
echo "Numerical position of first \"2\" in \"$a\" is \"$b\"."

# substr: ��ָ��λ����ȡָ�����ȵ��ִ�.
b=`expr substr $a 2 6`
echo "Substring of \"$a\", starting at position 2,\
and 6 chars long is \"$b\"."


#  'match' ������Ĭ����Ϊ���Ǵ��ַ����Ŀ�ʼ��������,
#+  ��ƥ���һ��ƥ����ַ���.
#
#        ʹ��������ʽ
b=`expr match "$a" '[0-9]*'`               #  ���ֵĸ���.
echo Number of digits at the beginning of \"$a\" is $b.
b=`expr match "$a" '\([0-9]*\)'`           #  ע��, ��Ҫת������
#                   ==      ==              + �������ܴ����Ӵ���ƥ��.
echo "The digits at the beginning of \"$a\" are \"$b\"."

echo

exit 0
