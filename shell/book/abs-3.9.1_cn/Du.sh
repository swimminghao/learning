#!/bin/bash
# Du.sh: DOS��UNIX�ı��ļ���ת��.

E_WRONGARGS=65

if [ -z "$1" ]
then
  echo "Usage: `basename $0` filename-to-convert"
  exit $E_WRONGARGS
fi

NEWFILENAME=$1.unx

CR='\015'  # �س�.
           # 015��8���Ƶ�ASCII��Ļس�.
           # DOS���ı��ļ����н�������CR-LF.
           # UNIX���ı��ļ����н�����ֻ��LF.

tr -d $CR &lt; $1 &gt; $NEWFILENAME
# ɾ���س�����д�����ļ���. 

echo "Original DOS text file is \"$1\"."
echo "Converted UNIX text file is \"$NEWFILENAME\"."

exit 0

# ��ϰ:
# -----
# �޸��ϱߵĽű���ɴ�UNIX��DOS��ת��. 
