#!/bin/bash

. data-file    # ����һ�������ļ�.
# ��"source data-file"Ч����ͬ, ���Ǹ��߿���ֲ��.

#  �ļ�"data-file"��������ڵ�ǰ����Ŀ¼, 
#+ ��Ϊ����ļ���ʹ��'basename'�����õ�. 

# ����, ��������ļ��е�һЩ����. 

echo "variable1 (from data-file) = $variable1"
echo "variable3 (from data-file) = $variable3"

let "sum = $variable2 + $variable4"
echo "Sum of variable2 + variable4 (from data-file) = $sum"
echo "message1 (from data-file) is \"$message1\""
# ע��:                             ��˫����ת��

print_message This is the message-print function in the data-file.


exit 0
