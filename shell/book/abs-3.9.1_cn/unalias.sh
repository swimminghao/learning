#!/bin/bash
# unalias.sh

shopt -s expand_aliases  # ���ñ�����չ. 

alias llm='ls -al | more'
llm

echo

unalias llm              # ɾ������.
llm
# ����������Ϣ, ��Ϊ'llm'�Ѿ�������Ч��. 

exit 0
