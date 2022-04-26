#!/bin/bash
# hypotenuse.sh: ����ֱ�������ε�б��. 
#               (ֱ�Ǳ߳���ƽ����,Ȼ��Ժ�ȡƽ����)

ARGS=2                # ��Ҫ��2��ֱ�Ǳ���Ϊ�������ݽ���. 
E_BADARGS=65          # ����Ĳ���ֵ.

if [ $# -ne "$ARGS" ] # ���Դ��ݵ��ű��еĲ���ֵ.
then
  echo "Usage: `basename $0` side_1 side_2"
  exit $E_BADARGS
fi


AWKSCRIPT=' { printf( "%3.7f\n", sqrt($1*$1 + $2*$2) ) } '
#             ���� / ���ݸ�awk�Ĳ���


# ����, ������ͨ���ܵ����ݸ�awk. 
echo -n "Hypotenuse of $1 and $2 = "
echo $1 $2 | awk "$AWKSCRIPT"

exit 0
