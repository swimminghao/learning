#!/bin/bash

variable="one two three four five"

set -- $variable
# ��λ�ò�����������Ϊ����"$variable"������.

first_param=$1
second_param=$2
shift; shift        # ����ǰ�������λ�ò����Ƴ�.
remaining_params="$*"

echo
echo "first parameter = $first_param"             # one
echo "second parameter = $second_param"           # two
echo "remaining parameters = $remaining_params"   # three four five

echo; echo

# ����һ��.
set -- $variable
first_param=$1
second_param=$2
echo "first parameter = $first_param"             # one
echo "second parameter = $second_param"           # two

# ======================================================

set --
# ���ûָ������,��ô����unset���е�λ�ò���.

first_param=$1
second_param=$2
echo "first parameter = $first_param"             # (null value)
echo "second parameter = $second_param"           # (null value)

exit 0
