#!/bin/bash
# ex40.sh (burn-cd.sh)
# �Զ���¼CDR�Ľű�.


SPEED=2          # ������Ӳ��֧�ֵĻ�, �����ѡ�ø��ߵ��ٶ�.
IMAGEFILE=cdimage.iso
CONTENTSFILE=contents
DEVICE=cdrom
# DEVICE="0,0"     Ϊ�������ϰ汾��CDR
DEFAULTDIR=/opt  # ���ǰ�����Ҫ����¼���ݵ�Ŀ¼.
                 # ���뱣֤Ŀ¼����.
                 # С��ϰ: ����һ��Ŀ¼�Ƿ����.

# ʹ�� Joerg Schilling �� "cdrecord" ��:
# http://www.fokus.fhg.de/usr/schilling/cdrecord.html

#  ���һ���û���������ű��Ļ�, ������Ҫroot���
#+ chmod u+s /usr/bin/cdrecord
#  ��Ȼ, ��������ȫ©��, ��Ȼ����һ���Ƚ�С�İ�ȫ©��.

if [ -z "$1" ]
then
  IMAGE_DIRECTORY=$DEFAULTDIR
  # ���������ûָ���Ļ�, ��ô�������Ĭ��Ŀ¼.
else
    IMAGE_DIRECTORY=$1
fi

# ����һ��"�����б�"�ļ�.
ls -lRF $IMAGE_DIRECTORY > $IMAGE_DIRECTORY/$CONTENTSFILE
# "l" ѡ�����һ��"��"�ļ��б�.
# "R" ѡ�ʹ����б�ݹ�.
# "F" ѡ���ǳ��ļ����� (����: Ŀ¼���� /��β, ����ִ���ļ��� *��β).
echo "Creating table of contents."

# ����¼��CDR֮ǰ����һ�������ļ�.
mkisofs -r -o $IMAGEFILE $IMAGE_DIRECTORY
echo "Creating ISO9660 file system image ($IMAGEFILE)."

# ��¼CDR.
echo "Burning the disk."
echo "Please be patient, this will take a while."
cdrecord -v -isosize speed=$SPEED dev=$DEVICE $IMAGEFILE

exit $?
