#!/bin/bash
# t-out.sh
# ��"syngin seven"�Ľ����еõ������ (��л).


TIMELIMIT=4         # 4��

read -t $TIMELIMIT variable <&1
#                           ^^^
#  �����������, ����Bash 1.x��2.x����Ҫ"<&1"��,
#  ����Bash 3.x�Ͳ���Ҫ.

echo

if [ -z "$variable" ]  # ֵΪnull?
then
  echo "Timed out, variable still unset."
else  
  echo "variable = $variable"
fi  

exit 0
