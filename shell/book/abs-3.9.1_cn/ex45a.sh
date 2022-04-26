#!/bin/bash

echo
echo "String operations using \"expr \$string : \" construct"
echo "==================================================="
echo

a=1234zipper5FLIPPER43231

echo "The string being operated upon is \"`expr "$a" : '\(.*\)'`\"."
#     ת�����ŶԵĲ���.						            ==  ==

#       ***************************
#+				ת�����Ŷ�
#+           ����ƥ��һ���Ӵ�
#       ***************************


#  �����ת�����ŵĻ�...
#+ ��ô'expr'����string����ת��Ϊһ������.

echo "Length of \"$a\" is `expr "$a" : '.*'`."   # �ַ�������

echo "Number of digits at the beginning of \"$a\" is `expr "$a" : '[0-9]*'`."

# ------------------------------------------------------------------------- #

echo

echo "The digits at the beginning of \"$a\" are `expr "$a" : '\([0-9]*\)'`."
#                                                             ==      ==
echo "The first 7 characters of \"$a\" are `expr "$a" : '\(.......\)'`."
#         =====                                          ==       ==
# ����һ��, ת�����Ŷ�ǿ��һ���Ӵ�ƥ��.
#
echo "The last 7 characters of \"$a\" are `expr "$a" : '.*\(.......\)'`."
#         ====                  �ַ��������Ľ�β		^^
#  (������ģʽ����˼�Ǻ���ǰ�ߵ��κ��ַ�,ֱ�����7���ַ�,
#+  ���7���������Ҫƥ�������7���ַ����ִ�)

echo

exit 0
