#!/bin/bash
# "Reading" ����.

echo -n "Enter the value of variable 'var1': "
# -n ѡ��, ��ֹ����.

read var1
# ע��: ��var1ǰ��û��'$', ��Ϊ�������ڱ�����. 

echo "var1 = $var1"


echo

# һ��������'read'���������ö������. 
echo -n "Enter the values of variables 'var2' and 'var3' (separated by a space or tab): "
read var2 var3
echo "var2 = $var2      var3 = $var3"
# �����ֻ������һ��ֵ, ��ô�����ı������Ǵ���δ����״̬(null). 

exit 0
