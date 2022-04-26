#!/bin/bash
# ʹ��getopt. 

# ����ʹ���±ߵĲ�ͬ�ķ�����������ű�: 
#   sh ex33a.sh -a
#   sh ex33a.sh -abc
#   sh ex33a.sh -a -b -c
#   sh ex33a.sh -d
#   sh ex33a.sh -dXYZ
#   sh ex33a.sh -d XYZ
#   sh ex33a.sh -abcd
#   sh ex33a.sh -abcdZ
#   sh ex33a.sh -z
#   sh ex33a.sh a
# ��������ÿһ�ε��õĽ��. 

E_OPTERR=65

if [ "$#" -eq 0 ]
then   # �ű���Ҫ����һ�������в���. 
  echo "Usage $0 -[options a,b,c]"
  exit $E_OPTERR
fi  

set -- `getopt "abcd:" "$@"`
# Ϊ�����в�������λ�ò���. 
# ���ʹ��"$*"������"$@"�Ļ�, �ᷢ��ʲô? 

while [ ! -z "$1" ]
do
  case "$1" in
    -a) echo "Option \"a\"";;
    -b) echo "Option \"b\"";;
    -c) echo "Option \"c\"";;
    -d) echo "Option \"d\" $2";;
     *) break;;
  esac

  shift
done

#  ͨ����˵�ڽű���ʹ���ڽ���'getopts'����, 
#+ ���ʹ��'getopt'��һЩ. 
#  �ο�"ex33.sh".

exit 0
