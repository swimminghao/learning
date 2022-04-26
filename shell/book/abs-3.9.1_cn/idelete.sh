#!/bin/bash
# idelete.sh: ͨ���ļ���inode����ɾ���ļ�.

#  ���ļ�����һ���Ƿ��ַ���ͷ��ʱ��, ��ͷǳ�������,
#+ ���� ? �� -.

ARGCOUNT=1                      # �ļ����������뱻���ݵ��ű���.
E_WRONGARGS=70
E_FILE_NOT_EXIST=71
E_CHANGED_MIND=72

if [ $# -ne "$ARGCOUNT" ]
then
  echo "Usage: `basename $0` filename"
  exit $E_WRONGARGS
fi  

if [ ! -e "$1" ]
then
  echo "File \""$1"\" does not exist."
  exit $E_FILE_NOT_EXIST
fi  

inum=`ls -i | grep "$1" | awk '{print $1}'`
# inum = inode �ļ���(�����ڵ�)��.
# --------------------------------------------------------
# ÿ���ļ�����һ��inode��, �����������¼�ļ������ַ��Ϣ.
# --------------------------------------------------------

echo; echo -n "Are you absolutely sure you want to delete \"$1\" (y/n)? "
# 'rm' ����� '-v' ѡ���ѯ��Ҳ�������仰.
read answer
case "$answer" in
[nN]) echo "Changed your mind, huh?"
      exit $E_CHANGED_MIND
      ;;
*)    echo "Deleting file \"$1\".";;
esac

find . -inum $inum -exec rm {} \;
#                           ^^
#        �����ž���"find"����
#+       �����滻�ı�����ĵط�.
echo "File "\"$1"\" deleted!"

exit 0
