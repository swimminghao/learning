#!/bin/bash
# quote-fetch.sh: ����һ�ݹ�Ʊ����. 


E_NOPARAMS=66

if [ -z "$1" ]  #����ָ����Ҫ��ȡ�Ĺ�Ʊ(����). 
  then echo "Usage: `basename $0` stock-symbol"
  exit $E_NOPARAMS
fi

stock_symbol=$1

file_suffix=.html
# ���һ��HTML�ļ�, ����Ҫ��ȷ������. 
URL='http://finance.yahoo.com/q?s='
# Yahoo���ڰ��, ��׺�ǹ�Ʊ��ѯ.

# -----------------------------------------------------------
wget -O ${stock_symbol}${file_suffix} "${URL}${stock_symbol}"
# -----------------------------------------------------------


# ��http://search.yahoo.com�ϲ�ѯ��ز���:
# -----------------------------------------------------------
# URL="http://search.yahoo.com/search?fr=ush-news&amp;p=${query}"
# wget -O "$savefilename" "${URL}"
# -----------------------------------------------------------
# �������URL���б�.

exit $?

# ��ϰ:
# -----
#
# 1) ���һ����������֤�û��Ƿ�����.
#    (��ʾ: ��"ppp"��"connect"������'ps -ax'�����.
#
# 2) �޸�����ű�, ������ű����л�ñ�������Ԥ��������,
#+   ���û���zip code��Ϊ����.
