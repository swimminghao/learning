#!/bin/bash
# secret-pw.sh: �������벻����ʾ

echo
echo -n "Enter password "
read passwd
echo "password is $passwd"
echo -n "If someone had been looking over your shoulder, "
echo "your password would have been compromised."

echo && echo  # ��һ��"���б�"�в�����������. 


stty -echo    # �ر���Ļ��echo. 

echo -n "Enter password again "
read passwd
echo
echo "password is $passwd"
echo

stty echo     # �ָ���Ļ��echo. 

exit 0

# ��ϸ���Ķ�stty�����infoҳ, �Ա��ڸ��õ�����������ò��ҽƻ��Ĺ���. 
