#!/bin/bash
# stupid-script-tricks.sh: ����, ���ڼ�������ű�. 
# ������"Stupid Script Tricks," ��I.


dangerous_variable=`cat /boot/vmlinuz`   # ����ѹ������Linux�ں�����. 

echo "string-length of \$dangerous_variable = ${#dangerous_variable}"
# ����ַ��������ĳ�����$dangerous_variable = 794151
# (��Ҫʹ��as 'wc -c /boot/vmlinuz'�����㳤��.)

# echo "$dangerous_variable"
# ǧ�������ô��! ��������������ű�. 


#  �ű������Ѿ���ʶ�����������ļ����õ�
#+ ������һ�����ö�û��. 

exit 0
