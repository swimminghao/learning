#!/bin/bash
# list-glob.sh: ʹ��"globbing", ��forѭ���в���[list]

echo

for file in *
#           ^  �ڱ��ʽ��ʶ���ļ���ƥ��ʱ,
#+             Bash��ִ���ļ�����չ.
do
  ls -l "$file"  # �г���$PWD(��ǰĿ¼)�е������ļ�.
  #  ����һ��,ͨ���"*"�ܹ�ƥ�������ļ�,
  #+ Ȼ��,��"globbing"��,�ǲ��ܱ���"."�ļ���.

  #  ���ûƥ�䵽�κ��ļ�,��������չ���Լ�.
  #  Ϊ�˲��������������,�Ǿ�����nullglobѡ��
  #+   (shopt -s nullglob).
  #  ��л, S.C.
done

echo; echo

for file in [jx]*
do
  rm -f $file    # ֻɾ����ǰĿ¼����"j"��"x"��ͷ���ļ�.
  echo "Removed file \"$file\"".
done

echo

exit 0
