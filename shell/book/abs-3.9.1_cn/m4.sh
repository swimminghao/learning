#!/bin/bash
# m4.sh: ʹ��m4�괦����

# �ַ�������
string=abcdA01
echo "len($string)" | m4                           # 7
echo "substr($string,4)" | m4                      # A01
echo "regexp($string,[0-1][0-1],\&amp;Z)" | m4         # 01Z

# ��������
echo "incr(22)" | m4                               # 23
echo "eval(99 / 3)" | m4                           # 33

exit 0
