#!/bin/bash
# ��֮ǰ��������ͬ, ����... 

#  - ѡ�����here docutment��˵, 
#+ <<-���������ĵ���ǰ�ߵ�tab, 
#+ ��*��*�ǿո�. 

cat &lt;&lt;-ENDOFMESSAGE
	This is line 1 of the message.
	This is line 2 of the message.
	This is line 3 of the message.
	This is line 4 of the message.
	This is the last line of the message.
ENDOFMESSAGE
# �ű��������ʱ����߽���ˢ��. 
# ����˵ÿ��ǰ�ߵ�tab��������ʾ. 

# �ϱ�5��"��Ϣ"��ǰ�߶���tab, �����ǿո�. 
# �ո��ǲ���<<-Ӱ���. 

# ע��, ���ѡ�����*Ƕ��*�м��tabû����. 

exit 0
