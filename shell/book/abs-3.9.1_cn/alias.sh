#!/bin/bash
# alias.sh

shopt -s expand_aliases
# �����������ѡ��, ����ű�����򿪱�������. 


# ����, ������Ȥ��. 
alias Jesse_James='echo "\"Alias Jesse James\" was a 1959 comedy starring Bob Hope."'
Jesse_James

echo; echo; echo;

alias ll="ls -l"
# ����ʹ�õ�����(')��˫����(")������һ������. 

echo "Trying aliased \"ll\":"
ll /usr/X11R6/bin/mk*   #* ����������. 

echo

directory=/usr/X11R6/bin/
prefix=mk*  # ��һ��ͨ����᲻�������鷳. 
echo "Variables \"directory\" + \"prefix\" = $directory$prefix"
echo

alias lll="ls -l $directory$prefix"

echo "Trying aliased \"lll\":"
lll         # ��ϸ�г�/usr/X11R6/binĿ¼��������mk��ͷ���ļ�. 
# �����ܴ������ӱ��� -- ����ͨ��� -- o.k. 




TRUE=1

echo

if [ TRUE ]
then
  alias rr="ls -l"
  echo "Trying aliased \"rr\" within if/then statement:"
  rr /usr/X11R6/bin/mk*   #* ����������Ϣ! 
  # ���������ڻ�Ͻṹ��ʹ��. 
  echo "However, previously expanded alias still recognized:"
  ll /usr/X11R6/bin/mk*
fi  

echo

count=0
while [ $count -lt 3 ]
do
  alias rrr="ls -l"
  echo "Trying aliased \"rrr\" within \"while\" loop:"
  rrr /usr/X11R6/bin/mk*   #* ����, ����Ҳ������չ. 
                           #  alias.sh: line 57: rrr: command not found
  let count+=1
done 

echo; echo

alias xyz='cat $0'   # �ű���ӡ��������. 
                     # ע���ǵ�����(ǿ����). 
xyz
#  ��ȻBash�ĵ�����, ��������������, 
#+ �������������ǿ������е�. 
#
#  Ȼ��, ����Steve Jacobson��ָ��������, 
#+ ����"$0"������չ�����������������. 

exit 0
