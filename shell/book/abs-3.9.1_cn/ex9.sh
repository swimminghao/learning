#!/bin/bash

# ������ֵ���滻

a=375
hello=$a

#-------------------------------------------------------------------------
# ǿ��ע��, �ڸ�ֵ�ĵ�ʱ��, �Ⱥ�ǰ��һ����Ҫ�пո�.
# ������ֿո����ô��?

#  "VARIABLE =value"
#           ^
#% �ű�����������һ��"VARIABLE"������, ����һ��"=value"����.

#  "VARIABLE= value"
#            ^
#% �ű�����������һ��"value"������, 
#+ ���Ҵ���һ������ֵ��""�Ļ�������"VARIABLE". 
#-------------------------------------------------------------------------


echo hello    # û�б�������, ֻ�Ǹ�hello�ַ���.

echo $hello
echo ${hello} # ͬ��.

echo "$hello"
echo "${hello}"

echo

hello="A B  C   D"
echo $hello   # A B C D
echo "$hello" # A B  C   D
# �����㿴����echo $hello   ��    echo "$hello"   ��������ͬ�Ľ��.
# ===============================================================
# ����һ���������������еĿհ�, ��Ȼ, ����Ǳ����滻�Ͳ��ᱣ����.
# ===============================================================

echo

echo '$hello'  # $hello
#    ^      ^
#  ȫ���õ����ý��ᵼ��"$"������Ϊ�������ַ�,
#+ �����Ǳ���ǰ׺. 

# ע�������������������Ĳ�ͬ��Ч��.


hello=    # ����Ϊ��ֵ.
echo "\$hello (null value) = $hello"
#  ע������һ������Ϊnull, ��unset�������, ������һ����
#+ ��Ȼ���յĽ����ͬ(������±�).

# --------------------------------------------------------------

#  ������ͬһ�������ö������, 
#+ ���Ǳ����Կհ׽��зָ�.
#  ����, ��ô���ή�Ϳɶ���, ���Ҳ�����ֲ.

var1=21  var2=22  var3=$V3
echo
echo "var1=$var1   var2=$var2   var3=$var3"

# ���ϰ汾��"sh"�Ͽ��ܻ���������.

# --------------------------------------------------------------

echo; echo

numbers="one two three"
#           ^   ^
other_numbers="1 2 3"
#               ^ ^
#  ����ڱ����д��ڿհ�, If there is whitespace embedded within a variable,
#+ ��ô�ͱ����������.
#  other_numbers=1 2 3                  # ����һ��������Ϣ. 
echo "numbers = $numbers"
echo "other_numbers = $other_numbers"   # other_numbers = 1 2 3
#  ����Ҳ���Բ��ý��հ�ת��ķ���.
mixed_bag=2\ ---\ Whatever
#           ^    ^ ��ת�����ߵĿո�(\).

echo "$mixed_bag"         # 2 --- Whatever

echo; echo

echo "uninitialized_variable = $uninitialized_variable"
# Uninitialized����Ϊnull(����û��ֵ). 
uninitialized_variable=   #  ����, ����û�г�ʼ���������, 
                          #+ ��ʵ��ǰ������Ϊ��ֵ��������һ����. 
echo "uninitialized_variable = $uninitialized_variable"
                          # ����һ����ֵ.

uninitialized_variable=23       # ��ֵ.
unset uninitialized_variable    # Unset�������.
echo "uninitialized_variable = $uninitialized_variable"
                                # ����һ����ֵ.
echo

exit 0
