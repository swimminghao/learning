#!/bin/bash
# color-echo.sh: ʹ����ɫ����ʾ�ı���Ϣ. 

# ���԰������Լ���Ŀ�����޸�����ű�. 
# ��Ƚ���ɫ��ֵд��������. 

black='\E[30;47m'
red='\E[31;47m'
green='\E[32;47m'
yellow='\E[33;47m'
blue='\E[34;47m'
magenta='\E[35;47m'
cyan='\E[36;47m'
white='\E[37;47m'


alias Reset="tput sgr0"      #  ��������, 
                             #+ ���ı���������Ϊ�������. 


cecho ()                     # Color-echo.
                             # ����$1 = Ҫ��ʾ����Ϣ
                             # ����$2 = ��ɫ
{
local default_msg="No message passed."
                             # ��ʵ����һ���ǵ��Ǿֲ�����. 

message=${1:-$default_msg}   # Ĭ��Ϊdefault_msg. 
color=${2:-$black}           # ���û��ָ��, Ĭ��Ϊ��ɫ. 

  echo -e "$color"
  echo "$message"
  Reset                      # �����ı�����. 

  return
}  


# ����, ��������һ��. 
# ----------------------------------------------------
cecho "Feeling blue..." $blue
cecho "Magenta looks more like purple." $magenta
cecho "Green with envy." $green
cecho "Seeing red?" $red
cecho "Cyan, more familiarly known as aqua." $cyan
cecho "No color passed (defaults to black)."
       # ȱ��$color����. 
cecho "\"Empty\" color passed (defaults to black)." ""
       # �յ�$color����. 
cecho
       # ȱ��$message��$color����.
cecho "" ""
       # �յ�$message��$color����. 
# ----------------------------------------------------

echo

exit 0

# ��ϰ:
# -----
# 1) Ϊ'cecho ()'�������"����"����. 
# 2) Ϊ��ɫ�������ѡ��. 
