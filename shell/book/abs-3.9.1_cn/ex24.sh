#!/bin/bash
# Faxing (ǰ����'fax'�����Ѿ���װ��).

EXPECTED_ARGS=2
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
# ��������в����ĸ����Ƿ���ȷ.
then
   echo "Usage: `basename $0` phone# text-file"
   exit $E_BADARGS
fi


if [ ! -f "$2" ]
then
  echo "File $2 is not a text file"
  exit $E_BADARGS
fi
  

fax make $2              # �Ӵ��ı��ļ��д��������ʽ���ļ�.

for file in $(ls $2.0*)  # ����ת�������ļ�.
                         # �ڱ����б���ʹ��ͨ���.
do
  fil="$fil $file"
done  

efax -d /dev/ttyS3 -o1 -t "T$1" $fil   # �ɻ�ĵط�.


# S.C. ָ��, ͨ���±ߵ��������ʡȥforѭ��.
#    efax -d /dev/ttyS3 -o1 -t "T$1" $2.0*
# ���Ⲣ��ʮ�־��н�������[�ٺ�].

exit 0
