#!/bin/bash
# "����"����

echo

# ����ʲôʱ����"����"��, ����ǰ������$��ʱ��?
# ��������ֵ��ʱ��, �����Ǳ����õ�ʱ��.

# ��ֵ
a=879
echo "The value of \"a\" is $a."

# ʹ��'let'��ֵ
let a=16+5
echo "The value of \"a\" is now $a."

echo

# ��'for'ѭ����(��ʵ��, ����һ��α��ֵ):
echo -n "Values of \"a\" in the loop are: "
for a in 7 8 9 11
do
  echo -n "$a "
done

echo
echo

# ʹ��'read'������и�ֵ(��Ҳ��һ�ָ�ֵ������):
echo -n "Enter \"a\" "
read a
echo "The value of \"a\" is now $a."

echo

exit 0
