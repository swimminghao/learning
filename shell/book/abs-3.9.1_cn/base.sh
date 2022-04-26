#!/bin/bash
##########################################################################
# �ű�       :	base.sh - �ò�ͬ����������ӡ���� (Bourne Shell)
# ����       :	Heiner Steven (heiner.steven@odn.de)
# ����       :	07-03-95
# ����       :	����
# $Id: base.sh,v 1.2 2000/02/06 19:55:35 heiner Exp $
# ==> �ϱ�������RCS ID��Ϣ. 
##########################################################################
# ����
#
# �޸ļ�¼
# 21-03-95 stv	fixed error occuring with 0xb as input (0.2)
##########################################################################

# ==> �ڱ�����ʹ������ű�ͨ����ԭ���ߵ���Ȩ. 
# ==> ע���Ǳ���������ӵ�. 

NOARGS=65
PN=`basename "$0"`			       # ������
VER=`echo '$Revision: 1.2 $' | cut -d' ' -f2`  # ==> VER=1.2

Usage () {
    echo "$PN - print number to different bases, $VER (stv '95)
usage: $PN [number ...]

If no number is given, the numbers are read from standard input.
A number may be
    binary (base 2)		starting with 0b (i.e. 0b1100)
    octal (base 8)		starting with 0  (i.e. 014)
    hexadecimal (base 16)	starting with 0x (i.e. 0xc)
    decimal			otherwise (i.e. 12)" >&2
    exit $NOARGS 
}   # ==> ��ӡ���÷���Ϣ�ĺ���. 

Msg () {
    for i   # ==> ʡ��[list].
    do echo "$PN: $i" >&2
    done
}

Fatal () { Msg "$@"; exit 66; }

PrintBases () {
    # �������ֵ�����
    for i      # ==> ʡ��[list]...
    do         # ==> �����Ƕ������в������в���. 
	case "$i" in
	    0b*)		ibase=2;;	# 2����
	    0x*|[a-f]*|[A-F]*)	ibase=16;;	# 16����
	    0*)			ibase=8;;	# 8����
	    [1-9]*)		ibase=10;;	# 10����
	    *)
		Msg "illegal number $i - ignored"
		continue;;
	esac

	# ȥ��ǰ׺, ��16��������ת��Ϊ��д(bc������Ҫ��ô��)
	number=`echo "$i" | sed -e 's:^0[bBxX]::' | tr '[a-f]' '[A-F]'`
	# ==> ʹ��":" ��Ϊsed�ָ���, ����ʹ��"/".

	# ������ת��Ϊ10����
	dec=`echo "ibase=$ibase; $number" | bc`  # ==> 'bc'�Ǹ����㹤��.
	case "$dec" in
	    [0-9]*)	;;			 # ����û����
	    *)		continue;;		 # ����: ����
	esac

	# ��һ���ϴ�ӡ����ת���������. 
	# ==> 'here document'�ṩ�����б��'bc'. 
	echo `bc <<!
	    obase=16; "hex="; $dec
	    obase=10; "dec="; $dec
	    obase=8;  "oct="; $dec
	    obase=2;  "bin="; $dec
!
    ` | sed -e 's: :	:g'

    done
}

while [ $# -gt 0 ]
# ==>  �������ʹ��һ��"whileѭ��", 
# ==>+ ��Ϊ���е�case�������˳�ѭ������
# ==>+ �����ű�. 
# ==> (��л, Paulo Marcel Coelho Aragao.)
do
    case "$1" in
	--)     shift; break;;
	-h)     Usage;;                 # ==> ������Ϣ. 
	-*)     Usage;;
         *)     break;;			# ��һ������
    esac   # ==> ���ڷǷ�������и��ϸ����Ƿǳ����õ�. 
    shift
done

if [ $# -gt 0 ]
then
    PrintBases "$@"
else					# ��stdin�ж�ȡ
    while read line
    do
	PrintBases $line
    done
fi


exit 0
