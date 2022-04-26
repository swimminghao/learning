#!/bin/bash
# parent.sh
# �ڶദ����(SMP box)�Ļ��������ж����. 
# ����: Tedman Eng

#  ��������Ҫ���������ű�, ���ǵ�һ��, 
#+ �������ű���Ҫ�ŵ���ǰ����Ŀ¼��. 




LIMIT=$1         # ��Ҫ�����Ľ�������
NUMPROC=4        # �������߳�����(forks?)
PROCID=1         # �����Ľ���ID
echo "My PID is $$"

function start_thread() {
        if [ $PROCID -le $LIMIT ] ; then
                ./child.sh $PROCID&
                let "PROCID++"
        else
           echo "Limit reached."
           wait
           exit
        fi
}

while [ "$NUMPROC" -gt 0 ]; do
        start_thread;
        let "NUMPROC--"
done


while true
do

trap "start_thread" SIGRTMIN

done

exit 0



# ======== �����ǵڶ����ű� ========


#!/bin/bash
# child.sh
# ��SMP box�����ж����. 
# ����ű��ᱻparent.sh����. 
# ����: Tedman Eng

temp=$RANDOM
index=$1
shift
let "temp %= 5"
let "temp += 4"
echo "Starting $index  Time:$temp" "$@"
sleep ${temp}
echo "Ending $index"
kill -s SIGRTMIN $PPID

exit 0


# ======================= �ű�����ע ======================= #
#  ����ű�������һ��bug��û��. 
#  ��ʹ��limit = 500����������ű�, �����ڹ��˿�ͷ��һ���ٸ�ѭ����, 
#+ ��Щ�����߳���ʧ��! 
#  ������ȷ�����Ƿ����ɲ�׽�źŵĳ�ͻ�����, ����������ʲôԭ��. 
#  һ�����յ���׽���ź�, ��ô����һ�β�׽����֮ǰ, 
#+ ����һ�ζ��ݵ�ʱ����ִ���źŴ������, 
#+ ���źŴ��������Ĺ�����, ���п��ܻᶪʧһ����Ҫ��׽���ź�, ���ʧȥһ�������ӽ��̵Ļ���. 

#  �������ʵ�, �϶������ܹ��ҳ��������bug��ԭ��, 
#+ �����ڽ�����ĳ��ʱ��. . . ������.



# ===================================================================== #



# ----------------------------------------------------------------------#



#################################################################
# ����Ľű�����Vernia Damianoԭ��. 
# ���ҵ���, ����������������. 
#################################################################

#!/bin/bash

#  Ҫ���������ű�, ������Ҫһ�����β���
#+ (�����Ľ�����). 
#  ���е��������������ݸ�Ҫ�����Ľ���. 


INDICE=8        # ��Ҫ�����Ľ�����Ŀ
TEMPO=5         # ÿ����������˯��ʱ��
E_BADARGS=65    # ���û�в��������ű���, ��ô�ͷ������������. 

if [ $# -eq 0 ] # ���һ��, ����Ҫ����һ���������ű�. 
then
  echo "Usage: `basename $0` number_of_processes [passed params]"
  exit $E_BADARGS
fi

NUMPROC=$1              # ����������
shift
PARAMETRI=( "$@" )      # ÿ�����̵Ĳ���

function avvia() {
         local temp
         local index
         temp=$RANDOM
         index=$1
         shift
         let "temp %= $TEMPO"
         let "temp += 1"
         echo "Starting $index Time:$temp" "$@"
         sleep ${temp}
         echo "Ending $index"
         kill -s SIGRTMIN $$
}

function parti() {
         if [ $INDICE -gt 0 ] ; then
              avvia $INDICE "${PARAMETRI[@]}" &
                let "INDICE--"
         else
                trap : SIGRTMIN
         fi
}

trap parti SIGRTMIN

while [ "$NUMPROC" -gt 0 ]; do
         parti;
         let "NUMPROC--"
done

wait
trap - SIGRTMIN

exit $?

: &lt;&lt;SCRIPT_AUTHOR_COMMENTS
����Ҫʹ��ָ����ѡ��������һ������, 
�����ܹ����ܲ�ͬ���ļ�, ����Ҫ������һ���ദ����(SMP)�Ļ�����. 
��������(��Ҳ��)����ָ����Ŀ������, 
����ÿ��������ֹ֮��, ��Ҫ����һ���½���. 

"wait"���û���ṩʲô����, ��Ϊ����Ҫ�ȴ�һ��ָ���ĺ�̨����, 
���ߵȴ�*ȫ��*�ĺ�̨����. �����ұ�д��[���]bash�ű�����������������, 
����ʹ����"trap"ָ��. 
  --Vernia Damiano
SCRIPT_AUTHOR_COMMENTS
