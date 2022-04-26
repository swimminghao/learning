#!/bin/bash
# ex18.sh

# �Ƿ�'whois domain-name'�ܹ��ҵ�����3������֮һ: 
#                    ripe.net, cw.net, radb.net

# ������ű�������Ϊ'wh', Ȼ��ŵ�/usr/local/binĿ¼��.

# ��Ҫ��������:
# ln -s /usr/local/bin/wh /usr/local/bin/wh-ripe
# ln -s /usr/local/bin/wh /usr/local/bin/wh-cw
# ln -s /usr/local/bin/wh /usr/local/bin/wh-radb

E_NOARGS=65


if [ -z "$1" ]
then
  echo "Usage: `basename $0` [domain-name]"
  exit $E_NOARGS
fi

# ���ű�����, Ȼ����ú��ʵķ���.
case `basename $0` in    # Or:    case ${0##*/} in
    "wh"     ) whois $1@whois.ripe.net;;
    "wh-ripe") whois $1@whois.ripe.net;;
    "wh-radb") whois $1@whois.radb.net;;
    "wh-cw"  ) whois $1@whois.cw.net;;
    *        ) echo "Usage: `basename $0` [domain-name]";;
esac 

exit $?
