#!/bin/bash
# factr.sh: �ֽ�Լ��

MIN=2       # ����������С�Ͳ�����.
E_NOARGS=65
E_TOOSMALL=66

if [ -z $1 ]
then
  echo "Usage: $0 number"
  exit $E_NOARGS
fi

if [ "$1" -lt "$MIN" ]
then
  echo "Number to factor must be $MIN or greater."
  exit $E_TOOSMALL
fi  

# ��ϰ: ������ͼ��(��ֹ�����͵Ĳ���).

echo "Factors of $1:"
# ---------------------------------------------------------------------------------
echo "$1[p]s2[lip/dli%0=1dvsr]s12sid2%0=13sidvsr[dli%0=1lrli2+dsi!>.]ds.xd1<2" | dc
# ---------------------------------------------------------------------------------
# �ϱ����д�����Michel Charpentier��д��&lt;charpov@cs.unh.edu&gt;.
# �ڴ�ʹ�þ�����Ȩ(��л). 

 exit 0
