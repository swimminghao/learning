#!/bin/bash

echo

echo "Enter a string terminated by a \\, then press &lt;ENTER&gt;."
echo "Then, enter a second string, and again press &lt;ENTER&gt;."
read var1     # �� read $var1 ʱ, "\" ������ֹ��������. 
              #     first line \
              #     second line

echo "var1 = $var1"
#     var1 = first line second line

#  ����ÿ���� "\" ��β����, 
#+ �㶼�ῴ��һ����һ�е���ʾ��, ���������var1��������.

echo; echo

echo "Enter another string terminated by a \\ , then press &lt;ENTER&gt;."
read -r var2  # -r ѡ����� "\" ת��.
              #     first line \

echo "var2 = $var2"
#     var2 = first line \

# ��һ�� &lt;ENTER&gt; �ͻ����var2������¼��.

echo 

exit 0
