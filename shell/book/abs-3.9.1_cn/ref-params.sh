#!/bin/bash
# ref-params.sh: ������ݸ������Ĳ�������.
#                (���ӵ�����)

ITERATIONS=3  # ȡ������Ĵ���. 
icount=1

my_read () {
  #  ��my_read varname������ʽ������, 
  #+ ��֮ǰ�����������ֵ��ΪĬ��ֵ���, 
  #+ Ȼ��Ҫ������һ����ֵ. 

  local local_var

  echo -n "Enter a value "
  eval 'echo -n "[$'$1'] "'  #  ֮ǰ��ֵ. 
# eval echo -n "[\$$1] "     #  ���������, 
                             #+ ���ᶪʧ�û���β������Ŀո�. 
  read local_var
  [ -n "$local_var" ] && eval $1=\$local_var

  # "���б�": ���"local_var"�Ĳ��Խ��Ϊtrue, ��ѱ���"$1"��ֵ������. 
}

echo

while [ "$icount" -le "$ITERATIONS" ]
do
  my_read var
  echo "Entry #$icount = $var"
  let "icount += 1"
  echo
done  


# ��лStephane Chazelas�ṩ�������. 

exit 0
