#!/bin/bash
# arrow-detect.sh: ��ⷽ���, ��һЩ�Ǵ�ӡ�ַ��İ���.
# ��л, Sandro Magi, ������������ô�������.

# --------------------------------------------
# �������������ַ�����.
arrowup='\[A'
arrowdown='\[B'
arrowrt='\[C'
arrowleft='\[D'
insert='\[2'
delete='\[3'
# --------------------------------------------

SUCCESS=0
OTHER=65

echo -n "Press a key...  "
# ��������ϱ��б����г��İ���, ���ܻ�����Ҫ���س�. (����ע: ��Ϊһ�㰴����һ���ַ�)
read -n3 key                      # ��ȡ3���ַ�.

echo -n "$key" | grep "$arrowup"  # ��������ַ��Ƿ�ƥ��.
if [ "$?" -eq $SUCCESS ]
then
  echo "Up-arrow key pressed."
  exit $SUCCESS
fi

echo -n "$key" | grep "$arrowdown"
if [ "$?" -eq $SUCCESS ]
then
  echo "Down-arrow key pressed."
  exit $SUCCESS
fi

echo -n "$key" | grep "$arrowrt"
if [ "$?" -eq $SUCCESS ]
then
  echo "Right-arrow key pressed."
  exit $SUCCESS
fi

echo -n "$key" | grep "$arrowleft"
if [ "$?" -eq $SUCCESS ]
then
  echo "Left-arrow key pressed."
  exit $SUCCESS
fi

echo -n "$key" | grep "$insert"
if [ "$?" -eq $SUCCESS ]
then
  echo "\"Insert\" key pressed."
  exit $SUCCESS
fi

echo -n "$key" | grep "$delete"
if [ "$?" -eq $SUCCESS ]
then
  echo "\"Delete\" key pressed."
  exit $SUCCESS
fi


echo " Some other key pressed."

exit $OTHER

#  ��ϰ:
#  -----
#  1) ʹ��'case'�ṹ������'if'�ṹ, 
#+    �������Լ�����ű�.
#  2) ��� "Home", "End", "PgUp", �� "PgDn" ��Щ�����ļ��.
