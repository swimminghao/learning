#!/bin/bash
# "continue N" ����, ����N���ѭ��ȫ����continue.

for outer in I II III IV V           # �ⲿѭ��
do
  echo; echo -n "Group $outer: "

  # --------------------------------------------------------------------
  for inner in 1 2 3 4 5 6 7 8 9 10  # �ڲ�ѭ��
  do

    if [ "$inner" -eq 7 ]
    then
      continue 2  # �ڵ�2��ѭ���ϵ�continue, Ҳ����"�ⲿѭ��".
                  # ʹ��"continue"��������, 
                  # Ȼ��һ��һ������ѭ������Ϊ.
    fi  

    echo -n "$inner "  # 7 8 9 10 �����ᱻecho.
  done  
  # --------------------------------------------------------------------
  # ����ע: ����ڴ˴����echo�Ļ�, ��ȻҲ�������.
done

echo; echo

# ��ϰ:
# �ڽű��з���һ���������"continue N". 

exit 0
