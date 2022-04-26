#! /bin/bash
# is-spammer.sh: ����һ�������ʼ���
                                                          
# $Id: is-spammer, v 1.4 2004/09/01 19:37:52 mszick Exp $
# �ϱ�������RCS ID��Ϣ.
#                                                         
#  ���Ǹ����о��׽ű�is_spammer.bash
#+ ��һ���򵥰汾.
                                                          
# is-spammer &lt;domain.name&gt;
                                                          
# ʹ���ⲿ����: 'dig'
# ���԰汾: 9.2.4rc5
                                                          
# ʹ�ú���. 
# ʹ��IFS�����������������е��ַ���. 
# ��һЩ���õ���: ���e-mail������. 

# ʹ�������ı����е�domain.name:
# http://www.good_stuff.spammer.biz/just_ignore_everything_else
#                       ^^^^^^^^^^^
# ����ʹ����������e-mail��ַ��domain.name: 
# Really_Good_Offer@spammer.biz
#                                                               
# ��������Ϊ����ű���Ψһ����.
#(��: ���Inet����Ӧ�ñ�֤���Ӻ�)
#                                                               
# ����, ���ϱ�����ʵ���е�������ű�:
#       is-spammer.sh spammer.biz


# Whitespace == :Space:Tab:Line Feed:Carriage Return:
WSP_IFS=$'\x20'$'\x09'$'\x0A'$'\x0D'

# No Whitespace == Line Feed:Carriage Return
No_WSP=$'\x0A'$'\x0D'

# ��ָ���Ϊ���10����ip��ַ
ADR_IFS=${No_WSP}'.'

# ȡ��dns�ı���Դ��¼. 
# get_txt &lt;error_code&gt; &lt;list_query&gt;
get_txt() {

    # ������"."�з����$1.
    local -a dns
    IFS=$ADR_IFS
    dns=( $1 )
    IFS=$WSP_IFS
    if [ "${dns[0]}" == '127' ]
    then
        # �鿴�˴��Ƿ���ԭ��.
        echo $(dig +short $2 -t txt)
    fi
}

# ȡ��dns��ַ��Դ��¼. 
# chk_adr &lt;rev_dns&gt; &lt;list_server&gt;
chk_adr() {
    local reply
    local server
    local reason

    server=${1}${2}
    reply=$( dig +short ${server} )

    # ����Ӧ�������һ�������� . . .
    if [ ${#reply} -gt 6 ]
    then
        reason=$(get_txt ${reply} ${server} )
        reason=${reason:-${reply}}
    fi
    echo ${reason:-' not blacklisted.'}
}

# ��Ҫ��������ȡ�� IP ��ַ.
echo 'Get address of: '$1
ip_adr=$(dig +short $1)
dns_reply=${ip_adr:-' no answer '}
echo ' Found address: '${dns_reply}

# һ�����õ�Ӧ��������4�����ּ���3����.
if [ ${#ip_adr} -gt 6 ]
then
    echo
    declare query

    # ͨ�����еķ�����з���. 
    declare -a dns
    IFS=$ADR_IFS
    dns=( ${ip_adr} )
    IFS=$WSP_IFS

    # ��8���Ʊ�ʾ����dns��ѯѭ���¼����. 
    rev_dns="${dns[3]}"'.'"${dns[2]}"'.'"${dns[1]}"'.'"${dns[0]}"'.'

# �鿴: http://www.spamhaus.org (��ͳ��ַ, ά���ĺܺ�)
    echo -n 'spamhaus.org says: '
    echo $(chk_adr ${rev_dns} 'sbl-xbl.spamhaus.org')

# �鿴: http://ordb.org (����ת��Open mail relay)
    echo -n '   ordb.org  says: '
    echo $(chk_adr ${rev_dns} 'relays.ordb.org')

# �鿴: http://www.spamcop.net/ (����������ﱨ��spammer)
    echo -n ' spamcop.net says: '
    echo $(chk_adr ${rev_dns} 'bl.spamcop.net')

# # # �����ĺ��������� # # #

# �鿴: http://cbl.abuseat.org.
    echo -n ' abuseat.org says: '
    echo $(chk_adr ${rev_dns} 'cbl.abuseat.org')

# �鿴: http://dsbl.org/usage (��ͬ���ʼ�ת��mail relay)
    echo
    echo 'Distributed Server Listings'
    echo -n '       list.dsbl.org says: '
    echo $(chk_adr ${rev_dns} 'list.dsbl.org')

    echo -n '   multihop.dsbl.org says: '
    echo $(chk_adr ${rev_dns} 'multihop.dsbl.org')

    echo -n 'unconfirmed.dsbl.org says: '
    echo $(chk_adr ${rev_dns} 'unconfirmed.dsbl.org')

else
    echo
    echo 'Could not use that address.'
fi

exit 0

# ��ϰ:
# -----

# 1) ���ű�����, 
#    ���������Ҫ�Ļ�, ����ʹ�ú��ʵĴ�����Ϣ�˳�.

# 2) �쿴��������ű���ʱ���Ƿ�����, 
#    ���������Ҫ�Ļ�, ����ʹ�ú��ʵĴ�����Ϣ�˳�.

# 3) ��һ��������滻��"Ӳ����"��BHL domain.

# 4) ͨ����'dig'����ʹ��"+time="ѡ��
#    ��������ű�����һ����ͣ.
