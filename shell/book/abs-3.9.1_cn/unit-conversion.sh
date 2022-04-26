#!/bin/bash
# unit-conversion.sh


convert_units ()  # ͨ������ȡ����Ҫת���ĵ�λ. 
{
  cf=$(units "$1" "$2" | sed --silent -e '1p' | awk '{print $2}')
  # ����������Ҫת���Ĳ��ֱ���������,�����Ĳ��ֶ�ȥ��. 
  echo "$cf"
}  

Unit1=miles
Unit2=meters
cfactor=`convert_units $Unit1 $Unit2`
quantity=3.73

result=$(echo $quantity*$cfactor | bc)

echo "There are $result $Unit2 in $quantity $Unit1."

#  ����㴫����������ƥ��ĵ�λ�ᷢ��ʲô? 
#+ ����ֱ���"ӢĶ"��"Ӣ��"? 

exit 0
