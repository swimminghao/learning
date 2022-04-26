#! /bin/bash
# CopyArray.sh
#
# ����ű���Michael Zick����д. 
# ��ͨ��������Ȩ, �����ڱ�����ʹ��. 

#  ���"ͨ�����ִ�ֵ&ͨ�����ַ���"(����ע: ����������ΪC�е�"����ָ��", ��C++�е�"��������")
#+ ����"�����Լ��ĸ�ֵ���". 


CpArray_Mac() {

# ������ֵ����

    echo -n 'eval '
    echo -n "$2"                    # Ŀ�Ĳ�����
    echo -n '=( ${'
    echo -n "$1"                    # ԭ������
    echo -n '[@]} )'

# �ϱ���Щ���ṹ��һ������. 
# ���������ʽ�ϵ�����. 
}

declare -f CopyArray                # ����"ָ��"
CopyArray=CpArray_Mac               # �������

Hype()
{

# ��Ҫ���ӵ�������Ϊ$1. 
# (������������ַ���"Really Rocks"�������, �γ�һ��������.)
# �������������$2�з���. 

    local -a TMP
    local -a hype=( Really Rocks )

    $($CopyArray $1 TMP)
    TMP=( ${TMP[@]} ${hype[@]} )
    $($CopyArray TMP $2)
}

declare -a before=( Advanced Bash Scripting )
declare -a after

echo "Array Before = ${before[@]}"

Hype before after

echo "Array After = ${after[@]}"

# ���ӵ�̫����? 

echo "What ${after[@]:3:2}?"

declare -a modest=( ${after[@]:2:1} ${after[@]:3:2} )
#                    ----       �Ӵ���ȡ       ----

echo "Array Modest = ${modest[@]}"

# 'before'������ʲô�仯ô? 

echo "Array Before = ${before[@]}"

exit 0
