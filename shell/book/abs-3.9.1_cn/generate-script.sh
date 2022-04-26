#!/bin/bash
# generate-script.sh
# ����ű��ĵ�������Albert Reiner��һ������. 

OUTFILE=generated.sh         # �������ļ�������. 


# -----------------------------------------------------------
# 'Here document��������Ҫ�����Ľű��Ĵ���. 
(
cat <<'EOF'
#!/bin/bash

echo "This is a generated shell script."
#  Note that since we are inside a subshell,
#+ we can't access variables in the "outside" script.

echo "Generated file will be named: $OUTFILE"
#  Above line will not work as normally expected
#+ because parameter expansion has been disabled.
#  Instead, the result is literal output.

a=7
b=3

let "c = $a * $b"
echo "c = $c"

exit 0
EOF
) > $OUTFILE
# -----------------------------------------------------------

#  ��'limit string'��������������ֹ�ϱ�
#+ here document��Ϣ���еı�����չ. 
#  ���ʹ������ļ��е����ݱ���here document��Ϣ���е�ԭ��. 

if [ -f "$OUTFILE" ]
then
  chmod 755 $OUTFILE
  # �����������ļ����п�ִ��Ȩ��. 
else
  echo "Problem in creating file: \"$OUTFILE\""
fi

#  �������Ҳ������������
#+ C�������, Perl�������, Python�������, makefile, 
#+ ��������һЩ���ƵĴ���. 
#  (����ע: �м�һ��û���ע�ͽ��ᱻhere document��ӡ����)
exit 0
