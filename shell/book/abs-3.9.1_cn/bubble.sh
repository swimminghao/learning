#!/bin/bash
# bubble.sh: һ������ʽ, ð������. 

# ����һ��ð��������㷨. ����������Ҫʵ����...

#  ���������ıȽ�����Ԫ�ؽ�������, 
#+ �Ƚ���������Ԫ��, ���˳�򲻶�, �ͽ���������Ԫ�ص�λ��. 
#  ����һ�ֱȽϽ���֮��, ��"��"��Ԫ�ؾͻᱻ�ƶ�����ײ�. 
#  ���ڶ��ֱȽϽ���֮��, �ڶ�"��"��Ԫ�ؾͻᱻ�ƶ����εײ���λ��. 
#  ��������. 
#  ����ζ��ÿ�ֱȽϲ���Ҫ�Ƚ�֮ǰ�Ѿ�"����"�õ�����. 
#  ������ע�⵽��ߵ������ڴ�ӡ��ʱ����һЩ. 


exchange()
{
  # ���������е�����Ԫ��. 
  local temp=${Countries[$1]} #  ��ʱ����
                              #+ Ҫ�������Ǹ�Ԫ��. 
  Countries[$1]=${Countries[$2]}
  Countries[$2]=$temp
  
  return
}  

declare -a Countries  #  ��������, 
                      #+ �˴��ǿ�ѡ��, ��Ϊ���������汻��ʼ��. 

#  �����Ƿ����ʹ��ת���(\)
#+ ��������Ԫ�ص�ֵ���ڲ�ͬ������? 
#  ����. 

Countries=(Netherlands Ukraine Zaire Turkey Russia Yemen Syria \
Brazil Argentina Nicaragua Japan Mexico Venezuela Greece England \
Israel Peru Canada Oman Denmark Wales France Kenya \
Xanadu Qatar Liechtenstein Hungary)

# "Xanadu"���������������Դ. 
#+ 


clear                      # ��ʼ֮ǰ����������. 

echo "0: ${Countries[*]}"  # ������0��ʼ�г���������. 

number_of_elements=${#Countries[@]}
let "comparisons = $number_of_elements - 1"

count=1 # ��������. 

while [ "$comparisons" -gt 0 ]          # ��ʼ�ⲿѭ��
do

  index=0  # ��ÿ��ѭ����ʼ֮ǰ, ��������. 

  while [ "$index" -lt "$comparisons" ] # ��ʼ�ڲ�ѭ��
  do
    if [ ${Countries[$index]} \> ${Countries[`expr $index + 1`]} ]
    #  ���ԭ����������򲻶�...
    #  ����һ��, �ڵ�������, 
    #+ \>��ASCII��ıȽϲ�����. 

    #  if [[ ${Countries[$index]} > ${Countries[`expr $index + 1`]} ]]
    #+ ����Ҳ��. 
    then
      exchange $index `expr $index + 1`  # ����. 
    fi  
    let "index += 1"  # ����,   index+=1   ��Bash 3.1֮��İ汾������ô��. 
  done # �ڲ�ѭ������

# ----------------------------------------------------------------------
# Paulo Marcel Coelho Aragao�������ǿ���ʹ�ø��򵥵�forѭ��. 
#
# for (( last = $number_of_elements - 1 ; last > 1 ; last-- ))
# do
#     for (( i = 0 ; i < last ; i++ ))
#     do
#         [[ "${Countries[$i]}" > "${Countries[$((i+1))]}" ]] \
#             && exchange $i $((i+1))
#     done
# done
# ----------------------------------------------------------------------
  

let "comparisons -= 1" #  ��Ϊ��"��"��Ԫ�ص��˵ײ�, 
                       #+ ����ÿ�����ǿ�������һ�αȽ�. 

echo
echo "$count: ${Countries[@]}"  # ÿ�ֽ�����, ����ӡһ������. 
echo
let "count += 1"                # ���Ӵ��ݼ���. 

done                            # �ⲿѭ������
                                # ����, ȫ�����. 

exit 0
