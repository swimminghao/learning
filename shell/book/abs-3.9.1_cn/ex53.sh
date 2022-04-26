#!/bin/bash
# ʹ��"seq"

echo

for a in `seq 80`  # or   for a in $( seq 80 )
# ��	for a in 1 2 3 4 5 ... 80   ��ͬ(�����˺ö���!).
# Ҳ����ʹ��'jot'(���ϵͳ���еĻ�). 
do
  echo -n "$a "
done      # 1 2 3 4 5 ... 80
# ��Ҳ��һ��ͨ��ʹ���������
# ������"for"ѭ����[list]�б������. 

echo; echo


COUNT=80  # ��Ȼ, 'seq'Ҳ����ʹ��һ�����滻�Ĳ���.

for a in `seq $COUNT`  # ����   for a in $( seq $COUNT )
do
  echo -n "$a "
done      # 1 2 3 4 5 ... 80

echo; echo

BEGIN=75
END=80

for a in `seq $BEGIN $END`
#  ����"seq"��������, �ӵ�һ��������ʼ����,
#+ һֱ�������ڶ�������Ϊֹ. 
do
  echo -n "$a "
done      # 75 76 77 78 79 80

echo; echo

BEGIN=45
INTERVAL=5
END=80

for a in `seq $BEGIN $INTERVAL $END`
#  ����"seq"��������, �ӵ�һ��������ʼ����, 
#+ ���Եڶ���������Ϊ����, 
#+ һֱ����������������Ϊֹ. 
do
  echo -n "$a "
done      # 45 50 55 60 65 70 75 80

echo; echo

exit 0
