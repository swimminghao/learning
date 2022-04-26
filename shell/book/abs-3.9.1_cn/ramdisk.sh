#!/bin/bash
# ramdisk.sh

#  һ��"ramdisk"����ϵͳRAM�ڴ��е�һ����, 
#+ ֻ�������������ļ�ϵͳ������. 
#  �����ŵ��Ƿ����ٶȷǳ���(��/дʱ���). 
#  ȱ��: ��ʧ��, ������������ػ�ʱ, �ᶪʧ����. 
#+                ���һ����ϵͳ���õ�RAM. 
#
#  ��ôramdisk��ʲô����? 
#  ����һ�������ݼ�, ���籣������ֵ�. 
#+ �����Ļ�, �������Ӳ�ѯ�ٶ�, ��Ϊ�����ڴ�ȷ���Ӳ�̿�ö�. 


E_NON_ROOT_USER=70             # ������root���������. 
ROOTUSER_NAME=root

MOUNTPT=/mnt/ramdisk
SIZE=2000                      # 2K����(���Խ����ʵ����޸�)
BLOCKSIZE=1024                 # ÿ��Ĵ�СΪ1K(1024�ֽ�)
DEVICE=/dev/ram0               # ��һ��ram�豸

username=`id -nu`
if [ "$username" != "$ROOTUSER_NAME" ]
then
  echo "Must be root to run \"`basename $0`\"."
  exit $E_NON_ROOT_USER
fi

if [ ! -d "$MOUNTPT" ]         #  ���Թ��ص��Ƿ��Ѿ�����, 
then                           #+ �����������жϵĻ�, ���ű����ж�ε�ʱ��, 
  mkdir $MOUNTPT               #+ �Ͳ��ᱨ����. (����ע: ��Ҫ��Ϊ�˱����δ���Ŀ¼.)
fi

dd if=/dev/zero of=$DEVICE count=$SIZE bs=$BLOCKSIZE  # ��RAM�豸��������0���. 
                                                      # Ϊʲô������ô��? 
mke2fs $DEVICE                 # ��RAM�ϴ���һ��ext2�ļ�ϵͳ. 
mount $DEVICE $MOUNTPT         # ������. 
chmod 777 $MOUNTPT             # ʹһ���û�Ҳ���Է������ramdisk. 
                               # Ȼ��, ֻ��ʹ��root�����ж����. 

echo "\"$MOUNTPT\" now available for use."
# ����ramdisk�Ϳ��Է�����, ��ʹ����ͨ�û�Ҳ���Է���. 

#  С��, ramdisk������ʧ��, 
#+ ���������ػ��Ļ�, ��������ݾͻ���ʧ. 
#  ����, ����Ҫ�����뱣����ļ�, ���浽�������Ŀ¼��. 

# ����֮��, ��������ű�, �����ٴν���һ��ramdisk. 
# �����������¼���/mnt/ramdisk, ��û��������������Ļ�, �ǾͲ�����������. 

#  ���������ű������ʵ��ĸĽ�, �Ϳ��Խ������/etc/rc.d/rc.local��, 
#+ ����, ��ϵͳ������ʱ��ͻ��Զ�����һ��ramdisk. 
#  ��ô���ǳ��ʺ�����Щ���ٶ�Ҫ��ܸߵ����ݿ������. 

exit 0
