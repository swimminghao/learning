#!/bin/bash

#  "�滻", ����ű�����;: 
#+ ��һ���ļ��е�ĳ���ַ���(��ƥ��ģʽ), �滻Ϊ��һ���ַ���(��ƥ��ģʽ), 
#+ ����, "subst Smith Jones letter.txt".

ARGS=3         # ����ű���Ҫ3������. 
E_BADARGS=65   # ���ݸ��ű��Ĳ�����������. 

if [ $# -ne "$ARGS" ]
# ���Խű��Ĳ�������(���Ǹ��ð취). 
then
  echo "Usage: `basename $0` old-pattern new-pattern filename"
  exit $E_BADARGS
fi

old_pattern=$1
new_pattern=$2

if [ -f "$3" ]
then
    file_name=$3
else
    echo "File \"$3\" does not exist."
    exit $E_BADARGS
fi


#  ������ʵ�ֹ��ܵĴ���. 

# -----------------------------------------------
sed -e "s/$old_pattern/$new_pattern/g" $file_name
# -----------------------------------------------

#  's'��sed�����滻����, 
#+ /pattern/��ʾƥ��ģʽ. 
#  "g", ��ȫ�ֱ�־, �����Զ��滻��ÿ����
#+ ���ֵ�ȫ��$old_patternģʽ, ���������滻����һ��ƥ��.
#  ����������˽�, ���Բο�'sed'���������鼮. 

exit 0    # �ɹ����ýű�, ���᷵��0. 
