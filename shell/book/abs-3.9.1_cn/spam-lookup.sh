#!/bin/bash
# spam-lookup.sh: �������õ����������������ʼ�������.
# ��лMichael Zick.
                                                      
# ��������в���.
ARGCOUNT=1
E_WRONGARGS=65
if [ $# -ne "$ARGCOUNT" ]
then
  echo "Usage: `basename $0` domain-name"
  exit $E_WRONGARGS
fi


dig +short $1.contacts.abuse.net -c in -t txt
# Ҳ����:
#     dig +nssearch $1
#     �����ҵ�"�����������ַ�����"������ʾSOA��¼.
                                                               
# �±����Ҳ����:
#     whois -h whois.abuse.net $1
#           ^^ ^^^^^^^^^^^^^^^  ָ������.
#     ʹ���������Ҳ���Բ��Ҷ�������ʼ�������, ����:"
#     whois -h whois.abuse.net $spamdomain1 $spamdomain2 . . .
                                                               
                                                               
#  ��ϰ:
#  -----
#  ��չ����ű��Ĺ���,
#+ ���������Զ�����e-mail��֪ͨ
#+ ��Ҫ�Դ˸����ISP����ϵ��ַ.
#  ��ʾ: ʹ��"mail"����.

exit $?

# spam-lookup.sh chinatietong.com
#                һ����֪�������ʼ���. (����: �й���ͨ . . .)

# "crnet_mgr@chinatietong.com"
# "crnet_tec@chinatietong.com"
# "postmaster@chinatietong.com"


#  ������ҵ�����ű���һ�����꾡�İ汾,
#+ �����SpamViz����ҳ, http://www.spamviz.net/index.html.
