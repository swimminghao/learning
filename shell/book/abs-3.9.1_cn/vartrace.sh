#!/bin/bash

trap 'echo "VARIABLE-TRACE> \$variable = \"$variable\""' DEBUG
# ��ÿ������ִ��֮��, �ͻ��ӡ��$variable��ֵ. 

variable=29

echo "Just initialized \"\$variable\" to $variable."

let "variable *= 3"
echo "Just multiplied \"\$variable\" by 3."

exit $?

#  "trap 'command1 . . . command2 . . .' DEBUG"�ṹ���ʺ���
#+ ʹ���ڸ��ӽű�����������, 
#+ �������������´���ʹ��"echo $variable"���Ļ�, 
#+ ����ǳ���׾, ���Һܺ�ʱ. 

# ��л, Stephane Chazelasָ�����. 


�ű������: 

VARIABLE-TRACE> $variable = ""
VARIABLE-TRACE> $variable = "29"
Just initialized "$variable" to 29.
VARIABLE-TRACE> $variable = "29"
VARIABLE-TRACE> $variable = "87"
Just multiplied "$variable" by 3.
VARIABLE-TRACE> $variable = "87"
