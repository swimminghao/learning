#!/bin/bash
# bad-op.sh: ����һ�¶�����ʹ���ַ����Ƚ�. 

echo
number=1

# �����"whileѭ��"����������: 
#+ һ���Ƚ�����, ����һ���Ƚ�����. 

while [ "$number" < 5 ]    # ��! Ӧ����:  while [ "$number" -lt 5 ]
do
  echo -n "$number "
  let "number += 1"
done  
#  �������ͼ�����������Ľű�, ��ô�ͻ�õ�һ��������Ϣ: 
#+ bad-op.sh: line 10: 5: No such file or directory
#  �ڵ������Žṹ([ ])��, "<"���뱻ת��. 
#+ �������, �Ƚ������������Ǵ����. 


echo "---------------------"


while [ "$number" \< 5 ]    #  1 2 3 4
do                          #
  echo -n "$number "        #  ������*������Թ���, ���� . . .
  let "number += 1"         #+ ��ʵ���ǱȽ�ASCII��, 
done                        #+ �����������Ƚ�. 

echo; echo "---------------------"

# ��ô�����������. ����: 

lesser=5
greater=105

if [ "$greater" \< "$lesser" ]
then
  echo "$greater is less than $lesser"
fi                          # 105 is less than 5
#  ��ʵ��, ���ַ����Ƚ���(����ASCII���˳��)
#+ "105"С��"5". 

echo

exit 0
