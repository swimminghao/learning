#!/bin/bash
# patt-matching.sh

# ʹ��# ## % %%�����в����滻������ģʽƥ��. parameter substitution operators.

var1=abcd12345abc6789
pattern1=a*c  # *(ͨ���)ƥ��a - c֮��������ַ�.

echo
echo "var1 = $var1"           # abcd12345abc6789
echo "var1 = ${var1}"         # abcd12345abc6789
                              # (��һ����ʽ)
echo "Number of characters in ${var1} = ${#var1}"
echo

echo "pattern1 = $pattern1"   # a*c  (ƥ��'a'��'c'֮��������ַ�)
echo "--------------"
echo '${var1#$pattern1}  =' "${var1#$pattern1}"    #         d12345abc6789
# ��̵Ŀ���ƥ��, ȥ��abcd12345abc6789��ǰ3���ַ�.
#                     |-|               ^^^^^
echo '${var1##$pattern1} =' "${var1##$pattern1}"   #                  6789
# ��Ŀ���ƥ��, ȥ��abcd12345abc6789��ǰ12���ַ�
#                     |----------|      ^^^^^^

echo; echo; echo

pattern2=b*9            # ƥ��'b'��'9'֮��������ַ�
echo "var1 = $var1"     # ����abcd12345abc6789
echo
echo "pattern2 = $pattern2"
echo "--------------"
echo '${var1%pattern2}  =' "${var1%$pattern2}"     #     abcd12345a
# ��̵Ŀ���ƥ��, ȥ��abcd12345abc6789�����6���ַ�
#                               |----|  ^^^^^^^
echo '${var1%%pattern2} =' "${var1%%$pattern2}"    #     a
# ��Ŀ���ƥ��, ȥ��abcd12345abc6789�����12���ַ�
#                      |-------------|  ^^^^^^^^

# �μ�, #��##�Ǵ��ַ�����߿�ʼ, ����ȥ����ߵ��ַ���, 
#       %��%%���ַ������ұ߿�ʼ, ����ȥ���ұߵ��ַ���. 
# (����ע: �и��üǵķ���, �Ǿ��ǲ쿴����˳��, ��ס#��%�����. ^_^)
echo

exit 0
