#!/bin/bash

filename=sys.log

cat /dev/null > $filename; echo "Creating / cleaning out file."
#  ����ļ������ڵĻ��ʹ����ļ�,
#+ Ȼ������ļ����.
#  : > filename   ��   > filename Ҳ������������.

tail /var/log/messages > $filename  
# /var/log/messages �������ȫ�ֵĿɶ�Ȩ�޲���. 

echo "$filename contains tail end of system log."

exit 0
