#!/bin/bash
# exercising-dd.sh

# ��Stephane Chazelas��д. 
# �����������������޸�. 

input_file=$0   # �ű�����. 
output_file=log.txt
n=3
p=5

dd if=$input_file of=$output_file bs=1 skip=$((n-1)) count=$((p-n+1)) 2> /dev/null
# �ӽű��а�λ��n��p���ַ���ȡ����. 

# -------------------------------------------------------

echo -n "hello world" | dd cbs=1 conv=unblock 2> /dev/null
# ��ֱ��echo "hello world". 

exit 0
