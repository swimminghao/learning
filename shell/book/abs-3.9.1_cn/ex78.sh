#!/bin/bash

# ��ӱ�������. 
# ���ַ����Ƚ���C++�е���������. 


a=letter_of_alphabet
letter_of_alphabet=z

echo "a = $a"           # ֱ������. 

echo "Now a = ${!a}"    # �������. 
# ${!variable}��ʾ������ʽ��"eval var1=\$$var2"��ʾ���߼��Ķ�. 

echo

t=table_cell_3
table_cell_3=24
echo "t = ${!t}"                      # t = 24
table_cell_3=387
echo "Value of t changed to ${!t}"    # 387

#  �����������Ա�������ñ��ʱ��, ���ַ����ǳ�����, 
#+ ����������ģ���ά����. 
#  ������ܹ�������ѡ��(������ָ�����������)
#+ �͸�����. ��ϧ. 

exit 0
