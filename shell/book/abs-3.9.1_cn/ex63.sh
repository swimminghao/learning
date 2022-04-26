#!/bin/bash

#               �׳�
#               ----


# bash����ݹ���? 
# ��, ����, ����...
# ��̫����, ���Կ�������������. 


MAX_ARG=5
E_WRONG_ARGS=65
E_RANGE_ERR=66


if [ -z "$1" ]
then
  echo "Usage: `basename $0` number"
  exit $E_WRONG_ARGS
fi

if [ "$1" -gt $MAX_ARG ]
then
  echo "Out of range (5 is maximum)."
  #  �������������˽�һЩʵ�����. 
  #  ������������������ķ�Χ�Ľ׳�, 
  #+ Ӧ���������ı����������д��. 
  exit $E_RANGE_ERR
fi  

fact ()
{
  local number=$1
  #  ����"number"��������Ϊ�ֲ�����, 
  #+ ��������������. 
  if [ "$number" -eq 0 ]
  then
    factorial=1    # 0�Ľ׳�Ϊ1. 
  else
    let "decrnum = number - 1"
    fact $decrnum  # �ݹ�ĺ�������(���Ǻ��������Լ�). 
    let "factorial = $number * $?"
  fi

  return $factorial
}

fact $1
echo "Factorial of $1 is $?."

exit 0
