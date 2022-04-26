#!/bin/bash
# escaped.sh: ת���

echo; echo

echo "\v\v\v\v"      # ���ֵĴ�ӡ\v\v\v\v.
# ʹ��-eѡ���'echo'��������ӡת���.
echo "============="
echo "VERTICAL TABS"
echo -e "\v\v\v\v"   # ��ӡ4����ֱ�Ʊ��.
echo "=============="

echo "QUOTATION MARK"
echo -e "\042"       # ��ӡ" (����, 8���Ƶ�ASCII �����42).
echo "=============="

# ���ʹ��$'\X'�ṹ,��-eѡ��Ͳ���Ҫ��.
echo; echo "NEWLINE AND BEEP"
echo $'\n'           # ����.
echo $'\a'           # ����(����).

echo "==============="
echo "QUOTATION MARKS"
# �汾2�Ժ�Bash����ʹ��$'\nnn'�ṹ.
# ע��������, '\nnn\'��8���Ƶ�ֵ.
echo $'\t \042 \t'   # ��ˮƽ�Ʊ��������������(").

# ��Ȼ,Ҳ����ʹ��16���Ƶ�ֵ,ʹ��$'\xhhh' �ṹ.
echo $'\t \x22 \t'  # ��ˮƽ�Ʊ��������������(").
# ��л, Greg Keraunen, ָ�������.
# ��һ���Bash�汾����'\x022'������ʽ.
echo "==============="
echo


# ����ASCII�ַ���������.
# ----------------------------------------
quote=$'\042'        # " ����ֵ��������.
echo "$quote This is a quoted string, $quote and this lies outside the quotes."

echo

# �����е�������ASCII�ַ�.
triple_underline=$'\137\137\137'  # 137�ǰ˽��Ƶ�'_'.
echo "$triple_underline UNDERLINE $triple_underline"

echo

ABC=$'\101\102\103\010'           # 101, 102, 103�ǰ˽������A, B, C.
echo $ABC

echo; echo

escape=$'\033'                    # 033 �ǰ˽������esc.
echo "\"escape\" echoes as $escape"
#                                   û�б��������.

echo; echo

exit 0
