#!/bin/bash
# erase.sh: �ڶ�ȡ����ʱʹ��"stty"������һ�������ַ�. 

echo -n "What is your name? "
read name                      #  �������˸��
                               #+ ��ɾ��������ַ�. 
                               #  ��ʲô����? 
echo "Your name is $name."

stty erase '#'                 #  ��"hashmark"(#)����Ϊ�˸��ַ�. 
echo -n "What is your name? "
read name                      #  ʹ��#��ɾ����������ַ�. 
echo "Your name is $name."

# ����: ��ʹ�ڽű��˳���, �µļ�ֵ���Ǳ������������. (����: ����ʹ��stty erase '^?'���лָ�)

exit 0
