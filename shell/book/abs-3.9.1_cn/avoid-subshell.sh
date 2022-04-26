#!/bin/bash
# avoid-subshell.sh
# ��Matthew Walker������Ľ���. 

Lines=0

echo

cat myfile.txt | while read line;  #  (����ע: �ܵ��������shell)
                 do {
                   echo $line
                   (( Lines++ ));  #  �������������ֵ
                                   #+ �����ⲿѭ��ȴ���ܷ���. 
                                   #  ��shell����. 
                 }
                 done

echo "Number of lines read = $Lines"     # 0
                                         # ����!

echo "------------------------"


exec 3&lt;&gt; myfile.txt
while read line &lt;&3
do {
  echo "$line"
  (( Lines++ ));                   #  �������������ֵ
                                   #+ �����ⲿѭ���Ϳ��Է�����. 
                                   #  û����shell, ���ھ�û������. 
}
done
exec 3&gt;&-

echo "Number of lines read = $Lines"     # 8

echo

exit 0

# �±���Щ��������ű��Ľ��, �ű��ǲ����ߵ������. 

$ cat myfile.txt

Line 1.
Line 2.
Line 3.
Line 4.
Line 5.
Line 6.
Line 7.
Line 8.
