#!/bin/bash
# func-cmdlinearg.sh
#  ��������ű�, ���Ҵ�һ�������в���. 
#+ ������ $0 arg1.


func ()

{
echo "$1"
}

echo "First call to function: no arg passed."
echo "See if command-line arg is seen."
func
# ����! �����в������ɼ�. 

echo "============================================================"
echo
echo "Second call to function: command-line arg passed explicitly."
func $1
# ���ڿɼ���! 

exit 0
