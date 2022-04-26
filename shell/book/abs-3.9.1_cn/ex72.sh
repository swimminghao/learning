#!/bin/bash
# upload.sh

#  �ϴ���һ���ļ�(Filename.lsm, Filename.tar.gz)
#+ ��Sunsite/UNC (ibiblio.org)��incomingĿ¼. 
#  Filename.tar.gz�������tar��. 
#  Filename.lsm�������ļ�. 
#  Sunsite��Ҫ"lsm"�ļ�, ����;ܾ��ϴ�. 


E_ARGERROR=65

if [ -z "$1" ]
then
  echo "Usage: `basename $0` Filename-to-upload"
  exit $E_ARGERROR
fi  


Filename=`basename $1`           # ���ļ�����ȥ��Ŀ¼�ַ���. 

Server="ibiblio.org"
Directory="/incoming/Linux"
#  ������Ҳ��һ���ǵý��ϱߵĲ���д��������ű���, 
#+ ����ʹ�������в����ķ������滻. 

Password="your.e-mail.address"   # �����޸ĳ���ƥ�������. 

ftp -n $Server &lt;&lt;End-Of-Session
# -nѡ������Զ���¼. 

user anonymous "$Password"
binary
bell                             # ��ÿ���ļ������, ����. 
cd $Directory
put "$Filename.lsm"
put "$Filename.tar.gz"
bye
End-Of-Session

exit 0
