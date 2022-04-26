#!/bin/bash
# Draw-box.sh: ʹ��ASCII�ַ���һ������. 

# ��Stefano Palmeri��д, �����������������޸�. 
# ������Ȩ, �����ڱ�����ʹ��. 


######################################################################
###  draw_box����ע��  ###

#  "draw_box"�����������û�
#+ ���ն��ϻ�һ������. 
#
#  �÷�: draw_box ROW COLUMN HEIGHT WIDTH [COLOR] 
#  ROW��COLUMN������λ����Ҫ
#+ ���ĺ��ӵ����Ͻ�. 
#  ROW��COLUMN�������0, 
#+ ����ҪС�ڵ�ǰ�ն˵ĳߴ�. 
#  HEIGHT�Ǻ��ӵ�����, ���ұ��� >0 . 
#  HEIGHT + ROW ���� <= �ն˵ĸ߶�. 
#  WIDTH�Ǻ��ӵ�����, ���� >0 .
#  WIDTH + COLUMN ���� <= �ն˵Ŀ��. 
#
# ����: �������ն˳ߴ�Ϊ20x80, 
#  draw_box 2 3 10 45 �ǺϷ���
#  draw_box 2 3 19 45 ��HEIGHT�Ǵ�� (19+2 > 20)
#  draw_box 2 3 18 78 ��WIDTH�Ǵ�� (78+3 > 80)
#
#  COLOR�Ǻ��ӱ߿����ɫ. 
#  ���ǵ�5������, �����ǿ�ѡ��. 
#  0=�� 1=�� 2=�� 3=�غ� 4=�� 5=�� 6=�� 7=��.
#  ����㴫�ݸ������Ĳ�������, 
#+ �������˳�, ������65, 
#+ ��������Ϣ��ӡ��stderr��. 
#
#  ��ʼ������֮ǰ, ������. 
#  �����ڲ�������������. 
#  �����������û����������, �������Ե��Ӷ������. 

###  draw_box����ע�ͽ���  ### 
######################################################################

draw_box(){

#=============#
HORZ="-"
VERT="|"
CORNER_CHAR="+"

MINARGS=4
E_BADARGS=65
#=============#


if [ $# -lt "$MINARGS" ]; then                 # �������С��4, �˳�. 
    exit $E_BADARGS
fi

# �ҳ������з����ֵ��ַ�. 
# �����������õķ���ô(����������Ϊ��ϰ?). 
if echo $@ | tr -d [:blank:] | tr -d [:digit:] | grep . &> /dev/null; then
   exit $E_BADARGS
fi

BOX_HEIGHT=`expr $3 - 1`   #  ����-1, ��Ϊ�߽ǵ�"+"��
BOX_WIDTH=`expr $4 - 1`    #+ �ߺͿ��еĲ���. 
T_ROWS=`tput lines`        #  ���嵱ǰ�ն˵�
T_COLS=`tput cols`         #+ ���Ϳ�ĳߴ�. 
         
if [ $1 -lt 1 ] || [ $1 -gt $T_ROWS ]; then    #  ��ʼ������
   exit $E_BADARGS                             #+ �Ƿ���ȷ. 
fi
if [ $2 -lt 1 ] || [ $2 -gt $T_COLS ]; then
   exit $E_BADARGS
fi
if [ `expr $1 + $BOX_HEIGHT + 1` -gt $T_ROWS ]; then
   exit $E_BADARGS
fi
if [ `expr $2 + $BOX_WIDTH + 1` -gt $T_COLS ]; then
   exit $E_BADARGS
fi
if [ $3 -lt 1 ] || [ $4 -lt 1 ]; then
   exit $E_BADARGS
fi                                 # ����������. 

plot_char(){                       # �����ڵĺ���. 
   echo -e "\E[${1};${2}H"$3
}

echo -ne "\E[3${5}m"               # ���������, �����ú��ӱ߿����ɫ. 

# ��ʼ������

count=1                                         #  ʹ��plot_char����
for (( r=$1; count<=$BOX_HEIGHT; r++)); do      #+ ����ֱ��. 
  plot_char $r $2 $VERT
  let count=count+1
done 

count=1
c=`expr $2 + $BOX_WIDTH`
for (( r=$1; count<=$BOX_HEIGHT; r++)); do
  plot_char $r $c $VERT
  let count=count+1
done 

count=1                                        #  ʹ��plot_char����
for (( c=$2; count<=$BOX_WIDTH; c++)); do      #+ ��ˮƽ��. 
  plot_char $1 $c $HORZ
  let count=count+1
done 

count=1
r=`expr $1 + $BOX_HEIGHT`
for (( c=$2; count<=$BOX_WIDTH; c++)); do
  plot_char $r $c $HORZ
  let count=count+1
done 

plot_char $1 $2 $CORNER_CHAR                   # �����ӵĽ�. 
plot_char $1 `expr $2 + $BOX_WIDTH` +
plot_char `expr $1 + $BOX_HEIGHT` $2 +
plot_char `expr $1 + $BOX_HEIGHT` `expr $2 + $BOX_WIDTH` +

echo -ne "\E[0m"             #  �ָ�ԭ������ɫ. 

P_ROWS=`expr $T_ROWS - 1`    #  ���ն˵ĵײ���ӡ��ʾ��. 

echo -e "\E[${P_ROWS};1H"
}      


# ����, �����ǿ�ʼ�����Ӱ�. 
clear                       # ����. 
R=2      # ��
C=3      # ��
H=10     # ��
W=45     # ��
col=1    # ��ɫ(��)
draw_box $R $C $H $W $col   # ������. 

exit 0

# ��ϰ:
# -----
# ���һ��ѡ��, ����֧�ֿ����������ĺ����д�ӡ�ı�. 
