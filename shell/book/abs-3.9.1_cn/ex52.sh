#!/bin/bash
# �ڵ�ǰĿ¼����Uudecode����������uuencode������ļ�. 

lines=35        # �����ͷ����35��(��Χ�ܿ�). 

for File in *   # ��������$PWD�µ��ļ�. 
do
  search1=`head -$lines $File | grep begin | wc -w`
  search2=`tail -$lines $File | grep end | wc -w`
  #  ��Uuencode��������ļ����ļ���ʼ�ĵط����и�"begin", 
  #+ ���ļ���β�ĵط�����"end".
  if [ "$search1" -gt 0 ]
  then
    if [ "$search2" -gt 0 ]
    then
      echo "uudecoding - $File -"
      uudecode $File
    fi  
  fi
done  

#  С�Ĳ�Ҫ������ű������Լ�, 
#+ ��Ϊ��Ҳ�������Ҳ��Ϊ��һ������uuencode��������ļ�, 
#+ �ⶼ����Ϊ����ű�����Ҳ����"begin"��"end". 

#  ��ϰ:
#  -----
#  �޸�����ű�, �������Լ��һ���������ÿ���ļ�, 
#+ ���������һ��û�ҵ��Ļ�������. 

exit 0
