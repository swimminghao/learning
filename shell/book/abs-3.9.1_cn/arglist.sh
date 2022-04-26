#!/bin/bash
# arglist.sh
# ��ʹ�ü�����������������ű�, ����"one two three".

E_BADARGS=65

if [ ! -n "$1" ]
then
  echo "Usage: `basename $0` argument1 argument2 etc."
  exit $E_BADARGS
fi  

echo

index=1          # ��ʼ����.

echo "Listing args with \"\$*\":"
for arg in "$*"  # ���"$*"����""����,��ô�����������ع���.
do
  echo "Arg #$index = $arg"
  let "index+=1"
done             # $* �����еĲ�������һ������.
echo "Entire arg list seen as single word."

echo

index=1          # ���ü���(����ע: ��1��ʼ).
                 # �����д���ᷢ��ʲô?

echo "Listing args with \"\$@\":"
for arg in "$@"
do
  echo "Arg #$index = $arg"
  let "index+=1"
done             # $@ ��ÿ�������������ǵ����ĵ���.
echo "Arg list seen as separate words."

echo

index=1          # ���ü���(����ע: ��1��ʼ).

echo "Listing args with \$* (unquoted):"
for arg in $*
do
  echo "Arg #$index = $arg"
  let "index+=1"
done             # δ���õ�$*����Ѳ������ɵ����ĵ���. 
echo "Arg list seen as separate words."

exit 0
