#!/bin/bash

#  'echo'���ڴ�ӡ������Ϣ��˵�Ƿǳ����õ�, 
#+  �����ڴ�ӡ��Ϣ��ʱ���ܾ��е�������. 
#   'cat' here document���Խ���������. 

cat &lt;&lt;End-of-message
-------------------------------------
This is line 1 of the message.
This is line 2 of the message.
This is line 3 of the message.
This is line 4 of the message.
This is the last line of the message.
-------------------------------------
End-of-message

#  ���±����д����ϱߵĵ�7��, 
#+   cat &gt; $Newfile &lt;&lt;End-of-message
#+       ^^^^^^^^^^
#+ ��ô�ͻ�����д���ļ�$Newfile��, ������stdout. 

exit 0


#--------------------------------------------
# �±ߵĴ��벻������, ��Ϊ�ϱ���"exit 0". 

# S.C. ָ���±ߴ���Ҳ�ܹ��ﵽ��ͬĿ��. 
echo "-------------------------------------
This is line 1 of the message.
This is line 2 of the message.
This is line 3 of the message.
This is line 4 of the message.
This is the last line of the message.
-------------------------------------"
# Ȼ��, �ı��п��ܲ��������˫����, �������Ǳ�ת��. 
