#!/bin/bash
# prepend.sh: ���ļ��Ŀ�ͷ����ı�. 
#
#  Kenny Stauffer�������Ľű�����, 
#+ �������߶�����ű������������޸�. 


E_NOSUCHFILE=65

read -p "File: " file   #  'read'�����-p����������ʾ��ʾ��. 
if [ ! -e "$file" ]
then   # �������ļ�������, �Ǿͽ���. 
  echo "File $file not found."
  exit $E_NOSUCHFILE
fi

read -p "Title: " title
cat - $file &lt;&lt;&lt;$title &gt; $file.new

echo "Modified file is $file.new"

exit 0

# �±���'man bash'�е�һ��: 
# Here String
# 	here document��һ�ֱ��Σ���ʽ����: 
# 
# 		&lt;&lt;&lt;word
# 
# 	word����չ���ұ��ṩ��command�ı�׼������. 
