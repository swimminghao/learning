#!/bin/bash
# bin-grep.sh: ��һ���������ļ��ж�λƥ���ִ�.

# ���ڶ������ļ���"grep"�滻. 
# ��"grep -a"��Ч������

E_BADARGS=65
E_NOFILE=66

if [ $# -ne 2 ]
then
  echo "Usage: `basename $0` search_string filename"
  exit $E_BADARGS
fi

if [ ! -f "$2" ]
then
  echo "File \"$2\" does not exist."
  exit $E_NOFILE
fi  


IFS=$'\012'       # ��Paulo Marcel Coelho Aragao����Ľ���.
                  # Ҳ����:  IFS="\n"
for word in $( strings "$2" | grep "$1" )
# "strings" �����г��������ļ��е������ַ���.
# ������ܵ�����"grep",Ȼ����grep�����������ַ���.
do
  echo $word
done

# S.C. ָ��, ��23 - 29 ���Ա��±ߵ�����������,
#    strings "$2" | grep "$1" | tr -s "$IFS" '[\n*]'


# ������"./bin-grep.sh mem /bin/ls"����������ű�.

exit 0
