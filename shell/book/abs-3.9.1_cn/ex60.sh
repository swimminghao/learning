#!/bin/bash
# �����Ͳ���

DEFAULT=default                             # Ĭ�ϲ���ֵ. 

func2 () {
   if [ -z "$1" ]                           # ��һ�������Ƿ񳤶�Ϊ��? 
   then
     echo "-Parameter #1 is zero length.-"  # ����û�в��������ݽ���. 
   else
     echo "-Param #1 is \"$1\".-"
   fi

   variable=${1-$DEFAULT}                   #  ����Ĳ����滻
   echo "variable = $variable"              #+ ��ʾʲô? 
                                            #  ---------------------------
                                            #  Ϊ������û�в��������, 
                                            #+ ��ֻ��һ��null���������. 

   if [ "$2" ]
   then
     echo "-Parameter #2 is \"$2\".-"
   fi

   return 0
}

echo
   
echo "Nothing passed."   
func2                          # ������������
echo


echo "Zero-length parameter passed."
func2 ""                       # ʹ��0���ȵĲ������е���
echo

echo "Null parameter passed."
func2 "$uninitialized_param"   # ʹ��δ��ʼ���Ĳ������е���
echo

echo "One parameter passed."   
func2 first           # ��һ����������
echo

echo "Two parameters passed."   
func2 first second    # ��������������
echo

echo "\"\" \"second\" passed."
func2 "" second       # ��������������, 
echo                  # ��һ����������Ϊ0, �ڶ�����������ASCII����ɵ��ַ���. 

exit 0
