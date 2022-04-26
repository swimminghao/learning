#!/bin/bash

#  delete.sh, ���Ǻܴ������ļ�ɾ������. 
#  Usage: delete filename

E_BADARGS=65

if [ -z "$1" ]
then
  echo "Usage: `basename $0` filename"
  exit $E_BADARGS  # û�в���? �˳��ű�. 
else  
  file=$1          # �����ļ���.
fi  


[ ! -f "$file" ] && echo "File \"$file\" not found. \
Cowardly refusing to delete a nonexistent file."
# ���б�, ���ļ�������ʱ�������������Ϣ. 
# ע��echo����ʹ����һ�����з�, ������һ�е�����, Ҳ����Ϊecho����Ĳ���. 

[ ! -f "$file" ] || (rm -f $file; echo "File \"$file\" deleted.")
# ���б�, ����ļ�����, �Ǿ�ɾ�����ļ�. 

# ע��, �ϱߵ������߼��෴. 
# ���б���true������²�ִ��, ���б���false��ʱ���ִ��. 

exit 0
