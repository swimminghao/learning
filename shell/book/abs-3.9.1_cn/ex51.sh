#!/bin/bash
# ��ϰ'date'����

echo "The number of days since the year's beginning is `date +%j`."
# ��Ҫ�ڵ��ø�ʽ��ǰ�߼���һ��'+'��.
# %j�������������Ǳ���ȵĵڼ���. 

echo "The number of seconds elapsed since 01/01/1970 is `date +%s`."
#  %s��������"UNIX Ԫ��"������Ϊֹ������,
#+ �����ⶫ�����ڻ�����ô?

prefix=temp
suffix=$(date +%s)  # 'date'�����"+%s"ѡ����GNU����.
filename=$prefix.$suffix
echo $filename
#  ����һ�ַǳ��õĲ���"Ψһ"��ʱ�ļ��İ취,
#+ ������ʹ��$$��ǿ.

# ������˽�'date'����ĸ���ѡ��, �������������manҳ.

exit 0
