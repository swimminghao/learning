#!/bin/bash

WIDTH=40                    # ��Ϊ40�п�. 

b=`ls /usr/local/bin`       # ȡ���ļ��б�...

echo $b | fmt -w $WIDTH

# Ҳ����ʹ�����·���, ��������ͬ��.
#    echo $b | fold - -s -w $WIDTH
 
exit 0
