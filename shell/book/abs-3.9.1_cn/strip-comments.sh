#!/bin/bash
# strip-comment.sh: ȥ��C�����е�ע��(/* ע�� */). 

E_NOARGS=0
E_ARGERROR=66
E_WRONG_FILE_TYPE=67

if [ $# -eq "$E_NOARGS" ]
then
  echo "Usage: `basename $0` C-program-file" >&2 # ��������Ϣ����stderr.
  exit $E_ARGERROR
fi  

# ����ļ������Ƿ���ȷ. 
type=`file $1 | awk '{ print $2, $3, $4, $5 }'`
# "file $1" echo���ļ����� . . .
# Ȼ��awk��ɾ����һ����, �����ļ��� . . .
# Ȼ�������ᴫ�ݵ�����"type"��.
correct_type="ASCII C program text"

if [ "$type" != "$correct_type" ]
then
  echo
  echo "This script works on C program files only."
  echo
  exit $E_WRONG_FILE_TYPE
fi  


# �൱���ص�sed�ű�:
#--------
sed '
/^\/\*/d
/.*\*\//d
' $1
#--------
# ����㻨�ϼ���Сʱ��ѧϰsed�﷨�Ļ�, �ϱ��������Ǻܺ�����.
                                                                     
                                                                     
#  ���ע�ͺʹ�����ͬһ����, �ϱߵĽű��Ͳ�����.
#+ ������Ҫ���һЩ�����������������.
#  ����һ������Ҫ����ϰ.
                                                                     
#  ��Ȼ, �ϱߵĴ���Ҳ��ɾ������"*/"�ķ�ע���� --
#+ ��Ҳ����һ����������Ľ��.

exit 0


# ----------------------------------------------------------------
# �±ߵĴ��벻��ִ��, ��Ϊ�ϱ��Ѿ�'exit 0'��.
                                                
# Stephane Chazelas����ʹ���±ߵķ���:

usage() {
  echo "Usage: `basename $0` C-program-file" >&2
  exit 1
}

WEIRD=`echo -n -e '\377'`   # ����WEIRD=$'\377'
[[ $# -eq 1 ]] || usage
case `file "$1"` in
  *"C program text"*) sed -e "s%/\*%${WEIRD}%g;s%\*/%${WEIRD}%g" "$1" \
     | tr '\377\n' '\n\377' \
     | sed -ne 'p;n' \
     | tr -d '\n' | tr '\377' '\n';;
  *) usage;;
esac

#  ��������е���Щ���, ���Ǻ����:
#  printf("/*");
#  ����
#  /*  /* buggy embedded comment */
#                                                                
#  Ϊ�˴����ϱ�������Щ�������(�ַ����е�ע��, ���� \", \\" ...
#+ ���ַ����е�ע��)Ψһ�ķ�������дһ��C������
#+ (�������ʹ��lex����yacc?).

exit 0
