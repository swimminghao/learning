#!/bin/bash
# redir2.sh

if [ -z "$1" ]
then
  Filename=names.data       # ���û��ָ���ļ���, ��ʹ�����Ĭ��ֵ. 
else
  Filename=$1
fi  
#+ Filename=${1:-names.data}
#  ���ɴ�������Ĳ���(�����滻).

count=0

echo

while [ "$name" != Smith ]  # Ϊʲô����$nameҪ������?
do
  read name                 # ��$Filename�ļ��ж�ȡ����, ��������stdin�ж�ȡ����. 
  echo $name
  let "count += 1"
done <"$Filename"           # �ض���stdin���ļ�$Filename. 
#    ^^^^^^^^^^^^

echo; echo "$count names read"; echo

exit 0

#  ע����һЩ�Ƚ��ϵ�shell�ű����������, 
#+ �ض����ѭ���Ƿ�����shell�����е�. 
#  ���, $count ֵ���غ���� 0, ��ֵ����ѭ����ʼǰ�ĳ�ʼֵ. 
#  *������ܵĻ�*, ����������Bash��ksh��ʹ����shell,
#+ ��������ű��ܹ���ȷ������. 
#  (��лHeiner Stevenָ���������.)

#  Ȼ�� . . .
#  Bash��ʱ����*��*��һ��ʹ�ùܵ���"while-read"ѭ��������һ����shell, 
#+ ���ض����"while"ѭ�������������. 

abc=hi
echo -e "1\n2\n3" | while read l
     do abc="$l"
        echo $abc
     done
echo $abc

#  ��л, Bruno de Oliveira Schneider
#+ ��������Ĵ���Ƭ������ʾ������. 
#  ͬʱ, ��л, Brian Onn, ������һ��ע�ʹ���. 
