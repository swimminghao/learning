#!/bin/bash
# tempfile-name.sh:  ��ʱ�ļ���������

BASE_STR=`mcookie`   # 32-�ַ���magic cookie. 
POS=11               # �ַ���������һ��λ��. 
LEN=5                # ȡ��$LEN�����������ַ���. 

prefix=temp          #  ���յ�һ��"��ʱ"�ļ�. 
                     #  �����������ļ�����"Ψһ", 
                     #+ ���Զ����ǰ׺Ҳ�����±ߵķ�����������. 

suffix=${BASE_STR:POS:LEN}
                     # ��ȡ�ӵ�11���ַ�֮��ĳ���Ϊ5���ַ���. 

temp_filename=$prefix.$suffix
                     # �����ļ���. 

echo "Temp filename = "$temp_filename""

# sh tempfile-name.sh
# Temp filename = temp.e19ea

#  ��ʹ��'date'����(�ο� ex51.sh)������"Ψһ"�ļ���
#+ �ķ�����Ƚ�.

exit 0
