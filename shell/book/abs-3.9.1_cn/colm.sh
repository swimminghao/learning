#!/bin/bash
# ����"column" manҳ�е�һ������, ���߶�����������˺�С���޸�. 


(printf "PERMISSIONS LINKS OWNER GROUP SIZE MONTH DAY HH:MM PROG-NAME\n" \
; ls -l | sed 1d) | column -t

#  �ܵ��е�"sed 1d"ɾ������ĵ�һ��, 
#+ ��һ�н���"total        N", 
#+ ����"N"��"ls -l"�ҵ����ļ�����. 
                                                   
# "column"�е�-tѡ������ת��Ϊ���ڴ�ӡ�ı���ʽ. 

exit 0
