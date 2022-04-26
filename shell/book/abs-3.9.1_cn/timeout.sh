#!/bin/bash
# timeout.sh

#  ��Stephane Chazelas����д,
#+ ������������һЩ�޸�.

INTERVAL=5                # ��ʱ���

timedout_read() {
  timeout=$1
  varname=$2
  old_tty_settings=`stty -g`
  stty -icanon min 0 time ${timeout}0
  eval read $varname      # ���߽�����ȡ$varname����
  stty "$old_tty_settings"
  # �ο�"stty"��manҳ.
}

echo; echo -n "What's your name? Quick! "
timedout_read $INTERVAL your_name

#  ���ַ������ܲ�������ÿ���ն������϶���������ʹ�õ�.
#  ���ĳ�ʱʱ�������ھ�����ж�����.
#+ (ͨ����25.5��).

echo

if [ ! -z "$your_name" ]  # ����ڳ�ʱ֮ǰ���ֱ�����...
then
  echo "Your name is $your_name."
else
  echo "Timed out."
fi

echo

# ����ű�����Ϊ������ű�"timed-input.sh"����Ϊ��Щ��ͬ.
# ÿ�ΰ���, ��ʱ����������(����ע: ���Ǵ�0��ʼ).

exit 0
