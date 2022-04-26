#!/bin/bash
# script-detector.sh: ��һ��Ŀ¼�м�����еĽű��ļ�. 

TESTCHARS=2    # ����ǰ�����ַ�.
SHABANG='#!'   # �ű�������"#!"��ͷ��. 

for file in *  # ������ǰĿ¼�µ������ļ�. 
do
  if [[ `head -c$TESTCHARS "$file"` = "$SHABANG" ]]
  #      head -c2                      #!
  #  '-c' ѡ����ļ�ͷ���ָ���������ַ�, 
  #+ ������Ĭ�ϵ�����. 
  then
    echo "File \"$file\" is a script."
  else
    echo "File \"$file\" is *not* a script."
  fi
done
  
exit 0

#  ��ϰ:
#  -----
#  1) �޸�����ű�, 
#+    ��������ָ��ɨ���·��. 
#+    (������ֻ������ǰĿ¼). 
#
#  2) ������ű�Ŀǰ��״��, ��������ȷʶ���
#+    Perl, awk, ������һЩ�ű����ԵĽű��ļ�.
#     �����������.
