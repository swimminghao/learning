#!/bin/bash
# param-sub.sh

#  һ�������Ƿ�����������,
#+ ����Ӱ����������Ƿ�ʹ��Ĭ��ֵ, 
#+ ��ʹ�������ֵΪ��(null).

username0=
echo "username0 has been declared, but is set to null."
echo "username0 = ${username0-`whoami`}"
# ���������.

echo

echo username1 has not been declared.
echo "username1 = ${username1-`whoami`}"
# �������Ĭ��ֵ.

username2=
echo "username2 has been declared, but is set to null."
echo "username2 = ${username2:-`whoami`}"
#                            ^
# �����, ��Ϊ:-���-��һ����������.
# �������ϱߵ����ӱȽ�һ��.


#

# ����һ��:

variable=
# �����Ѿ�������, ������Ϊ��ֵ. 

echo "${variable-0}"    # (û�����)
echo "${variable:-1}"   # 1
#               ^

unset variable

echo "${variable-2}"    # 2
echo "${variable:-3}"   # 3

exit 0
