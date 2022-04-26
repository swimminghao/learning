#!/bin/bash
# seeding-random.sh: ����RANDOM������Ϊ����.

MAXCOUNT=25       # �����������ٸ������.

random_numbers ()
{
count=0
while [ "$count" -lt "$MAXCOUNT" ]
do
  number=$RANDOM
  echo -n "$number "
  let "count += 1"
done  
}

echo; echo

RANDOM=1          # Ϊ������Ĳ���������RANDOM����.
random_numbers

echo; echo

RANDOM=1          # ����ͬ��������...
random_numbers    # ...������ϱ߲��������������ͬ.
                  #
                  # ����һ����ͬ��"���"������ʲô�����������?

echo; echo

RANDOM=2          # ����һ��, �������ʹ�ò�ͬ������...
random_numbers    # ��ν��õ�һ����ͬ���������.

echo; echo

# RANDOM=$$  ʹ�ýű��Ľ���ID����Ϊ���������������.
# �� 'time' �� 'date' ������ȡ��RANDOM��Ϊ����Ҳ�ǳ��õ�����.

# һ�������������ķ���...
SEED=$(head -1 /dev/urandom | od -N 1 | awk '{ print $2 }')
#  ���ȴ�/dev/urandom(ϵͳα����豸�ļ�)��ȡ��һ��,
#+ Ȼ������ɴ�ӡ��ת��Ϊ8������, ʹ��"od"������ת��.
#+ ���ʹ��"awk"�����һ����,
#+ ���������Ϊ���������������.
RANDOM=$SEED
random_numbers

echo; echo

exit 0
