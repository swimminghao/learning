#!/bin/bash
# horserace.sh: һ���ǳ��򵥵�ģ���������Ϸ. 
# ����: Stefano Palmeri
# ������Ȩ�����ڱ�����ʹ��. 

################################################################
#  �ű�Ŀ��: 
#  ʹ��ת�����к��ն���ɫ������Ϸ. 
#
#  ��ϰ: 
#  �༭�ű�, ʹ�������������������, 
#+ ����һ���ٵĶĳ� . . .     
#  �� . . . �� . . . ���ֿ�������������һ����Ӱ . . .
#
#  �ű������ÿƥ�����һ������ϰ�. 
#  ��������ϰ������㼸��, 
#+ ����ʹ��һ��ŷ��(?)�ķ�������. 
#  ����: ����(odds)=3.75�Ļ�, �Ǿ���ζ�������Ѻ$1,
#+ ��ͻ�Ӯ��$3.75.
# 
#  �˽ű��Ѿ���GNU/Linux����ϵͳ�ϲ��Թ�, 
#+ �����ն���xterm, rxvt, ��konsole. 
#  ���Ի����ϰ�װ����AMD 900 MHz������, 
#+ ƽ������ʱ��Ϊ75��.    
#  ���ʹ�ø���Ļ���, ��ô������ʱ�����. 
#  ����, ����������ӱ���������, �������ñ���USLEEP_ARG. 
#
#  ���ű���Stefano Palmeri��д. 
################################################################

E_RUNERR=65

# ���һ��md5sum��bc�Ƿ��Ѿ�����װ. 
if ! which bc &> /dev/null; then
   echo bc is not installed.  
   echo "Can\'t run . . . "
   exit $E_RUNERR
fi
if ! which md5sum &> /dev/null; then
   echo md5sum is not installed.  
   echo "Can\'t run . . . "
   exit $E_RUNERR
fi

#  ��������ı������ή�ͽű��������ٶ�. 
#  ������Ϊ����, ���ݸ�usleep����(man usleep),   
#+ ���ҵ�λ��΢��(500000΢�� = ����).
USLEEP_ARG=0  

#  ����ű���Ctl-C�ж�, �Ǿ������ʱĿ¼, 
#+ �ָ��ն˹����ն���ɫ. 
trap 'echo -en "\E[?25h"; echo -en "\E[0m"; stty echo;\
tput cup 20 0; rm -fr  $HORSE_RACE_TMP_DIR'  TERM EXIT
#  ��ο��������ص��½�, ���Ի��'trap'�������ϸ�÷�. 

# Ϊ�ű�����һ��Ψһ��(ʵ���ϲ��Ǿ���Ψһ)��ʱĿ¼��. 
HORSE_RACE_TMP_DIR=$HOME/.horserace-`date +%s`-`head -c10 /dev/urandom | md5sum | head -c30`

# ������ʱĿ¼, ���ƶ�����Ŀ¼��. 
mkdir $HORSE_RACE_TMP_DIR
cd $HORSE_RACE_TMP_DIR


#  �����������ѹ���ƶ�����Ϊ$1, ��Ϊ$2��λ����, Ȼ���ӡ$3. 
#  ����: "move_and_echo 5 10 linux"�ȼ���"tput cup 4 9; echo linux", 
#+ ����ʹ��һ�������������������. 
#  ע��: "tput cup"����0 0λ��, Ϊ�ն����Ͻ�, 
#+ ��echo����1 1λ��, Ϊ�ն����Ͻ�. 
move_and_echo() {
          echo -ne "\E[${1};${2}H""$3" 
}

# �˺�����������1-9֮���α�����. 
random_1_9 () {
                head -c10 /dev/urandom | md5sum | tr -d [a-z] | tr -d 0 | cut -c1 
}

#  �ڻ����ʱ��, ��������������ģ��"�ƶ�". 
draw_horse_one() {
               echo -n " "//$MOVE_HORSE//
}
draw_horse_two(){
              echo -n " "\\\\$MOVE_HORSE\\\\ 
}   


# ���嵱ǰ�ն˳ߴ�. 
N_COLS=`tput cols`
N_LINES=`tput lines`

# ������Ҫһ��20(��) X 80(��)���ն�. ���һ��. 
if [ $N_COLS -lt 80 ] || [ $N_LINES -lt 20 ]; then
   echo "`basename $0` needs a 80-cols X 20-lines terminal."
   echo "Your terminal is ${N_COLS}-cols X ${N_LINES}-lines."
   exit $E_RUNERR
fi


# ��ʼ������. 

# ��Ҫһ��80�ַ����ַ���. ������. 
BLANK80=`seq -s "" 100 | head -c80`

clear

# ��ǰ��ɫ�뱳��ɫ��Ϊ��. 
echo -ne '\E[37;47m'

# ������ƶ����ն˵����Ͻ�. 
tput cup 0 0 

