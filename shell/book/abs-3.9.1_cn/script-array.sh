#!/bin/bash
# script-array.sh: ������ű������ݸ�ֵ������. 
# ����ű������������Chris Martin��e-mail(��л!). 

script_contents=( $(cat "$0") )  #  ������ű�������($0)
                                 #+ ��ֵ������. 

for element in $(seq 0 $((${#script_contents[@]} - 1)))
  do                #  ${#script_contents[@]}
                    #+ ��ʾ����Ԫ�صĸ���. 
                    #
                    #  һ��С����:
                    #  Ϊʲô����ʹ��seq 0? 
                    #  ��seq 1����һ��. 
  echo -n "${script_contents[$element]}"
                    # ��ͬһ������ʾ�ű���ÿ���������. 
  echo -n " -- "    # ʹ�� " -- " ��Ϊ��ָ��. 
done

echo

exit 0

# ��ϰ:
# -----
#  �޸�����ű�, 
#+ ������ű��ܹ�������ԭ���ĸ�ʽ���, 
#+ ��ͬ�հ�, ����, �ȵ�. 
