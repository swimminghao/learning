#!/bin/bash
# findstring.sh:
# ��һ��ָ��Ŀ¼�������ļ��в���һ���ض����ַ���.

directory=/usr/bin/
fstring="Free Software Foundation"  # �鿴�ĸ��ļ��а���FSF.

for file in $( find $directory -type f -name '*' | sort )
do
  strings -f $file | grep "$fstring" | sed -e "s%$directory%%"
  #  ��"sed"���ʽ��,
  #+ ���Ǳ����滻���������滻�ָ���"/",
  #+ ��Ϊ"/"������������Ҫ���˵��ַ���֮һ.
  #  �������"%"����"/"��Ϊ�ָ���,��ô���������ʧ��,������һ��������Ϣ.(��һ��).
done  

exit 0

#  ��ϰ (�ܼ�):
#  ---------------
#  ת������ű�, �������в���
#+ �����ڲ��õ�$directory��$fstring.
