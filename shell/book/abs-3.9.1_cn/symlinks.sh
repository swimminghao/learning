#!/bin/bash
# symlinks.sh: �г�Ŀ¼�����еķ��������ļ�.


directory=${1-`pwd`}
#  ���û�����������ָ��,
#+ Ĭ��Ϊ��ǰ����Ŀ¼.
#  �±ߵĴ����, ���ϱ����ȼ�.
# ----------------------------------------------------------
# ARGS=1                 # ��Ҫһ�������в���.
#
# if [ $# -ne "$ARGS" ]  # ������ǵ��������Ļ�...
# then
#   directory=`pwd`      # ��ǰ����Ŀ¼
# else
#   directory=$1
# fi
# ----------------------------------------------------------

echo "symbolic links in directory \"$directory\""

for file in "$( find $directory -type l )"   # -type l = ��������
do
  echo "$file"
done | sort                                  # ����Ļ�, �г����ļ�����δ�������.
#  �ϸ�������˵, ���ﲢ��һ����Ҫһ��ѭ������.
#+ ��Ϊ"find"��������������չ��һ������. 
#  Ȼ��, ���ַ�ʽ���������Ҳ������˵��.

#  ����Dominik 'Aeneas' Schnitzer��ָ����,
#+ ���û��$( find $directory -type l )��""���������Ļ�,
#+ ��ô�����һ�����пհײ��ֵ��ļ�����ֳ��Կհ׷ָ���������(�ļ��������пհ�).
#  ��ʹ����ֻ��ȡ��ÿ�������ĵ�һ����.

exit 0


# Jean Helou��������±ߵķ���: 

echo "symbolic links in directory \"$directory\""
# ��ǰIFS�ı���. ҪС��ʹ�����ֵ.
OLDIFS=$IFS
IFS=:

for file in $(find $directory -type l -printf "%p$IFS")
do     #                              ^^^^^^^^^^^^^^^^
       echo "$file"
       done|sort
