#!/bin/bash

var1=abcd-1234-defg
echo "var1 = $var1"

t=${var1#*-*}
echo "var1 (with everything, up to and including first - stripped out) = $t"
#  t=${var1#*-}  Ҳһ��,
#+ ��Ϊ#ƥ����̵��ַ���,
#+ ͬʱ*ƥ������ǰ׺, �������ַ���. 
# (��л, Stephane Chazelas, ָ�����.)

t=${var1##*-*}
echo "If var1 contains a \"-\", returns empty string...   var1 = $t"


t=${var1%*-*}
echo "var1 (with everything from the last - on stripped out) = $t"

echo

# -------------------------------------------
path_name=/home/bozo/ideas/thoughts.for.today
# -------------------------------------------
echo "path_name = $path_name"
t=${path_name##/*/}
echo "path_name, stripped of prefixes = $t"
# �����������, ��	t=`basename $path_name`		Ч����ͬ. 
#  t=${path_name%/}; t=${t##*/}   �Ǹ�һ��Ľ������.
#+ ����ʱ���ǻ�ʧ��.
#  ���$path_name��һ�����з���β�Ļ�, ��ô	`basename $path_name` �Ͳ�������������,
#+ �����ϱߵı��ʽ����.
# (��л, S.C.)

t=${path_name%/*.*}
# ��	t=`dirname $path_name`	Ч����ͬ.
echo "path_name, stripped of suffixes = $t"
# ��ĳЩ����½�ʧЧ, ���� "../", "/foo////", # "foo/", "/".
#  ɾ����׺, ��������basenameû�к�׺�������,
#+ ����dirname����, ������ͬʱҲʹ���⸴�ӻ���.
# (��л, S.C.)

echo

t=${path_name:11}
echo "$path_name, with first 11 chars stripped off = $t"
t=${path_name:11:5}
echo "$path_name, with first 11 chars stripped off, length 5 = $t"

echo

t=${path_name/bozo/clown}
echo "$path_name with \"bozo\" replaced  by \"clown\" = $t"
t=${path_name/today/}
echo "$path_name with \"today\" deleted = $t"
t=${path_name//o/O}
echo "$path_name with all o's capitalized = $t"
t=${path_name//o/}
echo "$path_name with all o's deleted = $t"

exit 0
