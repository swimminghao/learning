#!/bin/bash
# ʹ��trap����׽����ֵ. 

trap 'echo Variable Listing --- a = $a  b = $b' EXIT
#  EXIT�ǽű���exit�����������źŵ�����. 
#
#  "trap"��ָ���������������ִ��, 
#+ ֻ�н��յ����ʵ��ź�, ��Щ����Ż�ִ��. 

echo "This prints before the \"trap\" --"
echo "even though the script sees the \"trap\" first."
echo

a=39

b=36

exit 0
#  ע��, ��ʹע�͵����������'exit'����, Ҳ�������ʲô��ͬ�Ľ��, 
#+ ������Ϊ�������ִ����Ϻ�, ������ô��, �ű������˳���. 
