#!/bin/bash

ROOT_UID=0   # ֻ��$UIDΪ0���û���ӵ��rootȨ��.
E_NOTROOT=65
E_NOPARAMS=66

if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  # "Run along kid, it's past your bedtime."
  exit $E_NOTROOT
fi  

if [ -z "$1" ]
then
  echo "Usage: `basename $0` find-string"
  exit $E_NOPARAMS
fi


echo "Updating 'locate' database..."
echo "This may take a while."
updatedb /usr &     # ����ʹ��root���������.

wait
# �����������������, ����'updatedb'����ִ�����.
# ��ϣ���ڲ����ļ���֮ǰ����database.

locate $1

#  ���û��'wait'����Ļ�, �����ڱȽ���������,
#+ �ű�������'updatedb'��������е�ʱ���˳�,
#+ �⽫�ᵼ��'updatedb'��Ϊһ���¶�����.

exit 0
