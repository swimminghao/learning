#!/bin/bash
# ��������.

# �����Ǿ�̫���ľ������������ǵ�����.

for planet in "Mercury 36" "Venus 67" "Earth 93"  "Mars 142" "Jupiter 483"
do
  set -- $planet  # ��������"planet"��������λ�ò���. 
  # "--" ����ֹ$planetΪ��, ��������һ�����ۺſ�ͷ. 

  # ������Ҫ����ԭʼ��λ�ò���, ��Ϊ���Ǳ�������.
  # һ�ַ�������ʹ������.
  #        original_params=("$@")

  echo "$1		$2,000,000 miles from the sun"
  #-------two  tabs---�Ѻ�ߵ�0��2��������
done

# (��л, S.C., �Դ�������еĳ���.)

exit 0
