#!/bin/bash
# commentblock.sh

: &lt;&lt;COMMENTBLOCK
echo "This line will not echo."
This is a comment line missing the "#" prefix.
This is another comment line missing the "#" prefix.

&*@!!++=
The above line will cause no error message,
because the Bash interpreter will ignore it.
COMMENTBLOCK

echo "Exit value of above \"COMMENTBLOCK\" is $?."   # 0
# ���ｫ������ʾ�κδ���. 


#  �ϱߵ����ּ�����ȻҲ��������ע�͵�
#+ һ������ʹ�õĴ���, �������ĳЩ�ض�����Ҫ��Ļ�. 
#  �����ÿ��ǰ�߶�����"#"���÷���Ķ�, 
#+ �����������ָ��Ļ�, ���ý�����ϵ�"#"ɾ����. 

: &lt;&lt;DEBUGXXX
for file in *
do
 cat "$file"
done
DEBUGXXX

exit 0
