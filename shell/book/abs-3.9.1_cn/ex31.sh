#!/bin/bash

PS3='Choose your favorite vegetable: ' # ������ʾ���ִ�.

echo

select vegetable in "beans" "carrots" "potatoes" "onions" "rutabagas"
do
  echo
  echo "Your favorite veggie is $vegetable."
  echo "Yuck!"
  echo
  break  # �������û�� 'break' �ᷢ��ʲô?
done

exit 0
