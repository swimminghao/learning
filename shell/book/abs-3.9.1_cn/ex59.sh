#!/bin/bash

JUST_A_SECOND=1

funky ()
{ # ����һ����򵥵ĺ���. 
  echo "This is a funky function."
  echo "Now exiting funky function."
} # ���������ڵ���ǰ����. 


fun ()
{ # һ����΢����һЩ�ĺ���. 
  i=0
  REPEATS=30

  echo
  echo "And now the fun really begins."
  echo

  sleep $JUST_A_SECOND    # ��, ��ͣһ��! 
  while [ $i -lt $REPEATS ]
  do
    echo "----------FUNCTIONS---------->"
    echo "<------------ARE-------------"
    echo "<------------FUN------------>"
    echo
    let "i+=1"
  done
}

  # ����, ��������������. 

funky
fun

exit 0
