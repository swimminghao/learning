#!/bin/bash
# pick-card.sh

# ����һ����������ȡ�����Ԫ�ص�һ������.


# ��ȡһ����, �κ�һ��.

Suites="Clubs
Diamonds
Hearts
Spades"

Denominations="2
3
4
5
6
7
8
9
10
Jack
Queen
King
Ace"

# ע������Ķ���չ��.


suite=($Suites)                # ����һ������.
denomination=($Denominations)

num_suites=${#suite[*]}        # �����ж��ٸ�����Ԫ��.
num_denominations=${#denomination[*]}

echo -n "${denomination[$((RANDOM%num_denominations))]} of "
echo ${suite[$((RANDOM%num_suites))]}


# $bozo sh pick-cards.sh
# Jack of Clubs


# ��л, "jipe," ָ��$RANDOM������÷�.
exit 0
