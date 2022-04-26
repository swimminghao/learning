#!/bin/bash

dir1=/usr/local
dir2=/var/spool

pushd $dir1
# ���Զ�����һ�� 'dirs' (��Ŀ¼ջ�������е�stdout��).
echo "Now in directory `pwd`." # ʹ�ú������õ� 'pwd'.

# ���ڶ�'dir1'��һЩ����.
pushd $dir2
echo "Now in directory `pwd`."

# ���ڶ�'dir2'��һЩ����.
echo "The top entry in the DIRSTACK array is $DIRSTACK."
popd
echo "Now back in directory `pwd`."

# ����, ��'dir1'������Ĳ���.
popd
echo "Now back in original working directory `pwd`."

exit 0

# ����㲻ʹ�� 'popd' ���ᷢ��ʲô -- Ȼ���˳�����ű�?
# ����������ĸ�Ŀ¼��? Ϊʲô?
