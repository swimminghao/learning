#!/bin/bash
# self-exec.sh

echo

echo "This line appears ONCE in the script, yet it keeps echoing."
echo "The PID of this instance of the script is still $$."
#     �ϱ�����չʾ�˲�û��fork����shell.

echo "==================== Hit Ctl-C to exit ===================="

sleep 1

exec $0   #  �����˱��ű�����һ��ʵ��,
          #+ ��������²�����ʵ��ȴ������ԭ����ʵ��.

echo "This line will never echo!"  # Ϊʲô��������?

exit 0
