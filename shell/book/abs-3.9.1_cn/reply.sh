#!/bin/bash
# reply.sh

# REPLY���ṩ��'read'�����Ĭ�ϱ���.

echo
echo -n "What is your favorite vegetable? "
read

echo "Your favorite vegetable is $REPLY."
#  ���ҽ���û�б����ṩ��"read"����ʱ, 
#+ REPLY�ű������һ��"read"��������ֵ.

echo
echo -n "What is your favorite fruit? "
read fruit
echo "Your favorite fruit is $fruit."
echo "but..."
echo "Value of \$REPLY is still $REPLY."
#  $REPLY���Ǳ�������һ��read�����ֵ,
#+ ��Ϊ����$fruit�����뵽������µ�"read"������.

echo

exit 0
