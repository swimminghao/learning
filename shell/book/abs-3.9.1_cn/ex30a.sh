#!/bin/bash
# ex30a.sh: �ű�ex30.sh��"��ɫ"�汾. 
#            û���ӹ�������ĵ�ַ���ݿ�


clear                                   # ����. 

echo -n "          "
echo -e '\E[37;44m'"\033[1mContact List\033[0m"
                                        # ����ɫ�����µİ�ɫ. 
echo; echo
echo -e "\033[1mChoose one of the following persons:\033[0m"
                                        # ����
tput sgr0
echo "(Enter only the first letter of name.)"
echo
echo -en '\E[47;34m'"\033[1mE\033[0m"   # ��ɫ
tput sgr0                               # ����ɫ����Ϊ"����". 
echo "vans, Roland"                     # "[E]vans, Roland"
echo -en '\E[47;35m'"\033[1mJ\033[0m"   # ����ɫ
tput sgr0
echo "ones, Mildred"
echo -en '\E[47;32m'"\033[1mS\033[0m"   # ��ɫ
tput sgr0
echo "mith, Julie"
echo -en '\E[47;31m'"\033[1mZ\033[0m"   # ��ɫ
tput sgr0
echo "ane, Morris"
echo

read person

case "$person" in
# ע��, ����������������. 

  "E" | "e" )
  # ��Сд�����붼�ܽ���. 
  echo
  echo "Roland Evans"
  echo "4321 Floppy Dr."
  echo "Hardscrabble, CO 80753"
  echo "(303) 734-9874"
  echo "(303) 734-9892 fax"
  echo "revans@zzy.net"
  echo "Business partner & old friend"
  ;;

  "J" | "j" )
  echo
  echo "Mildred Jones"
  echo "249 E. 7th St., Apt. 19"
  echo "New York, NY 10009"
  echo "(212) 533-2814"
  echo "(212) 533-9972 fax"
  echo "milliej@loisaida.com"
  echo "Girlfriend"
  echo "Birthday: Feb. 11"
  ;;

# �Ժ�ΪSmith & Zane�����Ϣ. 

          * )
   # Ĭ��ѡ��. 	  
   # ������(ֱ�Ӱ��س�)Ҳ�����ⱻƥ��. 
   echo
   echo "Not yet in database."
  ;;

esac

tput sgr0                               # ����ɫ����Ϊ"����". 

echo

exit 0
