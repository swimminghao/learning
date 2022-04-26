#!/bin/bash
# monthlypmt.sh: ���㰴�³������������. 


#  ��ݴ�����һ���޸İ汾, ԭʼ�汾��"mcalc"(�������)����, 
#+ �������������Jeff Schmidt��Mendel Cooper(��������). 
#   http://www.ibiblio.org/pub/Linux/apps/financial/mcalc-1.6.tar.gz  [15k]

echo
echo "Given the principal, interest rate, and term of a mortgage,"
echo "calculate the monthly payment."

bottom=1.0

echo
echo -n "Enter principal (no commas) "
read principal
echo -n "Enter interest rate (percent) "  # �����12%, �Ǿͼ���"12", ������".12". 
read interest_r
echo -n "Enter term (months) "
read term


 interest_r=$(echo "scale=9; $interest_r/100.0" | bc) # ת����С��. 
                 # "scale"ָ������Ч���ֵĸ���.
  

 interest_rate=$(echo "scale=9; $interest_r/12 + 1.0" | bc)
 

 top=$(echo "scale=9; $principal*$interest_rate^$term" | bc)

 echo; echo "Please be patient. This may take a while."

 let "months = $term - 1"
# ==================================================================== 
 for ((x=$months; x > 0; x--))
 do
   bot=$(echo "scale=9; $interest_rate^$x" | bc)
   bottom=$(echo "scale=9; $bottom+$bot" | bc)
#  bottom = $(($bottom + $bot"))
 done
# ==================================================================== 

# -------------------------------------------------------------------- 
#  Rick Boivie������һ�����ϱ�ѭ�����޸ķ���, 
#+ ����޸ĸ�����Ч��, �����ʡ���2/3��ʱ��. 

# for ((x=1; x <= $months; x++))
# do
#   bottom=$(echo "scale=9; $bottom * $interest_rate + 1" | bc)
# done


#  Ȼ�����������һ��������Ч�ʵİ汾, 
#+ �����ʡ95%��ʱ��! 

# bottom=`{
#     echo "scale=9; bottom=$bottom; interest_rate=$interest_rate"
#     for ((x=1; x <= $months; x++))
#     do
#          echo 'bottom = bottom * interest_rate + 1'
#     done
#     echo 'bottom'
#     } | bc`       # �������滻��Ƕ��һ��'forѭ��'. 
# --------------------------------------------------------------------------
#  ��һ����, Frank Wang����: 
#  bottom=$(echo "scale=9; ($interest_rate^$term-1)/($interest_rate-1)" | bc)

#  ��Ϊ . . .
#  ��ѭ����ߵ��㷨
#+ ��ʵ����һ���ȱ����е���͹�ʽ. 
#  ��͹�ʽ�� e0(1-q^n)/(1-q), 
#+ e0�ǵ�һ��Ԫ��, q=e(n+1)/e(n), 
#+ n��Ԫ������.
# --------------------------------------------------------------------------


 # let "payment = $top/$bottom"
 payment=$(echo "scale=2; $top/$bottom" | bc)
 # ʹ��2λ��Ч��������ʾ��Ԫ������. 
 
 echo
 echo "monthly payment = \$$payment"  # ���ܺ͵�ǰ����ʾ��Ԫ����. 
 echo


 exit 0


 # ��ϰ: 
 #   1) �������������������еĶ���. 
 #   2) �������������հٷֺź�С�������ʽ��������. 
 #   3) �����������úñ�д����ű�, 
 #      ��ô����չ����ű������ܹ���ӡ�������ķ��ڸ����. 