# ��6������. 
for n in `seq 5`; do
      echo $BLANK80        # �����80�ַ����ַ������ն˱�Ϊ��ɫ��. 
done

# ��ǰ��ɫ��Ϊ��ɫ. 
echo -ne '\E[30m'

move_and_echo 3 1 "START  1"            
move_and_echo 3 75 FINISH
move_and_echo 1 5 "|"
move_and_echo 1 80 "|"
move_and_echo 2 5 "|"
move_and_echo 2 80 "|"
move_and_echo 4 5 "|  2"
move_and_echo 4 80 "|"
move_and_echo 5 5 "V  3"
move_and_echo 5 80 "V"

# ��ǰ��ɫ����Ϊ��ɫ. 
echo -ne '\E[31m'

# һЩASCII������Ч��. 
move_and_echo 1 8 "..@@@..@@@@@...@@@@@.@...@..@@@@..."
move_and_echo 2 8 ".@...@...@.......@...@...@.@......."
move_and_echo 3 8 ".@@@@@...@.......@...@@@@@.@@@@...."
move_and_echo 4 8 ".@...@...@.......@...@...@.@......."
move_and_echo 5 8 ".@...@...@.......@...@...@..@@@@..."
move_and_echo 1 43 "@@@@...@@@...@@@@..@@@@..@@@@."
move_and_echo 2 43 "@...@.@...@.@.....@.....@....."
move_and_echo 3 43 "@@@@..@@@@@.@.....@@@@...@@@.."
move_and_echo 4 43 "@..@..@...@.@.....@.........@."
move_and_echo 5 43 "@...@.@...@..@@@@..@@@@.@@@@.."


# ��ǰ��ɫ�ͱ���ɫ��Ϊ��ɫ. 
echo -ne '\E[32;42m'

# ��11������. 
tput cup 5 0
for n in `seq 11`; do
      echo $BLANK80
done

# ��ǰ��ɫ��Ϊ��ɫ. 
echo -ne '\E[30m'
tput cup 5 0

# ��դ��. 
echo "++++++++++++++++++++++++++++++++++++++\
++++++++++++++++++++++++++++++++++++++++++"

tput cup 15 0
echo "++++++++++++++++++++++++++++++++++++++\
++++++++++++++++++++++++++++++++++++++++++"

# ��ǰ��ɫ�ͱ���ɫ��ذ�ɫ. 
echo -ne '\E[37;47m'

# ��3������. 
for n in `seq 3`; do
      echo $BLANK80
done

# ��ǰ��ɫ��Ϊ��ɫ. 
echo -ne '\E[30m'

# ����9���ļ�, ���������ϰ���. 
for n in `seq 10 7 68`; do
      touch $n
done  

# ���ű���Ҫ����"��"����Ϊ��һ������. 
HORSE_TYPE=2

#  Ϊÿƥ"��"����λ���ļ��ͼ����ļ�. 
#+ ����Щ�ļ���, ������ĵ�ǰλ��, 
#+ ���ͺͼ���. 
for HN in `seq 9`; do
      touch horse_${HN}_position
      touch odds_${HN}
      echo \-1 > horse_${HN}_position
      echo $HORSE_TYPE >>  horse_${HN}_position
      # ����������ϰ���. 
       HANDICAP=`random_1_9`
      # ��麯��random_1_9�Ƿ񷵻�һ����Чֵ. 
      while ! echo $HANDICAP | grep [1-9] &> /dev/null; do
                HANDICAP=`random_1_9`
      done
      # ���������һ���ϰ����λ��. 
      LHP=`expr $HANDICAP \* 7 + 3`
      for FILE in `seq 10 7 $LHP`; do
            echo $HN >> $FILE
      done   
     
      # ���㼸��. 
      case $HANDICAP in 
              1) ODDS=`echo $HANDICAP \* 0.25 + 1.25 | bc`
                                 echo $ODDS > odds_${HN}
              ;;
              2 | 3) ODDS=`echo $HANDICAP \* 0.40 + 1.25 | bc`
                                       echo $ODDS > odds_${HN}
              ;;
              4 | 5 | 6) ODDS=`echo $HANDICAP \* 0.55 + 1.25 | bc`
                                             echo $ODDS > odds_${HN}
              ;; 
              7 | 8) ODDS=`echo $HANDICAP \* 0.75 + 1.25 | bc`
                                       echo $ODDS > odds_${HN}
              ;; 
              9) ODDS=`echo $HANDICAP \* 0.90 + 1.25 | bc`
                                  echo $ODDS > odds_${HN}
      esac


done


# ��ӡ����. 
print_odds() {
tput cup 6 0
echo -ne '\E[30;42m'
for HN in `seq 9`; do
      echo "#$HN odds->" `cat odds_${HN}`
done
}

# ���������ϰ�������. 
draw_horses() {
tput cup 6 0
echo -ne '\E[30;42m'
for HN in `seq 9`; do
      echo /\\$HN/\\"                               "
done
}

print_odds

