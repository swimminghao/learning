#!/bin/bash
# dict-lookup.sh

#  ����ű���1913���Τ�ϴʵ��в��Ҷ���.
#  �Ȿ�����ʵ����ͨ����ͬ��
#+ վ��������,����
#+ Project Gutenberg (http://www.gutenberg.org/etext/247).
#                                                                  
#  ��ʹ�ñ��ű�֮ǰ,
#+ ��Ҫ���Ȿ�ֵ���DOS��ʽת��ΪUNIX��ʽ(ֻ��LF��Ϊ�н�����).
#  ������ļ��洢Ϊ���ı���ʽ, ���ұ�֤��δѹ����ASCII��ʽ.
#  ��DEFAULT_DICTFILE������path/filename��ʽ���ú�.


E_BADARGS=65
MAXCONTEXTLINES=50                        # ��ʾ���������. 
DEFAULT_DICTFILE="/usr/share/dict/webster1913-dict.txt"
                                          # Ĭ�ϵ�·�����ļ���.
                                          # �ڱ�Ҫ��ʱ����Խ����޸�.
#  ע��:
#  -----
#  ����ض���1913����Τ�ϴʵ�
#+ ��ÿ����ڶ����Դ�д��ĸ��ͷ��
#+ (ʣ����ַ�����Сд).
#  ֻ��ÿ���ֵĵ�һ������������ʽ��ʼ��,
#+ ��Ҳ����Ϊʲô�����㷨���±ߵ��������.



if [[ -z $(echo "$1" | sed -n '/^[A-Z]/p') ]]
#  ����ָ��һ��Ҫ���ҵĵ���,
#+ ����������ʱ����Դ�д��ĸ��ͷ.
then
  echo "Usage: `basename $0` Word-to-define [dictionary-file]"
  echo
  echo "Note: Word to look up must start with capital letter,"
  echo "with the rest of the word in lowercase."
  echo "--------------------------------------------"
  echo "Examples: Abandon, Dictionary, Marking, etc."
  exit $E_BADARGS
fi


if [ -z "$2" ]                            #  Ҳ����ָ����ͬ�Ĵʵ�
                                          #+ ��Ϊ����ű��ĵ�2���������ݽ���.
then
  dictfile=$DEFAULT_DICTFILE
else
  dictfile="$2"
fi

# ---------------------------------------------------------
Definition=$(fgrep -A $MAXCONTEXTLINES "$1 \\" "$dictfile")
#                                   �� "Word \..." ������ʽ����
#                                                               
#  ��Ȼ, ��ʹ����һ���ر����ı��ļ���ʱ��
#+ "fgrep"Ҳ���㹻���.


# ����, ���������.

echo "$Definition" |
sed -n '1,/^[A-Z]/p' |
#  ������ĵ�һ��
#+ ��ӡ����һ���ֵĵ�һ��.
sed '$d' | sed '$d'
#  ɾ��������������
#+ (���к���һ���ֵĵ�һ��).
# ---------------------------------------------------------

exit 0

# ��ϰ:
# -----
# 1)  �޸�����ű�, �����߱��ܹ������κ��ַ���ʽ������
#   + (��д, Сд, ���Сд���), Ȼ����ת��Ϊ
#   + �ܹ������ͳһ��ʽ.
#                                                       
# 2)  ������ű�ת��Ϊһ��GUIӦ��,
#   + ʹ��һЩ������"gdialog"�Ķ��� .  .  .
#     �����Ļ�, �ű������ٴ���������
#   + ȡ����Щ����.
#                                                       
# 3)  �޸�����ű������߱��ܹ���������һ��
#   + �����ʵ������, ���� U.S. Census Bureau Gazetteer.
