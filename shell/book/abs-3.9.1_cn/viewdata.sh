#!/bin/bash
# viewdata.sh
# ת����VIEWDATA.BAT��shell�ű�. 

DATAFILE=/home/bozo/datafiles/book-collection.data
ARGNO=1

# @ECHO OFF                 �������������Ͳ���Ҫ��. 

if [ $# -lt "$ARGNO" ]    # IF !%1==! GOTO VIEWDATA
then
  less $DATAFILE          # TYPE C:\MYDIR\BOOKLIST.TXT | MORE
else
  grep "$1" $DATAFILE     # FIND "%1" C:\MYDIR\BOOKLIST.TXT
fi  

exit 0                    # :EXIT0

#  ��ת, ��ǩ, ��������һЩС�ֶ�, ��shell�ű��оͲ���Ҫ��. 
#  ���ǿ���˵, ת����Ľű���ԭʼ�������ļ��õĶ�, 
#+ ������, ������������, ������. 
