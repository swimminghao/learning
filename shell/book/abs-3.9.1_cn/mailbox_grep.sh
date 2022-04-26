#!/bin/bash
#  ��Francisco Lobo���ṩ�Ľű�, 
#+ �������߽����������޸ĺ�ע��. 
#  ���Ҿ�����Ȩ, ����ʹ���ڱ�����.(��л��!)

# ����ű����������ڱ�Bash version 3.0���͵İ汾��. 


E_MISSING_ARG=67
if [ -z "$1" ]
then
  echo "Usage: $0 mailbox-file"
  exit $E_MISSING_ARG
fi

mbox_grep()  # ���������ļ�.
{
    declare -i body=0 match=0
    declare -a date sender
    declare mail header value


    while IFS= read -r mail
#         ^^^^                 ��������$IFS.
#  ����"read"������������н�ȥ��ͷ�ͽ�β�Ŀո�. 

   do
       if [[ $mail =~ "^From " ]]   # ƥ����Ϣ�е�"From"��. 
       then
          (( body  = 0 ))           # ȡ��("Zero out"ٵ��)����. 
          (( match = 0 ))
          unset date

       elif (( body ))
       then
            (( match ))
            # echo "$mail"
            # ���������ʾ������Ϣ��Ļ�, ��ô�ʹ������ע����. 

       elif [[ $mail ]]; then
          IFS=: read -r header value <<< "$mail"
          #                          ^^^  "here string"

          case "$header" in
          [Ff][Rr][Oo][Mm] ) [[ $value =~ "$2" ]] && (( match++ )) ;;
          # ƥ��"From"��. 
          [Dd][Aa][Tt][Ee] ) read -r -a date <<< "$value" ;;
          #                                  ^^^
          # ƥ��"Date"��. 
          [Rr][Ee][Cc][Ee][Ii][Vv][Ee][Dd] ) read -r -a sender <<< "$value" ;;
          #                                                    ^^^
          # ƥ��IP��ַ(���ܱ���ƭ). 
          esac

       else
          (( body++ ))
          (( match  )) &&
          echo "MESSAGE ${date:+of: ${date[*]} }"
       #    ����$date����                  ^
          echo "IP address of sender: ${sender[1]}"
       #    "Received"�еĵڶ�����             ^

       fi


    done < "$1" # ���ļ���stdout�ض���ѭ����. 
}


mbox_grep "$1"  # �������ļ����͵�������. 

exit $?

# ��ϰ:
# -----
# 1) ��������������, �����ֳɶ������, 
#+   ����������ߴ���Ŀɶ���. 
# 2) ������ű���Ӷ���ķ���, ���Է�����ͬ�Ĺؼ���. 



$ mailbox_grep.sh scam_mail
--> MESSAGE of Thu, 5 Jan 2006 08:00:56 -0500 (EST) 
--> IP address of sender: 196.3.62.4
