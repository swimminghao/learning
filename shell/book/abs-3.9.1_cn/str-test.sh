#!/bin/bash
#  str-test.sh: ���null�ַ�����δ���õ��ַ���,
#+ but not strings and sealing wax, not to mention cabbages and kings . . .
#+ �������ַ����ͷ���, Ҳ��û���ᵽ���Ĳ˺͹���. . . ??? (û����, rojy bug)

# ʹ��   if [ ... ]


# ����ַ�����û�б���ʼ��, ��ô�������ֵδ����.
# ����״̬����Ϊ"null" (ע��������ֵ��ͬ).

if [ -n $string1 ]    # $string1 û�б������ͳ�ʼ��.
then
  echo "String \"string1\" is not null."
else  
  echo "String \"string1\" is null."
fi  
# ����Ľ��.
# ��ʾ$string1Ϊ��null, ��Ȼ���������û�б���ʼ��.


echo


# ����������һ��.

if [ -n "$string1" ]  # ���$string1��������������. 
then
  echo "String \"string1\" is not null."
else  
  echo "String \"string1\" is null."
fi                    # ע��һ��Ҫ�����õ��ַ��ŵ������Žṹ��!


echo


if [ $string1 ]       # ���, ��һ��$string1, ʲô������.
then
  echo "String \"string1\" is not null."
else  
  echo "String \"string1\" is null."
fi  
# ����������еķǳ���.
# [ ] ���Բ������ܹ��������string�Ƿ�Ϊnull.
# Ȼ��, ʹ��("$string1")��һ�ַǳ��õ�ϰ��.
#
# ����Stephane Chazelas��ָ����,
#    if [ $string1 ]    ֻ��һ������, "]"
#    if [ "$string1" ]  ����������, һ���ǿյ�"$string1", ��һ����"]" 



echo



string1=initialized

if [ $string1 ]       # ����, ����ֻ��$string1, ʲô������.
then
  echo "String \"string1\" is not null."
else  
  echo "String \"string1\" is null."
fi  
# ������һ��, ��������ȷ�Ľ��.
# ��ǿ��һ��, ʹ�����õ�("$string1")���Ǹ���һЩ, ԭ�������ϱ��Ѿ�˵����.


string1="a = b"

if [ $string1 ]       # ����, ����ֻ��$string1, ʲô������.
then
  echo "String \"string1\" is not null."
else  
  echo "String \"string1\" is null."
fi  
# δ���õ�"$string1", ��ظ����˴���Ľ��! 

exit 0
# Ҳ��лFlorian Wisser, �������������"���Ƕ�ı"������.
