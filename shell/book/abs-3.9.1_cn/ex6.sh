#!/bin/bash

#  ���һЩϵͳ��������.
#  ����һ�ֿ�����һЩԤ���Ա�����ʩ�ĺ�ϰ��.
#  ����, ���$USER(�û��ڿ���̨���е�����)û�б����õĻ�,
#+ ��ôϵͳ�ͻ᲻����.

: ${HOSTNAME?} ${USER?} ${HOME?} ${MAIL?}
  echo
  echo "Name of the machine is $HOSTNAME."
  echo "You are $USER."
  echo "Your home directory is $HOME."
  echo "Your mail INBOX is located in $MAIL."
  echo
  echo "If you are reading this message,"
  echo "critical environmental variables have been set."
  echo
  echo

# ------------------------------------------------------

#  ${variablename?}�ṹ
#+ Ҳ�ܹ����ű��б������������.

ThisVariable=Value-of-ThisVariable
#  ע��, ˳����һ��, 
#+ ����ַ����������ܻᱻ����һЩ�Ƿ��ַ�.
: ${ThisVariable?}
echo "Value of ThisVariable is $ThisVariable".
echo
echo


: ${ZZXy23AB?"ZZXy23AB has not been set."}
#  �������ZZXy23ABû�б����õĻ�, 
#+ ��ô����ű����ӡһ��������Ϣ, Ȼ�����.

# ������Լ�ָ��������Ϣ.
# : ${variablename?"ERROR MESSAGE"}


# �ȼ���:    dummy_variable=${ZZXy23AB?}
#            dummy_variable=${ZZXy23AB?"ZXy23AB has not been set."}
#
#            echo ${ZZXy23AB?} >/dev/null

#  ʹ������"set -u"���Ƚ���Щ�������Ƿ����õķ���.
#



echo "You will not see this message, because script already terminated."

HERE=0
exit $HERE   # �����������˳�.

# ��ʵ��, ����ű������Է���ֵ1��Ϊ�˳�״̬(echo $?).
