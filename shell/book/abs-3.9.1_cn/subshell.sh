#!/bin/bash
# subshell.sh

echo

echo "Subshell level OUTSIDE subshell = $BASH_SUBSHELL"
# Bash, �汾3, ���������µ�           $BASH_SUBSHELL ����. 
echo

outer_variable=Outer

(
echo "Subshell level INSIDE subshell = $BASH_SUBSHELL"
inner_variable=Inner

echo "From subshell, \"inner_variable\" = $inner_variable"
echo "From subshell, \"outer\" = $outer_variable"
)

echo
echo "Subshell level OUTSIDE subshell = $BASH_SUBSHELL"
echo

if [ -z "$inner_variable" ]
then
  echo "inner_variable undefined in main body of shell"
else
  echo "inner_variable defined in main body of shell"
fi

echo "From main body of shell, \"inner_variable\" = $inner_variable"
#  $inner_variable������Ϊδ��ʼ���ı���, ����ʾ����, 
#+ ������Ϊ����������shell�ﶨ���"�ֲ�����". 
#  ���в��ȵİ취ô? 

echo

exit 0
