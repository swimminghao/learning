#!/bin/bash
# dialog.sh: ʹ��'gdialog'���ڲ���. 
# ���������ϵͳ�ϰ�װ'gdialog'������������ű�. 
# �汾1.1 (04/05/05�������)

# ����ű��������Դ�����������. 
#     "Scripting for X Productivity," by Marco Fioretti,
#      LINUX JOURNAL, Issue 113, September 2003, pp. 86-9.
# ��л����, ���е�LINUX JOURNAL����. 


# �ڶԻ��򴰿��е��������. 
E_INPUT=65
# ���봰�ڵ���ʾ�ߴ�. 
HEIGHT=50
WIDTH=60

# ����ļ���(�ɽű�������). 
OUTFILE=$0.output

# ���ű���������ʾ���ı�������. 
gdialog --title "Displaying: $0" --textbox $0 $HEIGHT $WIDTH



# ����, ���ǽ����뱣�浽�ļ���. 
echo -n "VARIABLE=" > $OUTFILE
gdialog --title "User Input" --inputbox "Enter variable, please:" \
$HEIGHT $WIDTH 2>> $OUTFILE


if [ "$?" -eq 0 ]
# ����˳�״̬��, ��һ����ϰ��. 
then
  echo "Executed \"dialog box\" without errors."
else
  echo "Error(s) in \"dialog box\" execution."
        # ����, ��"Cancel"��ť, ������"OK". 
  rm $OUTFILE
  exit $E_INPUT
fi



# ����, ���ǽ����»�ò���ʾ����ı���. 
. $OUTFILE   # 'Source'(ִ��)������ļ�. 
echo "The variable input in the \"input box\" was: "$VARIABLE""


rm $OUTFILE  # �����ʱ�ļ�. 
             # ĳЩӦ�ÿ�����Ҫ��������ļ�. 

exit $?
