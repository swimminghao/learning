#!/bin/bash
# symlinks.sh: �г�Ŀ¼�����еķ��������ļ�.

OUTFILE=symlinks.list                         # ������������ļ������ļ�

directory=${1-`pwd`}
#  ���û�����������ָ��,
#+ Ĭ��Ϊ��ǰ����Ŀ¼.


echo "symbolic links in directory \"$directory\"" > "$OUTFILE"
echo "---------------------------" >> "$OUTFILE"

for file in "$( find $directory -type l )"    # -type l = ��������
do
  echo "$file"
done | sort >> "$OUTFILE"                     # ѭ����stdout
#           ^^^^^^^^^^^^^                       �ض���һ���ļ���.

exit 0
