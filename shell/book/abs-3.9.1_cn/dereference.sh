#!/bin/bash
# dereference.sh
# ��һ�����ݸ������Ĳ������н�����õĲ���. 
# �˽ű���Bruce W. Clare����д. 

dereference ()
{
     y=\$"$1"   # ������. 
     echo $y    # $Junk

     x=`eval "expr \"$y\" "`
     echo $1=$x
     eval "$1=\"Some Different Text \""  # ����ֵ. 
}

Junk="Some Text"
echo $Junk "before"    # Some Text before

dereference Junk
echo $Junk "after"     # Some Different Text after

exit 0
