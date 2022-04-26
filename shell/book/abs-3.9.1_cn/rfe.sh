#!/bin/bash
# rfe.sh: �޸��ļ���չ��.
#
# �÷�:		rfe old_extension new_extension
#
# ʾ��:
# ��ָ��Ŀ¼�����е�*.gif�ļ���������Ϊ*.jpg,
# �÷�:		rfe gif jpg


E_BADARGS=65

case $# in
  0|1)             # ����"|"�������ʾ"��"����.
  echo "Usage: `basename $0` old_file_suffix new_file_suffix"
  exit $E_BADARGS  # ���ֻ��0����1�������Ļ�, ��ô���˳��ű�.
  ;;
esac


for filename in *.$1
# �Ե�һ������Ϊ��չ����ȫ���ļ����б�.
do
  mv $filename ${filename%$1}$2
  #  ��ɸѡ�������ļ�����չ��ȥ��, ��Ϊɸѡ�������ļ�����չ�����ǵ�һ������,
  #+ Ȼ��ѵ�2��������Ϊ��չ��, ���ӵ���Щ�ļ��ĺ��.
done

exit 0
