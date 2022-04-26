#!/bin/bash
# paragraph-space.sh

# ��һ�������о���ı��ļ��в������.
# Usage: $0 &lt;FILENAME

MINLEN=45        # ������Ҫ�޸����ֵ.
#  �ٶ��еĳ���С��$MINLEN��ָ���ĳ��ȵ�ʱ�� 
#+ ����Ϊ�˶ν���.

while read line  # �ṩ�������ļ�һ�������...
do
  echo "$line"   # ������������б���.

  len=${#line}
  if [ "$len" -lt "$MINLEN" ]
    then echo    # �ڶ���(����ע: Ҳ����С��$MINLEN���ַ�����)�������һ������.
  fi  
done

exit 0
