#!/bin/bash
# userlist.sh

PASSWORD_FILE=/etc/passwd
n=1           # User number

for name in $(awk 'BEGIN{FS=":"}{print $1}' < "$PASSWORD_FILE" )
# ��ָ� = :             ^^^^^^
# ��ӡ����һ����                 ^^^^^^^^
# ��password�ļ���ȡ������                     ^^^^^^^^^^^^^^^^^
do
  echo "USER #$n = $name"
  let "n += 1"
done  


# USER #1 = root
# USER #2 = bin
# USER #3 = daemon
# ...
# USER #30 = bozo

exit 0

#  ��ϰ:
#  -----
#  һ����ͨ�û�(������һ����ͨ�û����еĽű�)
#+ ��ô���ܹ���ȡ/etc/passwd��?
#  ���Ƿ���һ����ȫ©��? Ϊʲô��?Ϊʲô����?
