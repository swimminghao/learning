#!/bin/bash
# multiplication.sh

multiply ()                     # ��������Ϊ�������ݽ���. 
{                               # ���Խ��ܶ������. 

  local product=1

  until [ -z "$1" ]             # ֱ�����������еĲ���...
  do
    let "product *= $1"
    shift
  done

  echo $product                 #  ����echo��stdout, 
}                               #+ ��ΪҪ������ֵ��һ������. 

mult1=15383; mult2=25211
val1=`multiply $mult1 $mult2`
echo "$mult1 X $mult2 = $val1"
                                # 387820813

mult1=25; mult2=5; mult3=20
val2=`multiply $mult1 $mult2 $mult3`
echo "$mult1 X $mult2 X $mult3 = $val2"
                                # 2500

mult1=188; mult2=37; mult3=25; mult4=47
val3=`multiply $mult1 $mult2 $mult3 $mult4`
echo "$mult1 X $mult2 X $mult3 X $mult4 = $val3"
                                # 8173300

exit 0
