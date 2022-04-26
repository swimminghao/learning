#!/bin/bash
# grp.sh: һ���ǳ��ֲڵ�'grep'�����ʵ��. 

E_BADARGS=65

if [ -z "$1" ]    # ��鴫�ݸ��ű��Ĳ���. 
then
  echo "Usage: `basename $0` pattern"
  exit $E_BADARGS
fi  

echo

for file in *     # ����$PWD�µ������ļ�.
do
  output=$(sed -n /"$1"/p $file)  # �����滻.

  if [ ! -z "$output" ]           # ���"$output"����˫���Ž��ᷢ��ʲô?
  then
    echo -n "$file: "
    echo $output
  fi              #  sed -ne "/$1/s|^|${file}: |p"  ������ϱ���εȼ�. 

  echo
done  

echo

exit 0

# ��ϰ:
# -----
# 1) ���κθ������ļ���,����г���һ��ƥ��Ļ�, ��������������. 
# 2) ���һЩ����. 
