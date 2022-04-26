#!/bin/bash

func1 ()
{
echo This is a function.
}

declare -f        # �г�ǰ�涨������к���.

echo

declare -i var1   # var1�Ǹ����ͱ���.
var1=2367
echo "var1 declared as $var1"
var1=var1+1       # ���ͱ���������������Ҫʹ��'let'����.
echo "var1 incremented by 1 is $var1."
# �����޸�һ���Ѿ�����Ϊ���ͱ�����ֵ.
echo "Attempting to change var1 to floating point value, 2367.1."
var1=2367.1       # ����������Ϣ, ���ұ�����û�б��޸�.
echo "var1 is still $var1"

echo

declare -r var2=13.36         # 'declare'�������ñ���������, 
                              #+ ͬʱ��������ֵ.
echo "var2 declared as $var2" # ��ͼ�޸�ֻ��������ֵ.
var2=13.37                    # ����������Ϣ, ���Ҵӽű��˳�.

echo "var2 is still $var2"    # ������ִ�е�����.

exit 0                        # �ű�Ҳ����Ӵ˴��˳�.
