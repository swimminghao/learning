#!/bin/bash

# �����ϸ��ű�����һ���汾. 

#  Heiner Steven����, 
#+ Ϊ�˱����ض���ѭ����������shell��(�ϰ汾��shell����ô��), ������ض���ѭ�������ڵ�ǰ��������, 
#+ �����Ļ�, ��Ҫ��ǰ�����ļ��������ض���, 
#+ ��Ϊ���������(��shell�����е�)ѭ���б��޸ĵĻ�, ѭ�������󲢲��ᱣ���޸ĺ��ֵ. 


if [ -z "$1" ]
then
  Filename=names.data     # ���û��ָ���ļ�����ʹ��Ĭ��ֵ. 
else
  Filename=$1
fi  


exec 3<&0                 # ��stdin���浽�ļ�������3. 
exec 0<"$Filename"        # �ض����׼����. 

count=0
echo


while [ "$name" != Smith ]
do
  read name               # ��stdin(�����Ѿ���$Filename��)�ж�ȡ. 
  echo $name
  let "count += 1"
done                      #  ���ļ�$Filename��ѭ����ȡ
                          #+ ��Ϊ�ļ�(����ע��ָĬ���ļ�, �ڱ������)��20��. 

#  ����ű�ԭ����"while"ѭ���Ľ�β����һ��: 
#+      done <"$Filename" 
#  ��ϰ:
#  Ϊʲô����Ҫ�����? 


exec 0<&3                 # �ָ������stdin. 
exec 3<&-                 # �ر���ʱ�ļ�������3. 

echo; echo "$count names read"; echo

exit 0
