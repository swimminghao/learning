#!/bin/bash
# RANDOM�����ж����?

RANDOM=$$       # ʹ�ýű��Ľ���ID����Ϊ�����������.

PIPS=6          # һ��������6����.
MAXTHROWS=600   # �����û�������, �������������ֵ.
throw=0         # �����ӵĴ���.

ones=0          #  ��������е�count����ʼ��Ϊ0,
twos=0          #+ ��Ϊδ��ʼ���ı���Ϊnull, ����0.
threes=0
fours=0
fives=0
sixes=0

print_result ()
{
echo
echo "ones =   $ones"
echo "twos =   $twos"
echo "threes = $threes"
echo "fours =  $fours"
echo "fives =  $fives"
echo "sixes =  $sixes"
echo
}

update_count()
{
case "$1" in
  0) let "ones += 1";;   # ��Ϊ����û��"��", ���Ը�1.
  1) let "twos += 1";;   # �������Ϊ2, ���Ҳһ��.
  2) let "threes += 1";;
  3) let "fours += 1";;
  4) let "fives += 1";;
  5) let "sixes += 1";;
esac
}

echo


while [ "$throw" -lt "$MAXTHROWS" ]
do
  let "die1 = RANDOM % $PIPS"
  update_count $die1
  let "throw += 1"
done  

print_result

exit 0

#  ���RANDOM�����������, ��ôҡ�������Ӧ����ƽ����.
#  ��$MAXTHROWS��Ϊ600, ��ôÿ����Ӧ����100, ���µĳ��벻Ӧ�ó���20.
#
#  ��סRANDOM�Ͼ���һ��α�����,
#+ ���Ҳ���ʮ������.

#  �������������һ��ʮ����²����ӵ�����.
#  �㹻�����������, ������չ�����������µ�һ��,
#+ ͬ��Ҳ��չ���������ȵ�һ��.

# ��ϰ (�ܼ�):
# --------------
# ��д����ű�, ������1000��Ӳ�ҵ���ʽ.
# ��Ϊ"ͷ"��"��"����.
