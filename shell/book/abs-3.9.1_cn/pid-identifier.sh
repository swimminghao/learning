#!/bin/bash
# pid-identifier.sh: ������ָ��pid��������̵�����·����. 

ARGNO=1  # �����Ĳ�������. 
E_WRONGARGS=65
E_BADPID=66
E_NOSUCHPROCESS=67
E_NOPERMISSION=68
PROCFILE=exe

if [ $# -ne $ARGNO ]
then
  echo "Usage: `basename $0` PID-number" >&2  # Error message >stderr(������Ϣ�ض��򵽱�׼����). 
  exit $E_WRONGARGS
fi  

pidno=$( ps ax | grep $1 | awk '{ print $1 }' | grep $1 )
# ��"ps"������������������pid����, pidλ���ڵ�һ��#1, ��awk���˳���. 
# Ȼ���ٴ�ȷ�������������Ҫ�ҵĽ���, ������������ű������������Ľ���. 
# ����"grep $1"�����������˵����ֿ�����. 
#
#    pidno=$( ps ax | awk '{ print $1 }' | grep $1 )
#    ��ôд�Ϳ�����, ��һ����Teemu Huovilaָ��. 

if [ -z "$pidno" ]  # ����������еĹ���֮��, �õ��Ľ����һ������Ϊ0���ַ���, 
then                # �Ǿ�˵�����pidû����Ӧ�Ľ���������. 
  echo "No such process running."
  exit $E_NOSUCHPROCESS
fi  

# Ҳ������ôд: 
#   if ! ps $1 > /dev/null 2>&1
#   then                # û�������pid��ƥ��Ľ���������. 
#     echo "No such process running."
#     exit $E_NOSUCHPROCESS
#    fi

# Ϊ�˼���������, ����ʹ��"pidof". 


if [ ! -r "/proc/$1/$PROCFILE" ]  # ����Ȩ��. 
then
  echo "Process $1 running, but..."
  echo "Can't get read permission on /proc/$1/$PROCFILE."
  exit $E_NOPERMISSION  # һ���û����ܷ���/procĿ¼�µ�ĳЩ�ļ�. 
fi  

# ����������Կ���ʹ����������������: 
#    if ! kill -0 $1 > /dev/null 2>&1 # '0'����һ���ź�, but
                                      # ������ô��, ���Բ���һ���Ƿ�
                                      # ������ý��̷����ź�. 
#    then echo "PID doesn't exist or you're not its owner" >&2
#    exit $E_BADPID
#    fi



exe_file=$( ls -l /proc/$1 | grep "exe" | awk '{ print $11 }' )
# ��       exe_file=$( ls -l /proc/$1/exe | awk '{print $11}' )
#
# /proc/pid-number/exe��һ����������, 
# ָ��������ý��̵�����·����. 

if [ -e "$exe_file" ]  # ���/proc/pid-number/exe����...
then                 # ��ô��Ӧ�Ľ��̾ʹ���. 
  echo "Process #$1 invoked by $exe_file."
else
  echo "No such process running."
fi  


# ������������Ľű�, *����*�ܹ����±���һ�������: 
# ps ax | grep $1 | awk '{ print $5 }'
# ����, ���������Ṥ��...
# ��Ϊ'ps'����ĵ�5���ǽ��̵�argv[0](����ע: ���������е�һ������, ������ʱ�����õĳ���·������.)
# �����ǿ�ִ���ļ���·��. 
#
# Ȼ��, �±������ַ���������ȷ������������. 
#       find /proc/$1/exe -printf '%l\n'
#       lsof -aFn -p $1 -d txt | sed -ne 's/^n//p'

# ����ע��, ��Stephane Chazelas��ӵ�. 

exit 0
