#!/bin/bash
# gcd.sh: ���Լ��
#         ʹ��Euclid���㷨

#  ����������"���Լ��" (gcd), 
#+ ���������������ܹ�ͬʱ������������. 

#  Euclid�㷨������������. 
#  ��ÿһ��ѭ����,
#+ ������ &lt;---  ����
#+ ���� &lt;---  ����
#+ ֱ�� ���� = 0.
#+ �����һ��ѭ����, gcd = ������.
#
#  ����Euclid�㷨�ĸ����ʵ�����, ���Ե�
#+ Jim Loy��վ��, http://www.jimloy.com/number/euclids.htm.


# ------------------------------------------------------
# �������
ARGS=2
E_BADARGS=65

if [ $# -ne "$ARGS" ]
then
  echo "Usage: `basename $0` first-number second-number"
  exit $E_BADARGS
fi
# ------------------------------------------------------


gcd ()
{

  dividend=$1                    #  ���⸳ֵ.
  divisor=$2                     #+ ������, �ĸ�ֵ���Ĵ�û��ϵ.
                                 #  Ϊʲôû��ϵ?

  remainder=1                    #  �����ѭ����ʹ����δ��ʼ���ı���, 
                                 #+ ��ô�ڵ�һ��ѭ����, 
                                 #+ ���������һ��������Ϣ. 

  until [ "$remainder" -eq 0 ]
  do
    let "remainder = $dividend % $divisor"
    dividend=$divisor            # ����ʹ��������С�������ظ�.
    divisor=$remainder
  done                           # Euclid���㷨

}                                # Last $dividend is the gcd.


gcd $1 $2

echo; echo "GCD of $1 and $2 = $dividend"; echo


# Exercise :
# --------
#  ��鴫�ݽ����������в�����ȷ�����Ƕ�������.
#+ �����������, �Ǿ͸���һ���ʵ��Ĵ�����Ϣ���˳��ű�.

exit 0
