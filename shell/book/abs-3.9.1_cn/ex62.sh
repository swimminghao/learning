#!/bin/bash
# �����ڲ��ľֲ�������ȫ�ֱ���. 

func ()
{
  local loc_var=23       # ����Ϊ�ֲ�����. 
  echo                   # ʹ��'local'�ڽ�����. 
  echo "\"loc_var\" in function = $loc_var"
  global_var=999         # û������Ϊ�ֲ�����. 
                         # Ĭ��Ϊȫ�ֱ���.  
  echo "\"global_var\" in function = $global_var"
}  

func

# ����, �������ֲ�����"loc_var"�ں����ⲿ�Ƿ�ɼ�. 

echo
echo "\"loc_var\" outside function = $loc_var"
                                      # $loc_var outside function = 
                                      # ����, $loc_var����ȫ�ֿɼ���. 
echo "\"global_var\" outside function = $global_var"
                                      # �ں����ⲿ$global_var = 999
                                      # $global_var��ȫ�ֿɼ���. 
echo				      

exit 0
#  ��C�������, �ں�����������Bash����
#+ ����������ȷ����Ϊlocalʱ, �����Ǿֲ���. 
