#!/bin/bash
# printf ʾ��

PI=3.14159265358979
DecimalConstant=31373
Message1="Greetings,"
Message2="Earthling."

echo

printf "Pi to 2 decimal places = %1.2f" $PI
echo
printf "Pi to 9 decimal places = %1.9f" $PI  # ���ܹ���ȷ�Ľ���.

printf "\n"                                  # ��ӡһ������,
                                             # �ȼ��� 'echo' . . .

printf "Constant = \t%d\n" $DecimalConstant  # ����һ�� tab (\t).

printf "%s %s \n" $Message1 $Message2

echo

# ==========================================#
# ģ��C����, sprintf().
# ʹ��һ����ʽ�����ַ���������һ������.

echo 

Pi12=$(printf "%1.12f" $PI)
echo "Pi to 12 decimal places = $Pi12"

Msg=`printf "%s %s \n" $Message1 $Message2`
echo $Msg; echo $Msg

#  ��������������һ��, ����'sprintf'����
#+ ��Ϊһ���ɱ����ص�ģ��,
#+ ���ǲ��߿���ֲ��.

exit 0
