#!/bin/bash
# "���б�"

if [ ! -z "$1" ] && echo "Argument #1 = $1" && [ ! -z "$2" ] && echo "Argument #2 = $2"
then
  echo "At least 2 arguments passed to script."
  # ���������������������true. 
else
  echo "Less than 2 arguments passed to script."
  # ���������б���������һ�������false. 
fi  
# ע��, "if [ ! -z $1 ]"Ҳ����, �����������ٶ��ĵȼ���. 
#   if [ -n $1 ] �������. 
#     Ȼ��, ����������þ�����. 
#  if [ -n "$1" ] ����������. 
#     С��!
# ��ý���Ҫ���Եı�����������, ��ô���Ƿǳ��õ�ϰ��. 


# ������δ�������������ǵȼ۵�, ����������δ���ʹ�õ���"����"��if/then�ṹ. 
if [ ! -z "$1" ]
then
  echo "Argument #1 = $1"
fi
if [ ! -z "$2" ]
then
  echo "Argument #2 = $2"
  echo "At least 2 arguments passed to script."
else
  echo "Less than 2 arguments passed to script."
fi
# ��ôд�Ļ�, ����̫����, û��"���б�"���ľ���. 


exit 0
