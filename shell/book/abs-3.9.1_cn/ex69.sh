#!/bin/bash

# �÷ǽ����ķ�ʽ��ʹ��'vi'�༭һ���ļ�. 
# ģ��'sed'.

E_BADARGS=65

if [ -z "$1" ]
then
  echo "Usage: `basename $0` filename"
  exit $E_BADARGS
fi

TARGETFILE=$1

# ���ļ��в�������, Ȼ�󱣴�. 
#--------Begin here document-----------#
vi $TARGETFILE &lt;&lt;x23LimitStringx23
i
This is line 1 of the example file.
This is line 2 of the example file.
^[
ZZ
x23LimitStringx23
#----------End here document-----------#

#  ע���ϱ�^[��һ��ת���, ����Ctrl+v &lt;Esc&gt;����,
#+ ��ʵ������&lt;Esc&gt��;. 

#  Bram Moolenaarָ�����ַ�������ʹ����'vim'��, (����ע: Bram Moolenaar��vim����)
#+ ��Ϊ���ܻ�����ն��໥Ӱ�������. 

exit 0
