#!/bin/bash
#  for-loopcmd.sh: ��[list]��forѭ��, 
#+ [list]���������滻��������.

NUMBERS="9 7 3 8 37.53"

for number in `echo $NUMBERS`  # for number in 9 7 3 8 37.53
do
  echo -n "$number "
done

echo 
exit 0
