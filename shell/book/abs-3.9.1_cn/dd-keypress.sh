#!/bin/bash
# dd-keypress.sh: ��¼����, ����Ҫ���س�. 


keypresses=4                      # ��¼�����ĸ���. 


old_tty_setting=$(stty -g)        # ����ɵ��ն�����. 

echo "Press $keypresses keys."
stty -icanon -echo                # ���ñ�׼ģʽ. 
                                  # ���ñ���echo. 
keys=$(dd bs=1 count=$keypresses 2> /dev/null)
# �����ָ�������ļ��Ļ�, 'dd'ʹ�ñ�׼����. 

stty "$old_tty_setting"           # �ָ��ɵ��ն�����. 

echo "You pressed the \"$keys\" keys."

# ��лStephane Chazelas, ��ʾ�����ַ���. 
exit 0
