#!/bin/bash
# ʹ��'eval'��һ��"rot13"�İ汾,(����:rot13���ǰ�26����ĸ,���м��Ϊ2��,��13��).
# ��ű�"rot13.sh" �Ƚ�һ��.

setvar_rot_13()              # "rot13" ����
{
  local varname=$1 varvalue=$2
  eval $varname='$(echo "$varvalue" | tr a-z n-za-m)'
}


setvar_rot_13 var "foobar"   # �� "foobar" ���ݵ� rot13������.
echo $var                    # sbbone

setvar_rot_13 var "$var"     # ���� "sbbone" ��rot13������.
                             # �ֱ����ԭʼֵ.
echo $var                    # foobar

# ���������Segebart Chazelas��д��.
# �������޸���һ��.

exit 0
