#!/bin/bash

# ��ϵͳ����ӵڶ���Ӳ��������. 
# �������. ����Ӳ���Ѿ���װ��. 
# �����ڱ������ߵ�һƪ����. 
# ��"Linux Gazette"������#38��, http://www.linuxgazette.com. 

ROOT_UID=0     # ����ű�������root�������. 
E_NOTROOT=67   # ��root�û���������������. 

if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi  

# Ҫ�ǳ�����С�ĵ�ʹ��! 
# ���ĳ������, ���ܻ᳹�״ݻ��㵱ǰ���ļ�ϵͳ. 


NEWDISK=/dev/hdb         # ����/dev/hdb�հ�. ���һ��!
MOUNTPOINT=/mnt/newdisk  #����ѡ��������mount���. 


fdisk $NEWDISK
mke2fs -cv $NEWDISK1   # ��黵��, ������ϸ���. 
#  ע��:    /dev/hdb1, *����* /dev/hdb!
mkdir $MOUNTPOINT
chmod 777 $MOUNTPOINT  # �������û�������ȫ��Ȩ��. 


# ����, ����һ��...
# mount -t ext2 /dev/hdb1 /mnt/newdisk
# ���Դ���һ��Ŀ¼. 
# �������������, umount��, Ȼ�����. 

# ���һ��:
# ���±�������ӵ�/etc/fstab.
# /dev/hdb1  /mnt/newdisk  ext2  defaults  1 1

exit 0
