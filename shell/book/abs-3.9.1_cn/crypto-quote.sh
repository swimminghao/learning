#!/bin/bash
# crypto-quote.sh: ����

#  ʹ�õ����滻(��һ��ĸ�滻��)�����м���. 
#  ����ű��Ľ����"Crypto Quote"��Ϸ
#+ ����Ϊ������. 


key=ETAOINSHRDLUBCFGJMQPVWZYXK
# "key"������һ���������ĸ��.
# �޸�"key"�ͻ��޸ļ��ܵĽ��.

# 'cat "$@"' �ṹ�ȿ��Դ�stdin�������, Ҳ���Դ��ļ��л������. 
# ���ʹ��stdin, ��ôҪ����������ʹ�� Control-D. 
# �����Ҫ����������ָ���ļ���. 

cat "$@" | tr "a-z" "A-Z" | tr "A-Z" "$key"
#        |   ת��Ϊ��д   |     ����
# Сд, ��д, ���ϴ�Сд, ��������������.
# ���Ǵ��ݽ����ķ���ĸ�ַ����������κα仯.


# ���±ߵ������������ű�:
# "Nothing so needs reforming as other people's habits."
# --Mark Twain
#                                                        
# ���Ϊ:
# "CFPHRCS QF CIIOQ MINFMBRCS EQ FPHIM GIFGUI'Q HETRPQ."
# --BEML PZERC
                                                         
# ����:
# cat "$@" | tr "$key" "A-Z"
                                                         
                                                         
#  ����򵥵�����������׵ı�һ��12���С��
#+ ��Ǧ�ʺ�ֽ�ƽ�.

exit 0

#  ��ϰ:
#  -----
#  �޸�����ű�, ���������������в���
#+ ���������ܻ����.
