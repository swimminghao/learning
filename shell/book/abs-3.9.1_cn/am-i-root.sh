#!/bin/bash
# am-i-root.sh:   ���ǲ���root�û�?

ROOT_UID=0   # Root��$UIDΪ0.

if [ "$UID" -eq "$ROOT_UID" ]  # ֻ��������"root"���ܾ��ܵ�ס����?
then
  echo "You are root."
else
  echo "You are just an ordinary user (but mom loves you just the same)."
fi

exit 0


# ============================================= #
# �±ߵĴ��벻��ִ��, ��Ϊ�ű����ϱ��Ѿ��˳���.

# �±�������һ���ж�root�û��ķ���:

ROOTUSER_NAME=root

username=`id -nu`              # ����...   username=`whoami`
if [ "$username" = "$ROOTUSER_NAME" ]
then
  echo "Rooty, toot, toot. You are root."
else
  echo "You are just a regular fella."
fi
