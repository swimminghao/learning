#!/bin/bash

#  �ű���ͷ��"#!/bin/bash -r"������, 
#+ ��ʹ�����ű�������ģʽ������. 

echo

echo "Changing directory."
cd /usr/local
echo "Now in `pwd`"
echo "Coming back home."
cd
echo "Now in `pwd`"
echo

# �����޵�ģʽ�£����в���������. 

set -r
# set --restricted    Ҳ������ͬ��Ч��. 
echo "==> Now in restricted mode. <=="

echo
echo

echo "Attempting directory change in restricted mode."
cd ..
echo "Still in `pwd`"

echo
echo

echo "\$SHELL = $SHELL"
echo "Attempting to change shell in restricted mode."
SHELL="/bin/ash"
echo
echo "\$SHELL= $SHELL"

echo
echo

echo "Attempting to redirect output in restricted mode."
ls -l /usr/bin > bin.files
ls -l bin.files    # �����г��ղŴ������ļ�. 

echo

exit 0
