#!/bin/bash
#  setnew-password.sh: ����ű���������˵��passwd����. 
#                      �����������������ű�, ���ź�, ��ɲ��Ǹ�������. 
#  ����ű�������root���������. 

ROOT_UID=0         # Root��$UIDΪ0.
E_WRONG_USER=65    # ����root�û�?

E_NOSUCHUSER=70
SUCCESS=0


if [ "$UID" -ne "$ROOT_UID" ]
then
  echo; echo "Only root can run this script."; echo
  exit $E_WRONG_USER
else
  echo
  echo "You should know better than to run this script, root."
  echo "Even root users get the blues... "
  echo
fi  


username=bozo
NEWPASSWORD=security_violation

# ���bozo�Ƿ�������. 
grep -q "$username" /etc/passwd
if [ $? -ne $SUCCESS ]
then
  echo "User $username does not exist."
  echo "No password changed."
  exit $E_NOSUCHUSER
fi  

echo "$NEWPASSWORD" | passwd --stdin "$username"
#  'passwd'�����'--stdin'ѡ������
#+ ��stdin(���߹ܵ�)�л��һ���µ�����. 

echo; echo "User $username's password changed!"

# �ڽű���ʹ��'passwd'�����Ƿǳ�Σ�յ�. 

exit 0
