#!/bin/bash
# random-between.sh
# ��������ָ��ֵ֮��������.
# ��Bill Gradwohl��д, ������������һЩ�޸�.
# �ű���������������ʹ��.


randomBetween() {
   #  ��$min��$max֮��,
   #+ ����һ�����Ļ򸺵������.
   #+ ���ҿ��Ա�$divisibleBy������.
   #  ����һ��������������ķ���ֵ.
   #
   #  Bill Gradwohl - Oct 1, 2003

   syntax() {
   # �ں�������Ƕ����
      echo
      echo    "Syntax: randomBetween [min] [max] [multiple]"
      echo
      echo    "Expects up to 3 passed parameters, but all are completely optional."
      echo    "min is the minimum value"
      echo    "max is the maximum value"
      echo    "multiple specifies that the answer must be a multiple of this value."
      echo    "    i.e. answer must be evenly divisible by this number."
      echo    
      echo    "If any value is missing, defaults area supplied as: 0 32767 1"
      echo    "Successful completion returns 0, unsuccessful completion returns"
      echo    "function syntax and 1."
      echo    "The answer is returned in the global variable randomBetweenAnswer"
      echo    "Negative values for any passed parameter are handled correctly."
   }

   local min=${1:-0}
   local max=${2:-32767}
   local divisibleBy=${3:-1}
   # Ĭ��ֵ����, ��������û�в������ݽ��������.

   local x
   local spread

   # ȷ��divisibleBy����ֵ.
   [ ${divisibleBy} -lt 0 ] && divisibleBy=$((0-divisibleBy))

   # �����Լ��.
   if [ $# -gt 3 -o ${divisibleBy} -eq 0 -o  ${min} -eq ${max} ]; then 
      syntax
      return 1
   fi

   # �鿴min��max�Ƿ�ߵ���.
   if [ ${min} -gt ${max} ]; then
      # ��������.
      x=${min}
      min=${max}
      max=${x}
   fi

   #  ���min�Լ������ܹ���$divisibleBy������,
   #+ ��ô�͵���max��ֵ, ʹ���ܹ���$divisibleBy������, ǰ���ǲ��ܷŴ�Χ.
   if [ $((min/divisibleBy*divisibleBy)) -ne ${min} ]; then 
      if [ ${min} -lt 0 ]; then
         min=$((min/divisibleBy*divisibleBy))
      else
         min=$((((min/divisibleBy)+1)*divisibleBy))
      fi
   fi

   #  ���min�Լ������ܹ���$divisibleBy������,
   #+ ��ô�͵���max��ֵ, ʹ���ܹ���$divisibleBy������, ǰ���ǲ��ܷŴ�Χ.
   if [ $((max/divisibleBy*divisibleBy)) -ne ${max} ]; then 
      if [ ${max} -lt 0 ]; then
         max=$((((max/divisibleBy)-1)*divisibleBy))
      else
         max=$((max/divisibleBy*divisibleBy))
      fi
   fi

   #  ---------------------------------------------------------------------
   #  ����, �����������Ĺ���.

   #  ע��, Ϊ�˵õ����ڶ˵���˵���ʵķ���,
   #+ ���ֵ�ķ�Χ���ò�����
   #+ 0 �� abs(max-min)+divisibleBy ֮��, ������ abs(max-min)+1.

   #  ���ڶ˵���˵,
   #+ ������������ӽ���������ʵķ���.

   #  ����޸������ʽ, ʹ�� abs(max-min)+1 ������ abs(max-min)+divisibleBy�Ļ�, 
   #+ Ҳ�ܹ��õ���ȷ�Ĵ�, ��������������������ɵ����ֵ��������Ϊ�˵㱶��
   #+ �����������˵���ǲ�������, ��Ϊ����Ϊ�˵㱶������µ�����ʱȽϵ�,
   #+ ��Ϊ��ż�1����, ��������Ĺ�ʽ���������ļ���ҪС�Ķ�(����Ϊ��divisibleBy).
   #  ---------------------------------------------------------------------

   spread=$((max-min))
   [ ${spread} -lt 0 ] && spread=$((0-spread))
   let spread+=divisibleBy
   randomBetweenAnswer=$(((RANDOM%spread)/divisibleBy*divisibleBy+min))   

   return 0

   #  Ȼ��, Paulo Marcel Coelho Aragao ָ��
   #+ �� $max �� $min ���ܹ���$divisibleBy������ʱ,
   #+ �����ʽ����ʧ��.
   #
   #  ������ʹ�����¹�ʽ:
   #    rnumber = $(((RANDOM%(max-min+1)+min)/divisibleBy*divisibleBy))

}

# �����ǲ���һ���������.
min=-14
max=20
divisibleBy=3


#  ����һ��������������answers, �����±�������ʾ�ڷ�Χ�ڿ��ܳ��ֵ�ֵ,
#+ ��Ԫ�����ݼ�¼�������ֵ�����ֵĴ���, �������ѭ���㹻���, ��ô����һ����õ�����һ�γ��ֻ���.

declare -a answer
minimum=${min}
maximum=${max}
   if [ $((minimum/divisibleBy*divisibleBy)) -ne ${minimum} ]; then 
      if [ ${minimum} -lt 0 ]; then
         minimum=$((minimum/divisibleBy*divisibleBy))
      else
         minimum=$((((minimum/divisibleBy)+1)*divisibleBy))
      fi
   fi


132    #  ���max�������ܹ���$divisibleBy����,
133    #+ ��ô�͵���max��ֵ, ʹ���ܹ���$divisibleBy����, ǰ���ǲ��ܷŴ�Χ.

   if [ $((maximum/divisibleBy*divisibleBy)) -ne ${maximum} ]; then 
      if [ ${maximum} -lt 0 ]; then
         maximum=$((((maximum/divisibleBy)-1)*divisibleBy))
      else
         maximum=$((maximum/divisibleBy*divisibleBy))
      fi
   fi


#  ������Ҫ����һ���±�ȫ��Ϊ��������.
#+ ����������Ҫһ��displacement, 
#+ �����Ϳ��Ա�֤�����Ϊ��. 

displacement=$((0-minimum))
for ((i=${minimum}; i<=${maximum}; i+=divisibleBy)); do
   answer[i+displacement]=0
done


# ����, ������ѭ���㹻��Ĵ���, ���õ�������Ҫ�Ĵ�.
loopIt=1000   #  �ű����߽���ѭ�� 100000 ��,
              #+ ��������Ҫ��ʱ��̫����.

for ((i=0; i<${loopIt}; ++i)); do

   #  ע��, �������������randomBetweenAnswer����ʱ, ���ƽ�min��max�ߵ�˳��.
   #+ ����Ϊ�˲��������������, �˺����Ƿ�����ȷ������.

   randomBetween ${max} ${min} ${divisibleBy}

   # ����𰸲���������������, �ͱ���.
   [ ${randomBetweenAnswer} -lt ${min} -o ${randomBetweenAnswer} -gt ${max} ] && echo MIN or MAX error - ${randomBetweenAnswer}!
   [ $((randomBetweenAnswer%${divisibleBy})) -ne 0 ] && echo DIVISIBLE BY error - ${randomBetweenAnswer}!

   # ��ͳ��ֵ���浽answer��.
   answer[randomBetweenAnswer+displacement]=$((answer[randomBetweenAnswer+displacement]+1))
done



# ���������쿴һ�½��.

for ((i=${minimum}; i<=${maximum}; i+=divisibleBy)); do
   [ ${answer[i+displacement]} -eq 0 ] && echo "We never got an answer of $i." || echo "${i} occurred ${answer[i+displacement]} times."
done


exit 0
