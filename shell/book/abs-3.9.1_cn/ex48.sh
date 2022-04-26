#!/bin/bash

# ʹ��cpio������Ŀ¼��.

# ʹ��'cpio'���ŵ�: 
#   ���ٿ���. ��ͨ���ܵ�ʹ��'tar'�����һЩ.
#   ���ʺϿ���һЩ'cp'����
#+  �㲻���ĵ������ļ�(�������ֽ�pipes���ļ�, �ȵ�)

ARGS=2
E_BADARGS=65

if [ $# -ne "$ARGS" ]
then
  echo "Usage: `basename $0` source destination"
  exit $E_BADARGS
fi  

source=$1
destination=$2


find "$source" -depth | cpio -admvp "$destination"
#               ^^^^^         ^^^^^
# �Ķ�'find'��'cpio'��manҳ���˽���Щѡ�������. 
                                                         
                                                         
# ��ϰ:
# -----
                                                         
#  ���һЩ���������'find | cpio'�ܵ�������˳���($?)
#+ ����������ִ����ʱ��������ʵĴ�����. 

exit 0
