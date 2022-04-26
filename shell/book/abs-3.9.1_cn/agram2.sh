#!/bin/bash
# agram2.sh
# ���������滻Ƕ�׵�����. 

#  ʹ��"anagram"����. 
#+ �������ߵ�"yawl"���ֱ�������е�һ����. 
#  http://ibiblio.org/pub/Linux/libs/yawl-0.3.2.tar.gz
#  http://personal.riverusers.com/~thegrendel/yawl-0.3.2.tar.gz

E_NOARGS=66
E_BADARG=67
MINLEN=7

if [ -z "$1" ]
then
  echo "Usage $0 LETTERSET"
  exit $E_NOARGS         # �ű���Ҫһ�������в���. 
elif [ ${#1} -lt $MINLEN ]
then
  echo "Argument must have at least $MINLEN letters."
  exit $E_BADARG
fi



FILTER='.......'         # ����������7���ַ�. 
#       1234567
Anagrams=( $(echo $(anagram $1 | grep $FILTER) ) )
#           |     |    Ƕ�׵������滻.       | |
#        (              �������                 )

echo
echo "${#Anagrams[*]}  7+ letter anagrams found"
echo
echo ${Anagrams[0]}      # ��һ��anagram. 
echo ${Anagrams[1]}      # �ڶ���anagram. 
                         # �ȵ�. 

# echo "${Anagrams[*]}"  # ��һ�����г����е�anagram . . .

#  ���ǵ���߻��е�����һ��, ��"����"������ϸ�Ľ���, 
#+ ����������Ͳ�����������. 

# ���Բο��ű�agram.sh, ��Ҳ��һ���ҳ�anagram������. 

exit $?
