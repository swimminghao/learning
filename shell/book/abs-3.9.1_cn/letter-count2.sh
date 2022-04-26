#! /bin/sh
# letter-count2.sh: ���ı��ļ��м����ַ��ĳ��ִ���. 
#
# ��nyal [nyal@voila.fr]��д.
# ��Ȩʹ��. 
# ������������ע��. 
# �汾 1.1: �����޸Ŀ�����gawk 3.1.3.
#              (Ҳ������awk�����ڰ汾.)


INIT_TAB_AWK=""
# ��ʼ��awk�ű��Ĳ���. 
count_case=0
FILE_PARSE=$1

E_PARAMERR=65

usage()
{
    echo "Usage: letter-count.sh file letters" 2>&1
    # ����:   ./letter-count2.sh filename.txt a b c
    exit $E_PARAMERR  # ���ݵ��ű��Ĳ�����������. 
}

if [ ! -f "$1" ] ; then
    echo "$1: No such file." 2>&1
    usage                 # ��ӡʹ����Ϣ���˳�. 
fi 

if [ -z "$2" ] ; then
    echo "$2: No letters specified." 2>&1
    usage
fi 

shift                      # ָ�����ַ�. 
for letter in `echo $@`    # forѭ������ . . .
  do
  INIT_TAB_AWK="$INIT_TAB_AWK tab_search[${count_case}] = \"$letter\"; final_tab[${count_case}] = 0; " 
  # ��Ϊ�������ݵ��±ߵ�awk�ű���. 
  count_case=`expr $count_case + 1`
done

# ����:
# echo $INIT_TAB_AWK;

cat $FILE_PARSE |
# ��Ŀ���ļ�ͨ���ܵ������±ߵ�awk�ű���. 

# ----------------------------------------------------------------------------------
# �±��Ǳ��ű������ڰ汾ʹ�õķ���: 
# awk -v tab_search=0 -v final_tab=0 -v tab=0 -v nb_letter=0 -v chara=0 -v chara2=0 \

awk \
"BEGIN { $INIT_TAB_AWK } \
{ split(\$0, tab, \"\"); \
for (chara in tab) \
{ for (chara2 in tab_search) \
{ if (tab_search[chara2] == tab[chara]) { final_tab[chara2]++ } } } } \
END { for (chara in final_tab) \
{ print tab_search[chara] \" => \" final_tab[chara] } }"
# ----------------------------------------------------------------------------------
#  �������еĶ���ô����, ֻ�� . . . 
#+ forѭ��, if�����ж�, �ͼ���ָ����������. 

exit $?

# ��ű�letter-count.sh��Ƚ�.
