#!/bin/bash
# upperconv.sh
# ��һ��ָ���������ļ�ת��Ϊ��д. 

E_FILE_ACCESS=70
E_WRONG_ARGS=71

if [ ! -r "$1" ]     # �ж�ָ���������ļ��Ƿ�ɶ�? 
then
  echo "Can't read from input file!"
  echo "Usage: $0 input-file output-file"
  exit $E_FILE_ACCESS
fi                   #  ��ʹ�����ļ�($1)û��ָ��
                     #+ Ҳ���ǻ�����ͬ�Ĵ����˳�(Ϊʲô?). 

if [ -z "$2" ]
then
  echo "Need to specify output file."
  echo "Usage: $0 input-file output-file"
  exit $E_WRONG_ARGS
fi


exec 4<&0
exec < $1            # ����������ļ��ж�ȡ. 

exec 7>&1
exec > $2            # ��д������ļ���. 
                     # ��������ļ��ǿ�д��(��Ӽ��?). 

# -----------------------------------------------
    cat - | tr a-z A-Z   # ת��Ϊ��д. 
#   ^^^^^                # ��stdin�ж�ȡ. 
#           ^^^^^^^^^^   # д��stdout��. 
# Ȼ��, stdin��stdout�����ض�����. 
# -----------------------------------------------

exec 1>&7 7>&-       # �ָ�stout.
exec 0<&4 4<&-       # �ָ�stdin.

# �ָ�֮��, �±����д��뽫����Ԥ�ڵ�һ����ӡ��stdout��. 
echo "File \"$1\" written to \"$2\" as uppercase conversion."

exit 0
