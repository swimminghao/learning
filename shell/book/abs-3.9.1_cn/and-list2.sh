#!/bin/bash

ARGS=1        # �����Ĳ�������. 
E_BADARGS=65  # ������ݵĲ�����������ȷ, ��ô��������˳���. 

test $# -ne $ARGS && echo "Usage: `basename $0` $ARGS argument(s)" && exit $E_BADARGS
#  ���"����1"����Ϊtrue (��ʾ���ݸ��ű��Ĳ�����������), 
#+ �����µ�����ᱻִ��, ���ҽű�����������. 

# ֻ�е�����Ĳ�������Ϊfalse��ʱ��, ���д���Żᱻִ��. 
echo "Correct number of arguments passed to this script."

exit 0

# Ϊ�˼���˳���, �ڽű�������ʱ�����ʹ��"echo $?"���鿴�˳���. 
