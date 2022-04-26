#!/bin/bash
# max2.sh: ȡ�����������е����ֵ. 

#  ����ǰһ������"max.sh"���޸İ�, 
#+ ����汾���ԱȽ�����������. 

EQUAL=0             # �������ֵ���, �Ǿͷ������ֵ. 
E_PARAM_ERR=-99999  # û���㹻��Ĳ������ݸ�����. 
#           ^^^^^^    ���ⳬ����Χ�Ĳ��������Դ��ݽ���. 

max2 ()             # "����"���������������Ǹ�. 
{
if [ -z "$2" ]
then
  echo $E_PARAM_ERR
  return
fi

if [ "$1" -eq "$2" ]
then
  echo $EQUAL
  return
else
  if [ "$1" -gt "$2" ]
  then
    retval=$1
  else
    retval=$2
  fi
fi

echo $retval        # ���(��stdout), ��û���÷���ֵ. 
                    # Ϊʲô? 
}


return_val=$(max2 33001 33997)
#            ^^^^             ������
#                 ^^^^^ ^^^^^ ���ݽ����Ĳ���
#  ����ʵ�������滻��һ����ʽ: 
#+ ���԰Ѻ�������Ϊһ������, 
#+ Ȼ��Ѻ�����stdout��ֵ������"return_val." 


# ========================= OUTPUT ========================
if [ "$return_val" -eq "$E_PARAM_ERR" ]
  then
  echo "Error in parameters passed to comparison function!"
elif [ "$return_val" -eq "$EQUAL" ]
  then
    echo "The two numbers are equal."
else
    echo "The larger of the two numbers is $return_val."
fi
# =========================================================
  
exit 0

#  ��ϰ:
#  -----
#  1) �ҵ�һ�ָ����ŵķ���, 
#+    �����Դ��ݸ������Ĳ���. 
#  2) ��"���"�ε�if/then�ṹ. 
#  3) ��д����ű�, ʹ���ܹ��������в����л������. 
