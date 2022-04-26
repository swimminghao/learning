#!/bin/bash

#  С����:
#  ����㲻�ܹ�ȷ��һ���ض�����������ν����ж�,
#+ ��ô��ʹ��if-test�ṹ. 

echo

echo "Testing \"0\""
if [ 0 ]      # zero
then
  echo "0 is true."
else
  echo "0 is false."
fi            # 0 Ϊ��.

echo

echo "Testing \"1\""
if [ 1 ]      # one
then
  echo "1 is true."
else
  echo "1 is false."
fi            # 1 Ϊ��.

echo

echo "Testing \"-1\""
if [ -1 ]     # ��1
then
  echo "-1 is true."
else
  echo "-1 is false."
fi            # -1 Ϊ��.

echo

echo "Testing \"NULL\""
if [ ]        # NULL (��״̬)
then
  echo "NULL is true."
else
  echo "NULL is false."
fi            # NULL Ϊ��.

echo

echo "Testing \"xyz\""
if [ xyz ]    # �ַ���
then
  echo "Random string is true."
else
  echo "Random string is false."
fi            # ����һ���ַ�Ϊ��.

echo

echo "Testing \"\$xyz\""
if [ $xyz ]   # �ж�$xyz�Ƿ�Ϊnull, ����...
              # ��ֻ��һ��δ��ʼ���ı���.
then
  echo "Uninitialized variable is true."
else
  echo "Uninitialized variable is false."
fi            # δ����ĳ�ʼ��Ϊ��.

echo

echo "Testing \"-n \$xyz\""
if [ -n "$xyz" ]            # ����������������.
then
  echo "Uninitialized variable is true."
else
  echo "Uninitialized variable is false."
fi            # δ��ʼ���ı���Ϊ��.

echo


xyz=          # ��ʼ����, ���Ǹ�nullֵ.

echo "Testing \"-n \$xyz\""
if [ -n "$xyz" ]
then
  echo "Null variable is true."
else
  echo "Null variable is false."
fi            # null����Ϊ��. 


echo


# ʲôʱ��"false"Ϊ��?

echo "Testing \"false\""
if [ "false" ]              #  ������"false"ֻ������һ���ַ�������. 
then
  echo "\"false\" is true." #+ ���������жϵĽ��Ϊ��.
else
  echo "\"false\" is false."
fi            # "false" Ϊ��.

echo

echo "Testing \"\$false\""  # ����һ��, δ��ʼ���ı���.
if [ "$false" ]
then
  echo "\"\$false\" is true."
else
  echo "\"\$false\" is false."
fi            # "$false" Ϊ��.
              # ����, ���ǵõ���Ԥ�ڵĽ��.

#  ������ǲ�������Ϊ��ʼ���ı���"$true"�ᷢ��ʲô��?

echo

exit 0
