#!/bin/bash
# blot-out.sh: ɾ��һ���ļ�"����"�ļ�¼. 

#  ����ű���ʹ������ֽڽ���ĸ���Ŀ���ļ�, 
#+ ����������ɾ������ļ�֮ǰ����.
#  ��ô��֮��, ��ʹ��ͨ����ͳ�ֶ�������������
#+ Ҳ���ܰ��ļ�ԭʼ�������»ָ�.

PASSES=7         #  �ƻ��ļ��Ĵ���. 
                 #  ���������ֻ�����ű����е��ٶ�, 
                 #+ �����ǶԳߴ�Ƚϴ��Ŀ���ļ����в�����ʱ��. 
BLOCKSIZE=1      #  ����/dev/urandom��I/O��Ҫ��λ��ߴ�, 
                 #+ ��������ܻ�����ֵĽ��. 
E_BADARGS=70     #  ��ͬ�Ĵ����˳���. 
E_NOT_FOUND=71
E_CHANGED_MIND=72

if [ -z "$1" ]   # ûָ���ļ���. 
then
  echo "Usage: `basename $0` filename"
  exit $E_BADARGS
fi

file=$1

if [ ! -e "$file" ]
then
  echo "File \"$file\" not found."
  exit $E_NOT_FOUND
fi  

echo; echo -n "Are you absolutely sure you want to blot out \"$file\" (y/n)? "
read answer
case "$answer" in
[nN]) echo "Changed your mind, huh?"
      exit $E_CHANGED_MIND
      ;;
*)    echo "Blotting out file \"$file\".";;
esac


flength=$(ls -l "$file" | awk '{print $5}')  # 5���ļ�����. 
pass_count=1

chmod u+w "$file"   # ������/ɾ������ļ�. 

echo

while [ "$pass_count" -le "$PASSES" ]
do
  echo "Pass #$pass_count"
  sync         # ˢ��buffers.
  dd if=/dev/urandom of=$file bs=$BLOCKSIZE count=$flength
               # ʹ������ֽڽ������. 
  sync         # �ٴ�ˢ��buffer. 
  dd if=/dev/zero of=$file bs=$BLOCKSIZE count=$flength
               # ��0���. 
  sync         # �ٴ�ˢ��buffer. 
  let "pass_count += 1"
  echo
done  


rm -f $file    # ���, ɾ������Ѿ����ƻ��ò������ӵ��ļ�.
sync           # ���һ��ˢ��buffer.

echo "File \"$file\" blotted out and deleted."; echo


exit 0

#  ����һ��������ȫ��ɾ���ļ��İ취,
#+ ����Ч�ʱȽϵ�, ���бȽ���.
#  GNU�ļ����߰��е�"shred"����,
#+ Ҳ���������ͬ�Ĺ���, ��������Ч��.
                                                            
#  ʹ����ͨ�ķ����ǲ��������»ָ�����ļ���.
#  Ȼ�� . . .
#+ ����򵥵������ǲ��ܹ��ֿ�
#+ ��Щ����ḻ��������ķ���.
                                                            
#  ����ű����ܲ���ܺõ���������־�ļ�ϵͳ��(JFS).
#  ��ϰ (����): �����������������������.



#  Tom Vier���ļ�ɾ�������Ը��ӳ��׵�ɾ���ļ�, 
#+ ��������������Ķ�. 
#     http://www.ibiblio.org/pub/Linux/utils/file/wipe-2.0.0.tar.bz2

#  �����԰�ȫɾ���ļ���һ�����������ķ���,
#+ ���Բμ�Peter Gutmann����ҳ,
#+     "Secure Deletion of Data From Magnetic and Solid-State Memory".
#       http://www.cs.auckland.ac.nz/~pgut001/pubs/secure_del.html
