#!/bin/bash
# ��shell�еı���ȱ��. 

outer_variable=outer
echo
echo "outer_variable = $outer_variable"
echo

(
# ��ʼ��shell

echo "outer_variable inside subshell = $outer_variable"
inner_variable=inner  # Set
echo "inner_variable inside subshell = $inner_variable"
outer_variable=inner  # ���޸�ȫ�ֱ���ô? 
echo "outer_variable inside subshell = $outer_variable"

# ���������'����'�������ͬ�Ľ��ô? 
#    export inner_variable
#    export outer_variable
# ���Կ�. 

# ������shell
)

echo
echo "inner_variable outside subshell = $inner_variable"  # δ����. 
echo "outer_variable outside subshell = $outer_variable"  # δ�޸�. 
echo

exit 0

# �����򿪵�19�͵�20�е�ע�ͻ�����? 
# �������ͬ�Ľ��ô? (����ע: С��ʾ, ��18�е�'����'������������.)
