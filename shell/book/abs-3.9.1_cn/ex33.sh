#!/bin/bash
# ��ϰ getopts �� OPTIND
# ��Bill Gradwohl�Ľ�����, ����ű��� 10/09/03 ���޸�.


# ���������ǽ�ѧϰ���ʹ�� 'getopts' ������ű��������в���.
# ��������Ϊ"ѡ��"(��־)������, ���Ҷ�ѡ��������. 

# ��һ��, ʹ�����·�������������ű�
# 'scriptname -mn'
# 'scriptname -oq qOption' (qOption �����������������Щ�����ַ����ַ���.)
# 'scriptname -qXXX -r'
#
# 'scriptname -qr'    - ����Ľ��, "r" ����������ѡ�� "q" �Ĳ���.
# 'scriptname -q -r'  - ����Ľ��, ͬ��.
# 'scriptname -mnop -mnop'  - ����Ľ��
# (OPTIND��ѡ��մ��ݽ����ĵط��ǲ��ɿ���). 
# (����ע: Ҳ����˵OPTINDֻ��һ������ָ��, ָ����һ��������λ��.
#  ����:	-mnop ��mno�����λ��OPTION��Ϊ1, ����p�Ĵ���ͱ��2, 
#			-m -n -o ��m��ʱ��OPTIONΪ2, ��nΪ3, oΪ4,
#			Ҳ����˵����ָ����һ��λ��). 
#
#  ���ѡ����Ҫһ�������Ļ�("flag:"), ��ô������ȡ
#+ �������Ͻ���������ߵ��κ��ַ�.

NO_ARGS=0 
E_OPTERROR=65

if [ $# -eq "$NO_ARGS" ]  # ���������в����͵��ýű�?
then
  echo "Usage: `basename $0` options (-mnopqrs)"
  exit $E_OPTERROR        # ���û�в������ݽ���, ��ô���˳��ű�, ���ҽ��ʹ˽ű����÷�.
fi  
# �÷�: scriptname -options
# ע��: ����ʹ�����ۺ� (-) 


while getopts ":mnopq:rs" Option
do
  case $Option in
    m     ) echo "Scenario #1: option -m-   [OPTIND=${OPTIND}]";;
    n | o ) echo "Scenario #2: option -$Option-   [OPTIND=${OPTIND}]";;
    p     ) echo "Scenario #3: option -p-   [OPTIND=${OPTIND}]";;
    q     ) echo "Scenario #4: option -q-\
 with argument \"$OPTARG\"   [OPTIND=${OPTIND}]";;
    #  ע��, ѡ��'q'�������һ������, 
    #+ ����, Ĭ�Ͻ�ʧ��.
    r | s ) echo "Scenario #5: option -$Option-";;
    *     ) echo "Unimplemented option chosen.";;   # Ĭ������Ĵ���
  esac
done

shift $(($OPTIND - 1))
#  (����ע: shift�����ǿ��Դ�������, ���������ƶ��ĸ���)
#  ������ָ���1, ��������ָ����һ������.
#  $1 �������õ����������ϵĵ�һ����ѡ�����,
#+ �����һ�������Ĳ������ڵĻ�.

exit 0

#   ���� Bill Gradwohl ��������,
#  "getopts��������ָ��һ������, 
#+ ����scriptname -mnop -mnop����һ�ֱȽ���������, 
#+ ��Ϊ��ʹ��OPTIND��ʱ��, û�пɿ��ķ��������ֵ��״��ݽ�����ʲô����."
