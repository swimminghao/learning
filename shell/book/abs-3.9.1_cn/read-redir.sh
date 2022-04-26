#!/bin/bash

read var1 &lt;data-file
echo "var1 = $var1"
# var1�����"data-file"�ĵ�һ�е�ȫ�����ݶ�Ϊ����ֵ.

read var2 var3 &lt;data-file
echo "var2 = $var2   var3 = $var3"
# ע��, �����"read"��������һ�ֲ�ֱ�۵���Ϊ. 
# 1) ���´��ļ��Ŀ�ͷ��ʼ�������.
# 2) ÿ�����������ó����Կհ׷ָ���ַ���.
#    ������֮ǰ�������е�������Ϊ������ֵ.
# 3) �����һ����������ȡ�õ�һ��ʣ���ȫ������(����ע: �����Ƿ��Կհ׷ָ�).
# 4) �����Ҫ��ֵ�ı����������ļ��е�һ���Կհ׷ָ���ַ�����������Ļ�, 
#    ��ô��Щ�������ᱻ����ֵ.

echo "------------------------------------------------"

# �����ѭ��������ϱ����ᵽ������:
while read line
do
  echo "$line"
done &lt;data-file
# ��л, Heiner Steven ָ�������.

echo "------------------------------------------------"

# ʹ��$IFS(�ڲ���ָ�����)����ÿ�е����뵥���ķŵ�"read"��,
# ǰ��������㲻��ʹ��Ĭ�Ͽհ׵Ļ�.

echo "List of all users:"
OIFS=$IFS; IFS=:       # /etc/passwd ʹ�� ":" ��Ϊ��ָ���.
while read name passwd uid gid fullname ignore
do
  echo "$name ($fullname)"
done &lt;/etc/passwd   # I/O �ض���.
IFS=$OIFS              # �ָ�ԭʼ��$IFS.
# ��δ���Ҳ��Heiner Steven��д��.



#  ��ѭ���ڲ�����$IFS����, 
#+ �����ð�ԭʼ��$IFS
#+ ���浽��ʱ������.
#  ��л, Dim Segebart, ָ�������.
echo "------------------------------------------------"
echo "List of all users:"

while IFS=: read name passwd uid gid fullname ignore
do
  echo "$name ($fullname)"
done &lt;/etc/passwd   # I/O �ض���.

echo
echo "\$IFS still $IFS"

exit 0
