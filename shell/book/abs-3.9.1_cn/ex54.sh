#!/bin/bash

exec echo "Exiting \"$0\"."   # �ű�Ӧ���������˳�.

# ----------------------------------
# The following lines never execute.

echo "This echo will never echo."

exit 99                       #  �ű��ǲ����������˳���.
                              #  �ű��˳����ʹ��'echo $?'
                              #+ �����һ���˳���.
                              #  һ�� *����* 99.
