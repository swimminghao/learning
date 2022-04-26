#!/bin/bash

#  ����"���еĺ�"�ű�������һ���汾(col-totaler.sh)
#+ �Ǹ��ű����԰�Ŀ���ļ��е�ָ�������ϵ���������ȫ���ۼ�����,���.
#  ����汾����һ������ͨ��export����ʽ���ݵ�'awk'�� . . .
#+ ���Ұ�awk�ű��ŵ�һ��������.


ARGS=2
E_WRONGARGS=65

if [ $# -ne "$ARGS" ] # ��������в����ĸ���.
then
   echo "Usage: `basename $0` filename column-number"
   exit $E_WRONGARGS
fi

filename=$1
column_number=$2

#===== �ϱߵ��ⲿ��,��ԭʼ�ű���ȫһ�� =====#

export column_number
# ���к�export����, ������ߵĽ��̾Ϳ�����.


# -----------------------------------------------
awkscript='{ total += $ENVIRON["column_number"] }
END { print total }'
# �ǵ�, �������Ա���awk�ű�.
# -----------------------------------------------

# ����, �������awk�ű�.
awk "$awkscript" "$filename"

# ��л, Stephane Chazelas.

exit 0
