#!/bin/sh
# readpipe.sh
# �����������Bjon Eriksson����д��.

last="(null)"
cat $0 |
while read line
do
    echo "{$line}"
    last=$line
done
printf "\nAll done, last:$last\n"

exit 0  # �������.
        # �±��ǽű���(����)���.
        # 'echo'���˶���Ĵ�����.

#############################################

./readpipe.sh 

{#!/bin/sh}
{last="(null)"}
{cat $0 |}
{while read line}
{do}
{echo "{$line}"}
{last=$line}
{done}
{printf "nAll done, last:$lastn"}


All done, last:(null)

����(last)����������shell��, ��û�б����������. 
