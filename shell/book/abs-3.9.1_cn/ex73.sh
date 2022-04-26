#!/bin/bash
# ����һ�������ļ�. 

ROOT_UID=0         # Root�û���$UIDΪ0. 
E_WRONG_USER=65    # ����root?

FILE=/swap
BLOCKSIZE=1024
MINBLOCKS=40
SUCCESS=0


# ����ű�������root���������. 
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo; echo "You must be root to run this script."; echo
  exit $E_WRONG_USER
fi  
  

blocks=${1:-$MINBLOCKS}          #  ���û����������ָ��, 
                                 #+ Ĭ������Ϊ40��. 
# �ϱ����ȼ���������������. 
# --------------------------------------------------
# if [ -n "$1" ]
# then
#   blocks=$1
# else
#   blocks=$MINBLOCKS
# fi
# --------------------------------------------------


if [ "$blocks" -lt $MINBLOCKS ]
then
  blocks=$MINBLOCKS              # ����Ҫ��40��. 
fi  


echo "Creating swap file of size $blocks blocks (KB)."
dd if=/dev/zero of=$FILE bs=$BLOCKSIZE count=$blocks  # ��������ļ�. 

mkswap $FILE $blocks             # ����ָ��Ϊ�����ļ�(����ע: ���Ϊ��������). 
swapon $FILE                     # ������ļ�. 

echo "Swap file created and activated."

exit $SUCCESS
