#!/bin/bash
# nested-loop.sh: Ƕ�׵�"for"ѭ��. 

outer=1             # �����ⲿѭ������.

# ��ʼ�ⲿѭ��.
for a in 1 2 3 4 5
do
  echo "Pass $outer in outer loop."
  echo "---------------------"
  inner=1           # �����ڲ�ѭ������.

  # ===============================================
  # ��ʼ�ڲ�ѭ��.
  for b in 1 2 3 4 5
  do
    echo "Pass $inner in inner loop."
    let "inner+=1"  # �����ڲ�ѭ������.
  done
  # �ڲ�ѭ������.
  # ===============================================

  let "outer+=1"    # �����ⲿѭ���ļ���.
  echo              # ÿ���ⲿѭ��֮��ļ��.
done               
# �ⲿѭ������.

exit 0
