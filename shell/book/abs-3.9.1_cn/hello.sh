#!/bin/bash
# hello.sh: ��ʾ"hello"����"goodbye"
#+          �����ڽű�����α����õ�. 

# �ڵ�ǰĿ¼��($PWD)Ϊ����ű�����һ������:
#    ln -s hello.sh goodbye
# ����, ͨ���������ַ�������������ű�:
# ./hello.sh
# ./goodbye


HELLO_CALL=65
GOODBYE_CALL=66

if [ $0 = "./goodbye" ]
then
  echo "Good-bye!"
  # ��Ȼ, ��������Ҳ�������һЩ������goodbye���͵�����.
  exit $GOODBYE_CALL
fi

echo "Hello!"
# ��Ȼ, ��������Ҳ�������һЩ������hello���͵�����.
exit $HELLO_CALL
