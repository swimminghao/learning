#!/bin/bash

# ������/usr/X11R6/bin�е�����2�����ļ�����Щʲô����?

DIRECTORY="/usr/X11R6/bin"
# Ҳ���� "/bin", "/usr/bin", "/usr/local/bin", �ȵ�.

for file in $DIRECTORY/*
do
  whatis `basename $file`   # ����echo�����2�����ļ�����Ϣ.
done

exit 0

# �����ϣ��������ű�������ض���, ������:
# ./what.sh >>whatis.db
# ����һҳһҳ����stdout�ϲ쿴,
# ./what.sh | less
