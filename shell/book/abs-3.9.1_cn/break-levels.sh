#!/bin/bash
# break-levels.sh: �˳�ѭ��.

# "break N" �˳�N��ѭ��.

for outerloop in 1 2 3 4 5
do
  echo -n "Group $outerloop:   "

  # --------------------------------------------------------
  for innerloop in 1 2 3 4 5
  do
    echo -n "$innerloop "

    if [ "$innerloop" -eq 3 ]
    then
      break  # ����   break 2   ����������ʲô��.
             # (�ڲ�ѭ�����ⲿѭ������"Break"��. )
    fi
  done
  # --------------------------------------------------------

  echo
done  

echo

exit 0
