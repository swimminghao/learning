#!/bin/bash
# agram.sh: ʹ��anagram������Ϸ. 

# Ѱ��anagram...
LETTERSET=etaoinshrdlu
FILTER='.......'       # �����ж��ٸ���ĸ? 
#       1234567

anagram "$LETTERSET" | # �ҳ�����ַ��������е�anagram...
grep "$FILTER" |       # ������Ҫ7���ַ�, 
grep '^is' |           # ��'is'��ͷ
grep -v 's$' |         # ���Ǹ���(ָӢ�ĵ��ʵĸ���)
grep -v 'ed$'          # ���ǹ�ȥʱ(ҲָӢ�ĵ���)
# ��������������������͹�����. 

#  ʹ��"anagram"����, 
#+ �������ߵ�"yawl"���ֱ�������е�һ����. 
#  http://ibiblio.org/pub/Linux/libs/yawl-0.3.2.tar.gz
#  http://personal.riverusers.com/~thegrendel/yawl-0.3.2.tar.gz

exit 0                 # �������. 


bash$ sh agram.sh
islander
isolate
isolead
isotheral



#  ��ϰ:
#  -----
#  �޸�����ű�, ʹ���ܹ���LETTERSET��Ϊ�����в���. 
#  ����11 - 13�еĹ�����������(����, ����ʹ�ñ���$FILTER), 
#+ �������ǾͿ��Ը��ݴ��ݵĲ�����ָ������. 

#  ���Բο��ű�agram2.sh, 
#+ �����������΢��Щ��ͬ. 
