#!/bin/bash
# isalpha.sh: ʹ��"case"�ṹ�������ַ���. 

SUCCESS=0
FAILURE=-1

isalpha ()  # �������� *��һ���ַ�* �ǲ�����ĸ���ϵ��ַ�.
{
if [ -z "$1" ]                # û�в���������?
then
  return $FAILURE
fi

case "$1" in
[a-zA-Z]*) return $SUCCESS;;  # ��һ����ĸ��ͷ?
*        ) return $FAILURE;;
esac
}             # ͬC���Ե�"isalpha ()"�����Ƚ�һ��. 


isalpha2 ()   # ���� *�����ַ���* �Ƿ�����ĸ���ϵ��ַ�.
{
  [ $# -eq 1 ] || return $FAILURE

  case $1 in
  *[!a-zA-Z]*|"") return $FAILURE;;
               *) return $SUCCESS;;
  esac
}

isdigit ()    # ���� *�����ַ���* �Ƿ�������.
{             # ���仰˵, ���ǲ���һ���Ƿ�����������.
  [ $# -eq 1 ] || return $FAILURE

  case $1 in
  *[!0-9]*|"") return $FAILURE;;
            *) return $SUCCESS;;
  esac
}



check_var ()  # ����isalpha().
{
if isalpha "$@"
then
  echo "\"$*\" begins with an alpha character."
  if isalpha2 "$@"
  then        # ����Ҫ���Ե�һ���ַ��Ƿ���non-alpha.
    echo "\"$*\" contains only alpha characters."
  else
    echo "\"$*\" contains at least one non-alpha character."
  fi  
else
  echo "\"$*\" begins with a non-alpha character."
              # ���û�в������ݽ���, Ҳ��"non-alpha". 
fi

echo

}

digit_check ()  # ����isdigit().
{
if isdigit "$@"
then
  echo "\"$*\" contains only digits [0 - 9]."
else
  echo "\"$*\" has at least one non-digit character."
fi

echo

}

a=23skidoo
b=H3llo
c=-What?
d=What?
e=`echo $b`   # �����滻.
f=AbcDef
g=27234
h=27a34
i=27.34

check_var $a
check_var $b
check_var $c
check_var $d
check_var $e
check_var $f
check_var     # û�в������ݽ���, ���ᷢ��ʲô?
#
digit_check $g
digit_check $h
digit_check $i


exit 0        # S.C�Ľ�������ű�.

# ��ϰ:
# -----
#  ��дһ��'isfloat ()'���������Ը�����.
#  ��ʾ: ���������������'isdigit ()'��ͬ,
#+ ����Ҫ���һЩС���㲿�ֵĴ���.
