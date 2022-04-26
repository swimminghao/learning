#!/bin/bash

# ��Ŀ���ļ����(��������ɵ�)ָ����һ��. 

ARGS=2
E_WRONGARGS=65

if [ $# -ne "$ARGS" ] # ��������в��������Ƿ���ȷ. 
then
   echo "Usage: `basename $0` filename column-number"
   exit $E_WRONGARGS
fi

filename=$1
column_number=$2

#  ��shell�������ݸ��ű���awk����, ��Ҫһ��С����. 
#  һ�ְ취��, ��awk�ű��е�Bash�ű�����, 
#+ ǿ��������. 
#     $'$BASH_SCRIPT_VAR'
#      ^                ^
#  ���������Ƕawd�ű���, �ͻ���ô��. 
#  ��ο�awk������ĵ����˽�����ϸ��. 

# ����awk�ű��ĵ��ø�ʽΪ:  awk ' ..... '


# ��ʼawk�ű�. 
# -----------------------------
awk '

{ total += $'"${column_number}"'
}
END {
     print total
}     

' "$filename"
# -----------------------------
# ����awk�ű�. 


#   ��shell�������ݸ���Ƕawk�ű������ǲ���ȫ��, 
#+  ����Stephane Chazelas������±������������: 
#   ---------------------------------------
#   awk -v column_number="$column_number" '
#   { total += $column_number
#   }
#   END {
#       print total
#   }' "$filename"
#   ---------------------------------------


exit 0
