#!/bin/bash
# fileinfo.sh

FILES="/usr/sbin/accept
/usr/sbin/pwck
/usr/sbin/chroot
/usr/bin/fakefile
/sbin/badblocks
/sbin/ypbind"     # �����������ĵ��ļ��б�.
                  # �ӽ�ȥһ�����ļ�, /usr/bin/fakefile.

echo

for file in $FILES
do

  if [ ! -e "$file" ]       # ����ļ��Ƿ����.
  then
    echo "$file does not exist."; echo
    continue                # ������һ��.
   fi

  ls -l $file | awk '{ print $9 "         file size: " $5 }'  # ��ӡ������.
  whatis `basename $file`   # �ļ���Ϣ.
  # ע��whatis���ݿ���Ҫ��ǰ������.
  # Ҫ��ﵽ���Ŀ��, ��root�������/usr/bin/makewhatis.
  echo
done  

exit 0
