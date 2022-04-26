#!/bin/bash
# substring-extraction.sh

String=23skidoo1
#      012345678    Bash
#      123456789    awk
# ע�ⲻͬ���ַ�������ϵͳ:
# Bash�ĵ�һ���ַ��Ǵ�'0'��ʼ��¼��. 
# Awk�ĵ�һ���ַ��Ǵ�'1'��ʼ��¼��. 

echo ${String:2:4} # λ�� 3 (0-1-2), 4 ���ַ���
                                         # skid

# awk�еȼ���${string:pos:length}��������substr(string,pos,length).
echo | awk '
{ print substr("'"${String}"'",3,4)      # skid
}
'
#  ʹ��һ���յ�"echo"ͨ���ܵ����ݸ�awkһ���ٵ�����, 
#+ �����Ͳ����ṩһ���ļ�����awk.

exit 0
