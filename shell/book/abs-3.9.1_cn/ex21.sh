#!/bin/bash

# ÿ�ε���$RANDOM���᷵�ز�ͬ���������. 
# һ�㷶ΧΪ: 0 - 32767 (�з��ŵ�16-bit����).

MAXCOUNT=10
count=1

echo
echo "$MAXCOUNT random numbers:"
echo "-----------------"
while [ "$count" -le $MAXCOUNT ]      # ����10 ($MAXCOUNT)���������.
do
  number=$RANDOM
  echo $number
  let "count += 1"  # ���Ӽ���.
done
echo "-----------------"

# �������Ҫ���ض���Χ�ڲ����������, ��ôʹ��'modulo'(ģ)����.(����ע: ��ʵ��, �ⲻ��һ���ǳ��õİ취. ���ɼ�man 3 rand)
# ȡģ�����᷵�س���������.

RANGE=500

echo

number=$RANDOM
let "number %= $RANGE"
#           ^^
echo "Random number less than $RANGE  ---  $number"

echo



#  �������Ҫ����һ������ĳ�����޵��������.
#+ ��ô����һ��testѭ������������С�ڴ�����ֵ������. 

FLOOR=200

number=0   #��ʼ��
while [ "$number" -le $FLOOR ]
do
  number=$RANDOM
done
echo "Random number greater than $FLOOR ---  $number"
echo

   # �����Ƕ��ϱߵ�ѭ������һ��С�Ķ�, ����:
   #       let "number = $RANDOM + $FLOOR"
   # �⽫������Ҫ�Ǹ�whileѭ��, �����ܹ����еĸ���.
   # ����, ����ܻ����һ������, ˼��һ����ʲô����?



# ����ϱ���������, ����ָ����������֮�������������.
number=0   #initialize
while [ "$number" -le $FLOOR ]
do
  number=$RANDOM
  let "number %= $RANGE"  # ��$number����������$RANGE�ķ�Χ��.
done
echo "Random number between $FLOOR and $RANGE ---  $number"
echo



# ������Ԫֵ, ����, "true" �� "false" ����ֵ.
BINARY=2
T=1
number=$RANDOM

let "number %= $BINARY"
#  ע�� let "number >>= 14"    �������һ�����õ��������. #(����ע: ����manҳ���ᵽ��, ����λ������ֲ�����ƽ��)
#+ (����14λ�������е�λȫ�����, ���˵�15λ, ��Ϊ�з���, ��16λ�Ƿ���λ). #ȡģ����ʹ�õ�λ���������������Բ�ƽ��)
if [ "$number" -eq $T ]
then
  echo "TRUE"
else
  echo "FALSE"
fi  

echo


# ������.
SPOTS=6   # ģ6�����ķ�Χ��0 - 5.
          # ��1��õ������ķ�Χ1 - 6.
          # ��л, Paulo Marcel Coelho Aragao, �Դ˽��еļ�.
die1=0
die2=0
# �Ƿ���SPOTS=7��ȼ�1������? �����л��߲��е�ԭ��?

# ÿ��������, ����������ȵĻ���.

    let "die1 = $RANDOM % $SPOTS +1" # �׵�һ��.
    let "die2 = $RANDOM % $SPOTS +1" # �׵ڶ���.
    #  �ϱߵ�����������, �ĸ����и��ߵ����ȼ��� --
    #+ ģ(%) ���Ǽӷ�����(+)?


let "throw = $die1 + $die2"
echo "Throw of the dice = $throw"
echo


exit 0
