#!/bin/bash
# rot13.sh: ���͵�rot13�㷨, 
#           ʹ�����ַ����������ٿ�����Ūһ��3��С��. 

# �÷�: ./rot13.sh filename
# ��     ./rot13.sh &lt;filename
# ��     ./rot13.sh and supply keyboard input (stdin)

cat "$@" | tr 'a-zA-Z' 'n-za-mN-ZA-M'   # "a"��Ϊ"n", "b"��Ϊ"o", �ȵ�. 
#  'cat "$@"'�ṹ
#+ �����stdin���ߴ��ļ��л������. 

exit 0
