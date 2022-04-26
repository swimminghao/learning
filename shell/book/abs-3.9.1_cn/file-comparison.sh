#!/bin/bash

ARGS=2  # �ű���Ҫ��������. 
E_BADARGS=65
E_UNREADABLE=66

if [ $# -ne "$ARGS" ]
then
  echo "Usage: `basename $0` file1 file2"
  exit $E_BADARGS
fi

if [[ ! -r "$1" || ! -r "$2" ]]
then
  echo "Both files to be compared must exist and be readable."
  exit $E_UNREADABLE
fi

cmp $1 $2 &> /dev/null  # /dev/null�����ֹ"cmp"��������.
#   cmp -s $1 $2 ���ϱ����Ľ����ͬ("-s"ѡ���ǽ�ֹ���(silent)��־)
#   ��лAnders Gustavssonָ�����.
#
# ʹ��'diff'����Ҳ����, ����,   diff $1 $2 &> /dev/null

if [ $? -eq 0 ]         # ����"cmp"������˳�״̬.
then
  echo "File \"$1\" is identical to file \"$2\"."
else  
  echo "File \"$1\" differs from file \"$2\"."
fi

exit 0
