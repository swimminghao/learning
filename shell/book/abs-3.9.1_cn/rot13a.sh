#!/bin/bash
# rot13a.sh: ��"rot13.sh"�ű���ͬ, ���ǻὫ���д��"��ȫ"�ļ���. 

# �÷�: ./rot13a.sh filename
# ��     ./rot13a.sh &lt;filename
# ��     ./rot13a.shͬʱ�ṩ��������(stdin)

umask 177               #  �ļ���������. 
                        #  ������ű����������ļ�
                        #+ ������600Ȩ��. 

OUTFILE=decrypted.txt   #  ���������"decrypted.txt"��
                        #+ ����ļ�ֻ�ܹ���
                        #  ����ű��ĵ�����(����root)����д. 

cat "$@" | tr 'a-zA-Z' 'n-za-mN-ZA-M' > $OUTFILE 
#    ^^ ��stdin ���ļ�������.         ^^^^^^^^^^ ����ض����ļ���. 

exit 0
