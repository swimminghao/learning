#!/bin/bash
# realname.sh
#
# ����username, ��/etc/passwd�л��"����". 


ARGCOUNT=1       # ��Ҫһ������. 
E_WRONGARGS=65

file=/etc/passwd
pattern=$1

if [ $# -ne "$ARGCOUNT" ]
then
  echo "Usage: `basename $0` USERNAME"
  exit $E_WRONGARGS
fi  

file_excerpt ()  # ����Ҫ���ģʽ��ɨ���ļ�, Ȼ���ӡ�ļ���صĲ���. 
{
while read line  # "while"����һ���ǵ���"[ condition ]"����. 
do
  echo "$line" | grep $1 | awk -F":" '{ print $5 }'  # awk��":"��Ϊ�綨��. 
done
} &lt;$file  # �ض��򵽺�����stdin. 

file_excerpt $pattern

# �ǵ�, �����ű���ʵ���Ա�����Ϊ
#       grep PATTERN /etc/passwd | awk -F":" '{ print $5 }'
# ��
#       awk -F: '/PATTERN/ {print $5}'
# ��
#       awk -F: '($1 == "username") { print $5 }' # ��username�л������. 
# ����, ��Щ�𲻵�ʾ��������. 

exit 0
