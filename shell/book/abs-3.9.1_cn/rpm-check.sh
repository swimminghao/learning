#!/bin/bash
# rpm-check.sh

# ����ű���Ŀ����Ϊ������, �б�, ��ȷ���Ƿ���԰�װһ��rpm��.
# ��һ���ļ��б������.
# 
# ����ű�ʹ��һ���������չʾ.

SUCCESS=0
E_NOARGS=65

if [ -z "$1" ]
then
  echo "Usage: `basename $0` rpm-file"
  exit $E_NOARGS
fi  

{ 
  echo
  echo "Archive Description:"
  rpm -qpi $1       # ��ѯ˵��.
  echo
  echo "Archive Listing:"
  rpm -qpl $1       # ��ѯ�б�.
  echo
  rpm -i --test $1  # ��ѯrpm���Ƿ���Ա���װ.
  if [ "$?" -eq $SUCCESS ]
  then
    echo "$1 can be installed."
  else
    echo "$1 cannot be installed."
  fi  
  echo
} > "$1.test"       # �Ѵ�����е�����������ض����ļ���.

echo "Results of rpm test in file $1.test"

# �鿴rpm��manҳ���鿴rpm��ѡ��.

exit 0
