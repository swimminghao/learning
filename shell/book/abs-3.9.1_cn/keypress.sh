#!/bin/bash
# keypress.sh: ����û�����("hot keys").

echo

old_tty_settings=$(stty -g)   # �����ϵ�����(Ϊʲô?). 
stty -icanon
Keypress=$(head -c1)          # ����ʹ��$(dd bs=1 count=1 2> /dev/null)
                              # �ڷ�GNUϵͳ��

echo
echo "Key pressed was \""$Keypress"\"."
echo

stty "$old_tty_settings"      # �ָ��ϵ�����. 

# ��л, Stephane Chazelas.

exit 0
