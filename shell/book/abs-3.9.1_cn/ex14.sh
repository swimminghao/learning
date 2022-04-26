#!/bin/bash
# zmore

#ʹ��'more'���鿴gzip�ļ�

NOARGS=65
NOTFOUND=66
NOTGZIP=67

if [ $# -eq 0 ] # ��if [ -z "$1" ]Ч����ͬ
# (����ע: �ϱ����ע��������), $1�ǿ��Դ��ڵ�, ����Ϊ��, ��:  zmore "" arg2 arg3
then
  echo "Usage: `basename $0` filename" >&2
  # ������Ϣ�����stderr.
  exit $NOARGS
  # ����65��Ϊ�ű����˳�״̬��ֵ(������).
fi  

filename=$1

if [ ! -f "$filename" ]   # ��$filename��������, �����������а����հ��ַ�. 
then
  echo "File $filename not found!" >&2
  # ������Ϣ�����stderr.
  exit $NOTFOUND
fi  

if [ ${filename##*.} != "gz" ]
# �ڱ����滻��ʹ�������Žṹ.
then
  echo "File $1 is not a gzipped file!"
  exit $NOTGZIP
fi  

zcat $1 | more

# ʹ�ù�������'more.'
# ��Ȼ, �����Ը��, Ҳ����ʹ��'less'.


exit $?   # �ű����ѹܵ����˳�״̬��Ϊ����ֵ.
# ��ʵ��, Ҳ��һ����Ҫ����"exit $?", ��Ϊ���κ������,
# �ű����Ὣ���һ��������˳�״̬��Ϊ����ֵ.
