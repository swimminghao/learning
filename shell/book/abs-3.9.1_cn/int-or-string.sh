#!/bin/bash
# int-or-string.sh: ���ͻ����ַ���?

a=2334                   # ����.
let "a += 1"
echo "a = $a "           # a = 2335
echo                     # ��������.


b=${a/23/BB}             # ��"23"�滻��"BB".
                         # �⽫�ѱ���b�����ͱ�Ϊ�ַ���.
echo "b = $b"            # b = BB35
declare -i b             # ��ʹʹ��declare����Ҳ����Դ����κΰ���.
echo "b = $b"            # b = BB35

let "b += 1"             # BB35 + 1 =
echo "b = $b"            # b = 1
echo

c=BB34
echo "c = $c"            # c = BB34
d=${c/BB/23}             # ��"BB"�滻��"23".
                         # ��ʹ�ñ���$d��Ϊһ������.
echo "d = $d"            # d = 2334
let "d += 1"             # 2334 + 1 =
echo "d = $d"            # d = 2335
echo

# null�����������?
e=""
echo "e = $e"            # e =
let "e += 1"             # ������������һ��null����?
echo "e = $e"            # e = 1
echo                     # null��������ת����һ�����ͱ���.

# ���û����������������?
echo "f = $f"            # f =
let "f += 1"             # ����������ͨ��ô?
echo "f = $f"            # f = 1
echo                     # δ�����ı�����ת����һ�����ͱ���.



# ����˵Bash�еı������ǲ��������͵�.

exit 0
