#!/bin/bash
# ��һ���ļ�������ȫ��ת��Ϊ��д. 

E_BADARGS=65

if [ -z "$1" ]  # ��������в���.
then
  echo "Usage: `basename $0` filename"
  exit $E_BADARGS
fi  

tr a-z A-Z <"$1"

# ���ϱߵ�������ͬ, ����ʹ����POSIX�ַ�����Ƿ���:
#        tr '[:lower:]' '[:upper:]' <"$1"
# ��л, S.C.

exit 0

#  ��ϰ:
#  ��д����ű�, ͨ��ѡ����Կ��ƽű�����
#+ ת��Ϊ��д����ת��ΪСд.
