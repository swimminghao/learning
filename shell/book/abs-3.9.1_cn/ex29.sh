#!/bin/bash
# �����ַ�����Χ.

echo; echo "Hit a key, then hit return."
read Keypress

case "$Keypress" in
  [[:lower:]]   ) echo "Lowercase letter";;
  [[:upper:]]   ) echo "Uppercase letter";;
  [0-9]         ) echo "Digit";;
  *             ) echo "Punctuation, whitespace, or other";;
esac      #  �����ַ����ķ�Χ������[������]��,
          #+ ���߳�����POSIX����[[˫��������.

#  ��������ӵĵ�һ���汾��,
#+ ���Դ�д��Сд�ַ����Ĺ���ʹ�õ���
#+ [a-z] �� [A-Z].
#  �����÷���ĳЩ�ض����ϵĻ�ĳЩLinux���а��в��ܹ���������.
#  POSIX �ķ����߿���ֲ��.
#  ��лFrank Wangָ�������.

#  ��ϰ:
#  -----
#  ��������ű������ֳ�����, ��ֻ�����εİ���, Ȼ��ͽ�����.
#  �޸�����ű�, �����ܹ������ظ�����,
#+ ����ÿ�ΰ���, ����ֻ����"X"������ʱ�Ž���. 
#  ��ʾ: ����Щ���붼��"while"ѭ��Ȧ����. 

exit 0
