#!/bin/bash
# timed-input.sh

# TMOUT=3    ����һЩ��Bash�汾��Ҳ�����еĺܺ�.


TIMELIMIT=3  # ������������õ���3��. Ҳ��������Ϊ������ʱ��ֵ.

PrintAnswer()
{
  if [ "$answer" = TIMEOUT ]
  then
    echo $answer
  else       # ����ϱߵ�����Ū����.
    echo "Your favorite veggie is $answer"
    kill $!  # ������Ҫ��̨���е�TimerOn������, kill�˰�.
             # $! ��������һ���ں�̨���е���ҵ��PID.
  fi

}  



TimerOn()
{
  sleep $TIMELIMIT && kill -s 14 $$ &
  # �ȴ�3��, Ȼ����ű�����һ���ź�.
}  

Int14Vector()
{
  answer="TIMEOUT"
  PrintAnswer
  exit 14
}  

trap Int14Vector 14   # ��ʱ�ж�(14)�ᰵ�и���ʱ������. 

echo "What is your favorite vegetable "
TimerOn
read answer
PrintAnswer


#  �޿ɷ���, ����һ����ʱ����ĸ���ʵ��,
#+ Ȼ��"read"�����"-t"ѡ����Լ��������. 
#  �ο���ߵ�"t-out.sh".

#  �������Ҫһ���������ŵ�д��...
#+ ������ʹ��C��C++����д���Ӧ��,
#+ �����ʹ�ú��ʵĺ�����, ����'alarm'��'setitimer'������������.

exit 0
