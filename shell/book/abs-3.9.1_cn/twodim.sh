#!/bin/bash
# twodim.sh: ģ��һ����ά����. 

# һά�����ɵ������. 
# ��ά�����������Ķ������. 

Rows=5
Columns=5
# 5 X 5 ������.

declare -a alpha     # char alpha [Rows] [Columns];
                     # û��Ҫ����. Ϊʲô?

load_alpha ()
{
local rc=0
local index

for i in A B C D E F G H I J K L M N O P Q R S T U V W X Y
do     # ��������������, ʹ���������. 
  local row=`expr $rc / $Columns`
  local column=`expr $rc % $Rows`
  let "index = $row * $Rows + $column"
  alpha[$index]=$i
# alpha[$row][$column]
  let "rc += 1"
done  

#  ���򵥵ķ���: 
#+   declare -a alpha=( A B C D E F G H I J K L M N O P Q R S T U V W X Y )
#+ �������д�Ļ�, ��ȱ����ά�����"��ζ"��. 
}

print_alpha ()
{
local row=0
local index

echo

while [ "$row" -lt "$Rows" ]   #  ��"����Ϊ��"���д�ӡ: 
do                             #+ �кŲ���(���ѭ��),
                               #+ �кŽ�������. (����ע: ���ǰ��д�ӡ)
  local column=0

  echo -n "       "            #  �����з����ӡ"������"����. 

  while [ "$column" -lt "$Columns" ]
  do
    let "index = $row * $Rows + $column"
    echo -n "${alpha[index]} "  # alpha[$row][$column]
    let "column += 1"
  done

  let "row += 1"
  echo

done  

# ���򵥵ĵȼ�д��Ϊ: 
#     echo ${alpha[*]} | xargs -n $Columns

echo
}

filter ()     # ���˵����������±�. 
{

echo -n "  "  # ������б. 
              # ����һ��, ������ô������. 

if [[ "$1" -ge 0 &&  "$1" -lt "$Rows" && "$2" -ge 0 && "$2" -lt "$Columns" ]]
then
    let "index = $1 * $Rows + $2"
    # ����, ������ת������д�ӡ. 
    echo -n " ${alpha[index]}"
    #           alpha[$row][$column]
fi    

}
  



rotate ()  #  ��������ת45�� --
{          #+ �����½ǽ���"ƽ��". 
local row
local column

for (( row = Rows; row > -Rows; row-- ))
  do       # ���򲽽�����, Ϊʲô? 

  for (( column = 0; column < Columns; column++ ))
  do

    if [ "$row" -ge 0 ]
    then
      let "t1 = $column - $row"
      let "t2 = $column"
    else
      let "t1 = $column"
      let "t2 = $column + $row"
    fi  

    filter $t1 $t2   # �����������±���˳���. 
                     # ����㲻����һ��, ��������? 
  done

  echo; echo

done 

#  ������ת�������Դ��Herbert Mayer������
#+ "Advanced C Programming on the IBM PC"������(��143-146ҳ)
#+ (�μ��ο���Ŀ). 
#  �ɴ˿ɼ�, C�����ܹ������ĺö�����, 
#+ ��shell�ű�һ���ܹ�����. 

}


#--------------- ����, �����ǿ�ʼ��. ------------#
load_alpha     # ��������. 
print_alpha    # ��ӡ����.   
rotate         # ��ʱ����ת45�ȴ�ӡ. 
#-----------------------------------------------------#

exit 0

# �����е�����, ������ô����. 

# ��ϰ:
# -----
# 1)  ����ʵ��������غʹ�ӡ����, 
#     �����ֱ��, �ɶ��Ը�ǿ. 
#
# 2)  ��ϸ��������ת������ԭ��. 
#     ��ʾ: ˼��һ�µ������������ʵ��. 
#
# 3)  ��д����ű�, ��չ��, �ò������ܹ�֧�ַ������ε�����. 
#     ����6 X 4������. 
#     ����һ��, ��������תʱ, ������С"ʧ��". 
