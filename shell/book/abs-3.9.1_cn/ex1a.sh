#!/bin/bash
# һ��Bash�ű�����ȷ�Ŀ�ͷ����.

# Cleanup, �汾 2

# ��ȻҪʹ��root���������.
# �ڴ˴��������,����ӡ������Ϣ,�����ڲ���root��ݵ�ʱ���˳�.

LOG_DIR=/var/log
# ���ʹ�ñ���,��Ȼ�ȰѴ���д���ĺ�.
cd $LOG_DIR

cat /dev/null > messages
cat /dev/null > wtmp


echo "Logs cleaned up."

exit # ���������һ����ȷ���Һ��ʵ��˳��ű��ķ���.
