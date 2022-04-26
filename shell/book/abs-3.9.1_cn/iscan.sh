#! /bin/sh
## ʹ��netcat����д�ĺ�DaveGд��ident-scanɨ������ͬ�ȹ��ܵĶ���. ��, ���ᱻ������. 
## ����: target port [port port port ...]
## ��׼����ͱ�׼���뱻�쵽һ��.
##
##  �ŵ�: ����������ident-scan��, ����ʹԶ�̻���inetd���̸�����ע��������������, 
##+ ����ֻ�к��ٵ�֪���˿ڻᱻָ��. 
##  ȱ��: Ҫ�����ֶ˿ڲ���, ������޷����ֱ�׼����ͱ�׼����, 
##+ ���ҵ�Զ�̷�������ںܸߵĶ˿�ʱ�޷�����. 
# �ű�����: Hobbit &lt;hobbit@avian.org&gt;
# ����������ͬ����ABSָ����ʹ��. 

# ---------------------------------------------------
E_BADARGS=65       # ������Ҫ��������. 
TWO_WINKS=2        # ˯�߶೤ʱ��. 
THREE_WINKS=3
IDPORT=113         # indentЭ�����֤�˿�. 
RAND1=999
RAND2=31337
TIMEOUT0=9
TIMEOUT1=8
TIMEOUT2=4
# ---------------------------------------------------

case "${2}" in
  "" ) echo "Need HOST and at least one PORT." ; exit $E_BADARGS ;;
esac

# ����Ŀ���������Ƿ�������identd�ػ�����.
nc -z -w $TIMEOUT0 "$1" $IDPORT || { echo "Oops, $1 isn't running identd." ; exit 0 ; }
#  -z ѡ��ɨ���������.
#     -w $TIMEOUT = �������Ӷ೤ʱ��.

# ����һ������ı������Դ�˿�.
RP=`expr $$ % $RAND1 + $RAND2`

TRG="$1"
shift

while test "$1" ; do
  nc -v -w $TIMEOUT1 -p ${RP} "$TRG" ${1} < /dev/null > /dev/null &
  PROC=$!
  sleep $THREE_WINKS
  echo "${1},${RP}" | nc -w $TIMEOUT2 -r "$TRG" $IDPORT 2>&1
  sleep $TWO_WINKS

# �⿴��ȥ�ǲ�������м��Ľű������������ƵĶ���... ?
# ABS������ע : "�ⲻ�������ô���,
#+               ��ʵ��, ���÷ǳ�����."

  kill -HUP $PROC
  RP=`expr ${RP} + 1`
  shift
done

exit $?

#  ע������:
#  ---------

#  ���Űѵ�30��ȥ��, 
#+ Ȼ����"localhost.localdomain 25"Ϊ���������нű�.

#  ����Hobbitд�ĸ���'nc'���ӽű�,
#+ �����������ĵ����ҵ�:
#+ /usr/share/doc/nc-X.XX/scripts Ŀ¼.
