#!/bin/bash
# match-string.sh: �򵥵��ַ���ƥ��

match_string ()
{
  MATCH=0
  NOMATCH=90
  PARAMS=2     # �˺�����Ҫ2������.
  BAD_PARAMS=91

  [ $# -eq $PARAMS ] || return $BAD_PARAMS

  case "$1" in
  "$2") return $MATCH;;
  *   ) return $NOMATCH;;
  esac

}  


a=one
b=two
c=three
d=two


match_string $a     # ������������.
echo $?             # 91

match_string $a $b  # ��ƥ��
echo $?             # 90

match_string $b $d  # ƥ��
echo $?             # 0


exit 0		    
