#!/bin/bash
# manview.sh: ��manҳԴ�ļ���ʽ���Է���鿴. 

#  �������Ķ�manҳ��ʱ��, ����ű���������. 
#  �������������е�ʱ��鿴
#+ �м���. 

E_WRONGARGS=65

if [ -z "$1" ]
then
  echo "Usage: `basename $0` filename"
  exit $E_WRONGARGS
fi

# ---------------------------
groff -Tascii -man $1 | less
# ������groff��manҳ.
# ---------------------------

#  ���manҳ�а�������ߵ�ʽ,
#+ ��ô�ϱߵĴ���͹�Ǻ��.
#  �±ߵ����д�����Խ���ϱߵ��������.
#
#   gtbl < "$1" | geqn -Tlatin1 | groff -Tlatin1 -mtty-char -man
#
#   ��л, S.C.

exit 0
