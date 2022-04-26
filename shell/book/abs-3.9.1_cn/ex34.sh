#!/bin/bash

# script "set-test"

# ʹ��3�������в�������������ű�,
# ����, "./set-test one two three".

echo
echo "Positional parameters before  set \`uname -a\` :"
echo "Command-line argument #1 = $1"
echo "Command-line argument #2 = $2"
echo "Command-line argument #3 = $3"


set `uname -a` # ��`uname -a`�������������
               # Ϊ�µ�λ�ò���.

echo $_        # unknown(����ע: ��Ҫ�����uname -a�����,����ӡ���ľ�����������һ������.)
# �ڽű������ñ�־.

echo "Positional parameters after  set \`uname -a\` :"
# $1, $2, $3, �ȵ�. ��Щλ�ò����������³�ʼ��Ϊ`uname -a`�Ľ��
echo "Field #1 of 'uname -a' = $1"
echo "Field #2 of 'uname -a' = $2"
echo "Field #3 of 'uname -a' = $3"
echo ---
echo $_        # ---
echo

exit 0
