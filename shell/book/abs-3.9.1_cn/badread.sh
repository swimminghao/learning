#!/bin/bash
#  badread.sh:
#  ����ʹ��'echo'��'read'����
#+ �ǽ����ĸ�������ֵ. 

a=aaa
b=bbb
c=ccc

echo "one two three" | read a b c
# �������¸�����a, b, ��c��ֵ.

echo
echo "a = $a"  # a = aaa
echo "b = $b"  # b = bbb
echo "c = $c"  # c = ccc
# ���¸�ֵʧ��. 

# ------------------------------

# �����±����ַ���. 

var=`echo "one two three"`
set -- $var
a=$1; b=$2; c=$3

echo "-------"
echo "a = $a"  # a = one
echo "b = $b"  # b = two
echo "c = $c"  # c = three 
# ���¸�ֵ�ɹ�. 

# ------------------------------

#  Ҳ��ע��, echo��'read'��ֵֻ������shell��������. 
#  ����, ������ֵ*ֻ*������shell�б��޸�. 

a=aaa          # ���¿�ʼ. 
b=bbb
c=ccc

echo; echo
echo "one two three" | ( read a b c;
echo "Inside subshell: "; echo "a = $a"; echo "b = $b"; echo "c = $c" )
# a = one
# b = two
# c = three
echo "-----------------"
echo "Outside subshell: "
echo "a = $a"  # a = aaa
echo "b = $b"  # b = bbb
echo "c = $c"  # c = ccc
echo

exit 0
