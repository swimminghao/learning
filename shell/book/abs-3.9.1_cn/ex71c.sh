#!/bin/bash
#  һ��ʹ��'cat'��here document, ���ǽ����˲����滻. 

NAME="John Doe"
RESPONDENT="the author of this fine script"  

cat &lt;&lt;'Endofmessage'

Hello, there, $NAME.
Greetings to you, $NAME, from $RESPONDENT.

Endofmessage

#  ���"limit string"�����û�ת��Ļ�, ��ô�ͽ����˲����滻. 
#  �±ߵ����ַ�ʽ������ͬ��Ч��. 
#  cat &lt;&lt;"Endofmessage"
#  cat &lt;&lt;\Endofmessage

exit 0
