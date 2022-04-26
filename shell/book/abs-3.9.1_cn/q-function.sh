#!/bin/bash

# Douglas Hofstadter�������ǽ������"Q-series":

# Q(1) = Q(2) = 1
# Q(n) = Q(n - Q(n-1)) + Q(n - Q(n-2)), ��n&gt;2ʱ

# ����һ�����˸е�İ����, û�й��ɵ�"����"��������. 
# ���е�ͷ20��, ������ʾ: 
# 1 1 2 3 3 4 5 5 6 6 6 8 8 8 10 9 10 11 11 12 

#  ��ο�����鼮, Hofstadter��, "_Goedel, Escher, Bach: An Eternal Golden Braid_",
#+ ��137ҳ. 


LIMIT=100     # ��Ҫ��������г���. 
LINEWIDTH=20  # ÿ�д�ӡ�ĸ���. 

Q[1]=1        # ���е�ͷ���Ϊ1. 
Q[2]=1

echo
echo "Q-series [$LIMIT terms]:"
echo -n "${Q[1]} "             # �������ͷ����. 
echo -n "${Q[2]} "

for ((n=3; n <= $LIMIT; n++))  # C����ѭ������. 
do   # Q[n] = Q[n - Q[n-1]] + Q[n - Q[n-2]]  ��n&gt;2ʱ
#  ��Ҫ�����ʽ��, �ֲ�����, 
#+ ��ΪBash���ܹ��ܺõĴ������������������. 

  let "n1 = $n - 1"        # n-1
  let "n2 = $n - 2"        # n-2
  
  t0=`expr $n - ${Q[n1]}`  # n - Q[n-1]
  t1=`expr $n - ${Q[n2]}`  # n - Q[n-2]
  
  T0=${Q[t0]}              # Q[n - Q[n-1]]
  T1=${Q[t1]}              # Q[n - Q[n-2]]

Q[n]=`expr $T0 + $T1`      # Q[n - Q[n-1]] + Q[n - Q[n-2]]
echo -n "${Q[n]} "

if [ `expr $n % $LINEWIDTH` -eq 0 ]    # ��ʽ�����. 
then   #      ^ ȡģ����
  echo # ��ÿ�ж���Ϊ20�����ֵ�С��. 
fi

done

echo

exit 0

# ����Q-series��һ������ʵ��. 
# ��ֱ�����˵�ʵ����ʹ�õݹ�, �������Ϊ��ϰ���. 
# ����: ʹ�õݹ�ķ���������������еĻ�, �Ứ�ѷǳ�����ʱ��. 
