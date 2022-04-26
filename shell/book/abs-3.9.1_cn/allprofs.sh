#!/bin/bash
# allprofs.sh: ��ӡ�����û��������ļ�

# ��Heiner Steven��д, ���ɱ������߽������޸�. 

FILE=.bashrc  #  ��ԭʼ�ű���, File containing user profile,
              #+ �����û�profile�����ļ�".profile". 

for home in `awk -F: '{print $6}' /etc/passwd`
do
  [ -d "$home" ] || continue    # ���û��homeĿ¼, ��������ѭ��. 
  [ -r "$home" ] || continue    # ���homeĿ¼û�ж�Ȩ��, ��������ѭ��. 
  (cd $home; [ -e $FILE ] && less $FILE)
done

#  ���ű�����ʱ������ʹ��'cd'�����ԭ����Ŀ¼. 
#+ ��Ϊ'cd $home'������shell�з�����, ��Ӱ�츸shell. 

exit 0
