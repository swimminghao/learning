#!/bin/bash
# sieve.sh (ex68.sh)

# ������ɫ������ɸ��
# �������ľ����㷨. 

#  ��ͬ����ֵ�ķ�Χ��, 
#+ ����ű����е��ٶȱ�C�汾���Ķ�. 

LOWER_LIMIT=1       # ��1��ʼ. 
UPPER_LIMIT=1000    # ��1000. 
# (�����ʱ��ܶ�Ļ� . . . ����Խ������ֵ���ĺܸ�.)

PRIME=1
NON_PRIME=0

let SPLIT=UPPER_LIMIT/2
# �Ż�: 
# ֻ��Ҫ�����м䵽����ֵ(Ϊʲô?). 
# (����ע: ��������ڽű����Ĳ�û�б�ʹ��, ������107��֮����Ż����ֲ�ʹ��.)

declare -a Primes
# Primes[]�Ǹ�����. 


initialize ()
{
# ��ʼ������. 

i=$LOWER_LIMIT
until [ "$i" -gt "$UPPER_LIMIT" ]
do
  Primes[i]=$PRIME
  let "i += 1"
done
#  �ٶ����������Ա������Ҫ����(����)
#+ ֱ��������. 
}

print_primes ()
{
# ��ӡ����������Primes[]�б����Ϊ������Ԫ��. 

i=$LOWER_LIMIT

until [ "$i" -gt "$UPPER_LIMIT" ]
do

  if [ "${Primes[i]}" -eq "$PRIME" ]
  then
    printf "%8d" $i
    # ÿ�����ִ�ӡǰ�ȴ�ӡ8���ո�, ��ż���вŴ�ӡ. 
  fi
  
  let "i += 1"
  
done

}

sift () # ���������. 
{

let i=$LOWER_LIMIT+1
# ���Ƕ�֪��1������, �������Ǵ�2��ʼ. 
# (����ע: ��2��ʼ����������1������, ������ΪҪȥ���Ժ�ÿ�����ı���, ��л����KevinChen.)
until [ "$i" -gt "$UPPER_LIMIT" ]
do

if [ "${Primes[i]}" -eq "$PRIME" ]
# ��Ҫ�����Ѿ����˹�������(����ʶΪ������).
then

  t=$i

  while [ "$t" -le "$UPPER_LIMIT" ]
  do
    let "t += $i "
    Primes[t]=$NON_PRIME
    # ��ʶΪ������. 
  done

fi  

  let "i += 1"
done  


}


# ==============================================
# main ()
# �������ú���. 
initialize
sift
print_primes
# ������Ǳ���Ϊ�ṹ����̵Ķ���. 
# ==============================================

echo

exit 0



# -------------------------------------------------------- #
# ��Ϊǰ���'exit'���, ���Ժ�ߵĴ��벻������. 

#  �±ߵĴ���, ����Stephane Chazelas����д�İ�����ɫ������ɸ�ӵĸĽ��汾, 
#+ ����汾�������еĿ�һЩ. 

# ��������������ָ������(�����������: Ѱ�����������Ʒ�Χ). 

UPPER_LIMIT=$1                  # ������������. 
let SPLIT=UPPER_LIMIT/2         # ���м�ֵ�����ֵ. 

Primes=( '' $(seq $UPPER_LIMIT) )

i=1
until (( ( i += 1 ) > SPLIT ))  # ����Ҫ���м�ֵ���. 
do
  if [[ -n $Primes[i] ]]
  then
    t=$i
    until (( ( t += i ) > UPPER_LIMIT ))
    do
      Primes[t]=
    done
  fi  
done  
echo ${Primes[*]}

exit 0
