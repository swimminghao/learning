#!/bin/bash

echo

if test -z "$1"
then
  echo "No command-line arguments."
else
  echo "First command-line argument is $1."
fi

echo

if /usr/bin/test -z "$1"      # ���ڽ���"test"��������ͬ. 
then
  echo "No command-line arguments."
else
  echo "First command-line argument is $1."
fi

echo

if [ -z "$1" ]                # ���ϱߵĴ����������ͬ.
#   if [ -z "$1"                Ӧ���ܹ�����, ����...
#+  Bash����, ��ʾȱ�ٹر��������Ե���������. 
then
  echo "No command-line arguments."
else
  echo "First command-line argument is $1."
fi

echo


if /usr/bin/[ -z "$1" ]       # ����һ��, ���ϱߵĴ����������ͬ.
# if /usr/bin/[ -z "$1"       # �ܹ�����, ���ǻ��Ǹ���һ��������Ϣ.
#                             # ע��:
#                               �ڰ汾3.x��Bash��, ���bug�Ѿ���������.
then
  echo "No command-line arguments."
else
  echo "First command-line argument is $1."
fi

echo

exit 0
