#!/bin/bash
# weirdvars.sh: echo��һЩ�������.

var="'(]\\{}\$\""
echo $var        # '(]\{}$"
echo "$var"      # '(]\{}$"     ����һ��ûʲô����.Doesn't make a difference.

echo

IFS='\'
echo $var        # '(] {}$"     \ �ַ����հ׷��滻��, Ϊʲô?
echo "$var"      # '(]\{}$"

# ���������Stephane Chazelas�ṩ.

exit 0
