#!/bin/bash
# self-destruct.sh

kill $$  # �ű����ڴ˴������Լ��Ľ���.
         # ����һ��,"$$"���ǽű���PID.

echo "This line will not echo."
# ����shell���ᷢ��һ��"Terminated"��Ϣ��stdout.

exit 0

#  �ڽű������������֮��,
#+ �����ص��˳�����ʲô?
#
# sh self-destruct.sh
# echo $?
# 143
#
# 143 = 128 + 15
#             �����ź�
