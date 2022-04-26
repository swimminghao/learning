#!/bin/bash

E_WRONG_DIRECTORY=73

clear # ����.

TargetDirectory=/home/bozo/projects/GreatAmericanNovel

cd $TargetDirectory
echo "Deleting stale files in $TargetDirectory."

if [ "$PWD" != "$TargetDirectory" ]
then    # ��ֹżȻɾ��Ŀ¼.
  echo "Wrong directory!"
  echo "In $PWD, rather than $TargetDirectory!"
  echo "Bailing out!"
  exit $E_WRONG_DIRECTORY
fi  

rm -rf *
rm .[A-Za-z0-9]*    # ɾ�����ļ�(����ע: �����ļ�). 
# rm -f .[^.]* ..?*   Ϊ��ɾ���Զ���㿪ͷ���ļ�. 
# (shopt -s dotglob; rm -f *)   Ҳ����.
# ��л, S.C. ָ�����.

# �ļ������԰���ascii��0 - 255��Χ�ڵ������ַ�, ����"/".
# ɾ���Ը��ֹ����ַ���ͷ���ļ�������Ϊһ����ϰ�������.

# �����Ҫ�Ļ�, ����Ԥ������������.

echo
echo "Done."
echo "Old files deleted in $TargetDirectory."
echo


exit 0
