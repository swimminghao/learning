#!/bin/bash
# max.sh: ȡ���������е����ֵ. 

E_PARAM_ERR=-198    # ������������Ĳ�������2��ʱ, �ͷ������ֵ. 
EQUAL=-199          # ��������������ʱ, �������ֵ. 
#  ���ⳬ����Χ��
#+ ����ֵ�����ܴ��ݵ�������. 

max2 ()             # �������������е����ֵ. 
{                   # ע��: ����Ƚϵ�������С��257. 
if [ -z "$2" ]
then
  return $E_PARAM_ERR
fi

if [ "$1" -eq "$2" ]
then
  return $EQUAL
else
  if [ "$1" -gt "$2" ]
  then
    return $1
  else
    return $2
  fi
fi
}

max2 33 34
return_val=$?

if [ "$return_val" -eq $E_PARAM_ERR ]
then
  echo "Need to pass two parameters to the function."
elif [ "$return_val" -eq $EQUAL ]
  then
    echo "The two numbers are equal."
else
    echo "The larger of the two numbers is $return_val."
fi  

  
exit 0

#  ��ϰ(��):
#  -----------
#  ������ű�ת��Ϊ����ʽ�ű�, 
#+ Ҳ����, �޸�����ű�, ����Ҫ�����������2����. 
