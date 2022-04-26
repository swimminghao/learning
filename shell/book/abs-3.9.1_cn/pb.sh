#!/bin/bash
# pb.sh: �绰��

# ��Rick Boivie��д, �Ѿ��õ�������Ȩ, �����ڱ�����ʹ��. 
# ������������һЩ�޸�. 

MINARGS=1     #  �ű�������Ҫһ������. 
DATAFILE=./phonebook
              #  ��ǰĿ¼��, 
              #+ ������һ������Ϊ"phonebook"�������ļ�. 
PROGNAME=$0
E_NOARGS=70   #  δ���ݲ�������. 

if [ $# -lt $MINARGS ]; then
      echo "Usage: "$PROGNAME" data"
      exit $E_NOARGS
fi      


if [ $# -eq $MINARGS ]; then
      grep $1 "$DATAFILE"
      # ����ļ�$DATAFILE������, 'grep'�ͻ��ӡһ��������Ϣ. 
else
      ( shift; "$PROGNAME" $* ) | grep $1
      # �ű��ݹ��������. 
fi

exit 0        #  �ű��ڴ��˳�. 
              #  ���, �����֮��, 
			  #+ ��ʹ����"#"��, Ҳ�������ע�ͺ�����. 

# ------------------------------------------------------------------------
"phonebook"�����ļ�������: 

John Doe        1555 Main St., Baltimore, MD 21228          (410) 222-3333
Mary Moe        9899 Jones Blvd., Warren, NH 03787          (603) 898-3232
Richard Roe     856 E. 7th St., New York, NY 10009          (212) 333-4567
Sam Roe         956 E. 8th St., New York, NY 10009          (212) 444-5678
Zoe Zenobia     4481 N. Baker St., San Francisco, SF 94338  (415) 501-1631
# ------------------------------------------------------------------------

$bash pb.sh Roe
Richard Roe     856 E. 7th St., New York, NY 10009          (212) 333-4567
Sam Roe         956 E. 8th St., New York, NY 10009          (212) 444-5678

$bash pb.sh Roe Sam
Sam Roe         956 E. 8th St., New York, NY 10009          (212) 444-5678

#  ������ű����ݵĲ���������һ��, 
#+ ������ű���*ֻ*���ӡ�������в�������. 
