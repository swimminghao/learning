#!/bin/bash

# ��/var/log/messagesGenerates��β����ʼ
# ������ǰĿ¼�µ�һ��lof�ļ�.

# ע��: �������ű���һ��һ���û����õĻ�,
# /var/log/messages ������ȫ���ɶ���.
#         #root chmod 644 /var/log/messages

LINES=5

( date; uname -a ) >>logfile
# ʱ��ͻ�����
echo --------------------------------------------------------------------- >>logfile
tail -$LINES /var/log/messages | xargs |  fmt -s >>logfile
echo >>logfile
echo >>logfile

exit 0

#  ע��:
#  -----
#  �� Frank Wang ��ָ��,
#+ ��ԭ�ļ��е��κβ�ƥ�������(���������ź�˫����)
#+ �����xargs����鷳.
#                                                                             
#  ������ʹ���±ߵ��������滻�ϱߵĵ�15��:
#     tail -$LINES /var/log/messages | tr -d "\"'" | xargs | fmt -s >>logfile



#  ��ϰ:
#  -----
#  �޸�����ű�, ʹ������ű�ÿ��20����
#+ �͸���һ�� /var/log/messages ���޸ļ�¼.
#  ��ʾ: ʹ�� "watch" ����. 
