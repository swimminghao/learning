#!/bin/bash
# usage-message.sh

: ${1?"Usage: $0 ARGUMENT"}
#  ���û���ṩ�����в����Ļ�, ��ô�ű����������˳���, 
#+ ���Ҵ�ӡ���´�����Ϣ.
#    usage-message.sh: 1: Usage: usage-message.sh ARGUMENT

echo "These two lines echo only if command-line parameter given."
echo "command line parameter = \"$1\""

exit 0  # ����ṩ�������в���, ��ô�ű��ͻ��������˳�.

# �ֱ����������в���ʱ��û�������в���ʱ, �ű����˳�״̬.
# ����������в���, ��ô"$?"����0.
# ���û�еĻ�, ��ô"$?"����1.
