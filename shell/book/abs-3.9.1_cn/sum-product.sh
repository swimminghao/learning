#!/bin/bash
# sum-product.sh
# ����"����"����һ��ֵ�ĺ���. 

sum_and_product ()   # �������д��ݽ����Ĳ������ܺ�, ���ܳ˻�. 
{
  echo $(( $1 + $2 )) $(( $1 * $2 ))
# ��ÿ����������Ľ�������stdout, ���Կո�ָ�. 
}

echo
echo "Enter first number "
read first

echo
echo "Enter second number "
read second
echo

retval=`sum_and_product $first $second`      # �������������ֵ������. 
sum=`echo "$retval" | awk '{print $1}'`      # ��ֵ��һ����. 
product=`echo "$retval" | awk '{print $2}'`  # ��ֵ�ڶ�����. 

echo "$first + $second = $sum"
echo "$first * $second = $product"
echo

exit 0
