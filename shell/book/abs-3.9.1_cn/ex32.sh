#!/bin/bash

PS3='Choose your favorite vegetable: '

echo

choice_of()
{
select vegetable
# [in list]������, ����'select'ʹ�ô��ݸ������Ĳ���.
do
  echo
  echo "Your favorite veggie is $vegetable."
  echo "Yuck!"
  echo
  break
done
}

choice_of beans rice carrots radishes tomatoes spinach
#         $1    $2   $3      $4       $5       $6
#         ���ݸ�choice_of()�Ĳ���

exit 0
