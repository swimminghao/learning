#!/bin/bash
# pr-ascii.sh: ��ӡASCII����ַ���. 

START=33   # �ɴ�ӡ��ASCII�ַ��ķ�Χ(ʮ����). 
END=125

echo " Decimal   Hex     Character"   # ��ͷ. 
echo " -------   ---     ---------"

for ((i=START; i<=END; i++))
do
  echo $i | awk '{printf("  %3d       %2x         %c\n", $1, $1, $1)}'
# ��������������, ��������Bash�ڽ���printf����: 
#     printf "%c" "$i"
done

exit 0


#  ʮ����   16����     �ַ�
#  -------  ------   ---------
#    33       21         !
#    34       22         "
#    35       23         #
#    36       24         $
#
#    . . .
#
#   122       7a         z
#   123       7b         {
#   124       7c         |
#   125       7d         }


#  ���ű�������ض���һ���ļ���, 
#+ ����ͨ���ܵ����ݸ�"more":  sh pr-asc.sh | more
