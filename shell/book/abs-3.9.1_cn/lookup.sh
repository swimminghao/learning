#!/bin/bash
# lookup: ��ָ�������ļ��е�ÿ�����ʶ���һ���ֵ��ѯ. 

file=words.data  # ָ����Ҫ�����������ļ�. 

echo

while [ "$word" != end ]  # �����ļ������һ������. 
do
  read word      # �������ļ��ж�, ��Ϊ��ѭ���ĺ���ض�����. 
  look $word > /dev/null  # ���뽫�ֵ��ļ��е�����ʾ����.
  lookup=$?      # 'look'������˳�״̬. 

  if [ "$lookup" -eq 0 ]
  then
    echo "\"$word\" is valid."
  else
    echo "\"$word\" is invalid."
  fi  

done <"$file"    # ��stdin�ض���$file, ����"reads"������$file.

echo

exit 0

# ----------------------------------------------------------------
# �±ߵĴ����н�����ִ��, ��Ϊ�ϱ��Ѿ���"exit"������.


# Stephane Chazelas����ʹ���±߸����ķ���:

while read word && [[ $word != end ]]
do if look "$word" > /dev/null
   then echo "\"$word\" is valid."
   else echo "\"$word\" is invalid."
   fi
done <"$file"

exit 0
