#!/bin/bash

# ֽ��: 
# ����4�˴���. 

UNPICKED=0
PICKED=1

DUPE_CARD=99

LOWER_LIMIT=0
UPPER_LIMIT=51
CARDS_IN_SUIT=13
CARDS=52

declare -a Deck
declare -a Suits
declare -a Cards
#  ʹ��һ��3ά������������3��һά��������������, 
#+ ���Ը�����ʵ��, ���ҿ������ӿɶ���. 
#  ������Bashδ���İ汾�ϻ�֧�ֶ�ά����. 


initialize_Deck ()
{
i=$LOWER_LIMIT
until [ "$i" -gt $UPPER_LIMIT ]
do
  Deck[i]=$UNPICKED   # ������"��"��ÿһ�Ŷ�����Ϊ���˳��Ƶ�״̬. 
  let "i += 1"
done
echo
}

initialize_Suits ()
{
Suits[0]=C #÷��
Suits[1]=D #����
Suits[2]=H #����
Suits[3]=S #����
}

initialize_Cards ()
{
Cards=(2 3 4 5 6 7 8 9 10 J Q K A)
# ��һ�ֳ�ʼ������ķ���. 
}

pick_a_card ()
{
card_number=$RANDOM
let "card_number %= $CARDS"
if [ "${Deck[card_number]}" -eq $UNPICKED ]
then
  Deck[card_number]=$PICKED
  return $card_number
else  
  return $DUPE_CARD
fi
}

parse_card ()
{
number=$1
let "suit_number = number / CARDS_IN_SUIT"
suit=${Suits[suit_number]}
echo -n "$suit-"
let "card_no = number % CARDS_IN_SUIT"
Card=${Cards[card_no]}
printf %-4s $Card
# ʹ�����������ʽ����ӡÿ����. 
}

seed_random ()  # ���������������. 
{               # �������ô��, �ᷢ��ʲô? 
seed=`eval date +%s`
let "seed %= 32766"
RANDOM=$seed
#  ���������ķ���
#+ �ܹ��������������ô? 
}

deal_cards ()
{
echo

cards_picked=0
while [ "$cards_picked" -le $UPPER_LIMIT ]
do
  pick_a_card
  t=$?

  if [ "$t" -ne $DUPE_CARD ]
  then
    parse_card $t

    u=$cards_picked+1
    # ������������Ϊ��1(����ע: ���鶼�Ǵ�0��ʼ������)��ʼ(��ʱ��). Ϊʲô? 
    let "u %= $CARDS_IN_SUIT"
    if [ "$u" -eq 0 ]   # ��Ƕ��if/then��������. 
    then
     echo
     echo
    fi
    # ����. 

    let "cards_picked += 1"
  fi  
done  

echo

return 0
}


# �ṹ�����: 
# �������е����������߼�ģ�黯. 

#================
seed_random
initialize_Deck
initialize_Suits
initialize_Cards
deal_cards
#================

exit 0



# ��ϰ1:
# ������ע������ű�. 

# ��ϰ2:
# ���һ������(����)���ջ�ɫ��ӡ��ÿ����. 
# �����ϲ��, ��������κ�����Ҫ��ӵĴ���. 

# ��ϰ3:
# �򻯲���˳�ű��߼�. 
