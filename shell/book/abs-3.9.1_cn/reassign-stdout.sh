#!/bin/bash
# reassign-stdout.sh

LOGFILE=logfile.txt

exec 6>&1           # ��fd #6��stdout��������. 
                    # ����stdout. 

exec > $LOGFILE     # stdout�ͱ��ļ�"logfile.txt"��������. 

# ----------------------------------------------------------- #
# ����������������������ᷢ�͵��ļ�$LOGFILE��. 

echo -n "Logfile: "
date
echo "-------------------------------------"
echo

echo "Output of \"ls -al\" command"
echo
ls -al
echo; echo
echo "Output of \"df\" command"
echo
df

# ----------------------------------------------------------- #

exec 1>&6 6>&-      # �ָ�stdout, Ȼ��ر��ļ�������#6. 

echo
echo "== stdout now restored to default == "
echo
ls -al
echo

exit 0