echo -ne '\E[47m'
# �ȴ����»س���, ����֮��Ϳ�ʼ����. 
# ת������'\E[?25l'���ù��. 
tput cup 17 0
echo -e '\E[?25l'Press [enter] key to start the race...
read -s

#  �������ն˵ĳ���echo����. 
#  ��ô�����������ڱ�����, 
#+ ���������µ�"��"��. 
stty -echo

# --------------------------------------------------------
# ��ʼ����. 

draw_horses
echo -ne '\E[37;47m'
move_and_echo 18 1 $BLANK80
echo -ne '\E[30m'
move_and_echo 18 1 Starting...
sleep 1

# �����յ��ߵ��к�. 
WINNING_POS=74

# ���������ʼ��ʱ��. 
START_TIME=`date +%s`

# �����"while"�ṹ��Ҫʹ��COL����. 
COL=0    

while [ $COL -lt $WINNING_POS ]; do
                   
          MOVE_HORSE=0     
          
          # ���random_1_9�����Ƿ񷵻�����Чֵ. 
          while ! echo $MOVE_HORSE | grep [1-9] &> /dev/null; do
                MOVE_HORSE=`random_1_9`
          done
          
          # ����"�����ȡ����"��ԭ�����ͺ�λ��. 
          HORSE_TYPE=`cat  horse_${MOVE_HORSE}_position | tail -1`
          COL=$(expr `cat  horse_${MOVE_HORSE}_position | head -1`) 
          
          ADD_POS=1
          # �жϵ�ǰλ���Ƿ�����ϰ���. 
          if seq 10 7 68 | grep -w $COL &> /dev/null; then
                if grep -w $MOVE_HORSE $COL &> /dev/null; then
                      ADD_POS=0
                      grep -v -w  $MOVE_HORSE $COL > ${COL}_new
                      rm -f $COL
                      mv -f ${COL}_new $COL
                      else ADD_POS=1
                fi 
          else ADD_POS=1
          fi
          COL=`expr $COL + $ADD_POS`
          echo $COL >  horse_${MOVE_HORSE}_position  # ������λ��. 
                            
         # ѡ��Ҫ���������������. 
          case $HORSE_TYPE in 
                1) HORSE_TYPE=2; DRAW_HORSE=draw_horse_two
                ;;
                2) HORSE_TYPE=1; DRAW_HORSE=draw_horse_one 
          esac       
          echo $HORSE_TYPE >>  horse_${MOVE_HORSE}_position # ���浱ǰ����. 
         
          # ��ǰ��ɫ��Ϊ��, ����ɫ��Ϊ��. 
          echo -ne '\E[30;42m'
          
          # ������ƶ��������λ��. 
          tput cup `expr $MOVE_HORSE + 5`  `cat  horse_${MOVE_HORSE}_position | head -1` 
          
          # ����. 
          $DRAW_HORSE
           usleep $USLEEP_ARG
          
           # �����е���Խ����15��֮��, �ٴδ�ӡ����. 
           touch fieldline15
           if [ $COL = 15 ]; then
             echo $MOVE_HORSE >> fieldline15  
           fi
           if [ `wc -l fieldline15 | cut -f1 -d " "` = 9 ]; then
               print_odds
               : > fieldline15
           fi           
          
          # ȡ����ͷ����. 
          HIGHEST_POS=`cat *position | sort -n | tail -1`          
          
          # ������ɫ��Ϊ��. 
          echo -ne '\E[47m'
          tput cup 17 0
          echo -n Current leader: `grep -w $HIGHEST_POS *position | cut -c7`"                              "           

done  

# �������������ʱ��. 
FINISH_TIME=`date +%s`

# ������ɫ����Ϊ��ɫ, ���ҿ�����˸�ı��Ĺ���. 
echo -ne '\E[30;42m'
echo -en '\E[5m'

# �û�ʤ������˸. 
tput cup `expr $MOVE_HORSE + 5` `cat  horse_${MOVE_HORSE}_position | head -1`
$DRAW_HORSE

# ������˸�ı�. 
echo -en '\E[25m'

# ��ǰ��ɫ�ͱ���ɫ����Ϊ��ɫ. 
echo -ne '\E[37;47m'
move_and_echo 18 1 $BLANK80

# ��ǰ��ɫ����Ϊ��ɫ. 
echo -ne '\E[30m'

# �û�ʤ������˸. 
tput cup 17 0
echo -e "\E[5mWINNER: $MOVE_HORSE\E[25m""  Odds: `cat odds_${MOVE_HORSE}`"\
"  Race time: `expr $FINISH_TIME - $START_TIME` secs"

# �ָ����, �ָ�ԭ������ɫ. 
echo -en "\E[?25h"
echo -en "\E[0m"

# �ָ���ӡ����. 
stty echo

# ɾ�����������йص���ʱ�ļ�. 
rm -rf $HORSE_RACE_TMP_DIR

tput cup 19 0

exit 0
