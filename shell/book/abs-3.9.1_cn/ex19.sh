#!/bin/bash
# ʹ��'shift'���𲽴�ȡ���е�λ�ò���. 

#  ���ű�������, ����shft,
#+ Ȼ����ű�����һЩλ�ò���, ����: 
#          ./shft a b c def 23 skidoo

until [ -z "$1" ]  # ֱ�����е�λ�ò���������ȡ��...
do
  echo -n "$1 "
  shift
done

echo               # ����Ļ���.

exit 0
