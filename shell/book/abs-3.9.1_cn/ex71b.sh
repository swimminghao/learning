#!/bin/bash
# һ��ʹ��'cat'�����here document, ʹ���˲����滻. 

# ���������в�������,   ./scriptname
# ��һ�������в�������,   ./scriptname Mortimer
# ��һ������2������(������������)�������в�������, 
#                           ./scriptname "Mortimer Jones"

CMDLINEPARAM=1     #  �����������ٵ������в�������. 

if [ $# -ge $CMDLINEPARAM ]
then
  NAME=$1          #  ��������в�������1��, 
                   #+ ��ô��ֻȡ��һ������. 
else
  NAME="John Doe"  #  Ĭ�������, ���û�������в����Ļ�. 
fi  

RESPONDENT="the author of this fine script"  
  

cat &lt;&lt;Endofmessage

Hello, there, $NAME.
Greetings to you, $NAME, from $RESPONDENT.

# This comment shows up in the output (why?).

Endofmessage

# ע���ϱߵĿ���Ҳ��ӡ���, 
# ���ϱ�����"ע��"��ȻҲ���ӡ�����. 
# (����ע: �����Ϊʲô����������ע�͵�ԭ��, �������ִ����ԭ��)
exit 0
