#!/bin/bash

# ��Ϊ����, ��������ű�������Ҫ10������, ����:
# ./scriptname 1 2 3 4 5 6 7 8 9 10
MINPARAMS=10

echo

echo "The name of this script is \"$0\"."
# ���./�Ǳ�ʾ��ǰĿ¼
echo "The name of this script is \"`basename $0`\"."
# ȥ��·����, ʣ���ļ���, (�μ�'basename')

echo

if [ -n "$1" ]              # ���Ա���������.
then
 echo "Parameter #1 is $1"  # ��Ҫ���ò��ܹ�ת��"#"
fi 

if [ -n "$2" ]
then
 echo "Parameter #2 is $2"
fi 

if [ -n "$3" ]
then
 echo "Parameter #3 is $3"
fi 

# ...


if [ -n "${10}" ]  # ����$9�Ĳ���������{}������.
then
 echo "Parameter #10 is ${10}"
fi 

echo "-----------------------------------"
echo "All the command-line parameters are: "$*""

if [ $# -lt "$MINPARAMS" ]
then
  echo
  echo "This script needs at least $MINPARAMS command-line arguments!"
fi  

echo

exit 0
