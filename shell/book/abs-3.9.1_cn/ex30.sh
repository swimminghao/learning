#!/bin/bash

# δ������ĵ�ַ����

clear # ����.

echo "          Contact List"
echo "          ------- ----"
echo "Choose one of the following persons:" 
echo
echo "[E]vans, Roland"
echo "[J]ones, Mildred"
echo "[S]mith, Julie"
echo "[Z]ane, Morris"
echo

read person

case "$person" in
# ע��, �����Ǳ�""���õ�.

  "E" | "e" )
  # ���ܴ�д����Сд����.
  echo
  echo "Roland Evans"
  echo "4321 Floppy Dr."
  echo "Hardscrabble, CO 80753"
  echo "(303) 734-9874"
  echo "(303) 734-9892 fax"
  echo "revans@zzy.net"
  echo "Business partner & old friend"
  ;;
# ע��, ÿ��ѡ���߶�Ҫ��˫�ֺ�;;��β.

  "J" | "j" )
  echo
  echo "Mildred Jones"
  echo "249 E. 7th St., Apt. 19"
  echo "New York, NY 10009"
  echo "(212) 533-2814"
  echo "(212) 533-9972 fax"
  echo "milliej@loisaida.com"
  echo "Ex-girlfriend"
  echo "Birthday: Feb. 11"
  ;;

# ��ߵ� Smith �� Zane ����Ϣ�������ʡ����.

          * )
   # Ĭ��ѡ��.
   # ������(�ûس�RETURN), Ҳ����������. 
   echo
   echo "Not yet in database."
  ;;

esac

echo

#  ��ϰ:
#  -----
#  �޸�����ű�, �����ܹ����ܶ������,
#+ �����ܹ���ʾ�����ַ.

exit 0
