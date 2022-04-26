#!/bin/bash
# dev-tcp.sh: ����/dev/tcp�ض��������Internet����. 

# ���ű���Troy Engel��д. 
# ������Ȩ�ڱ�����ʹ��. 
 
TCP_HOST=www.dns-diy.com   # һ����֪�Ķ������ʼ��Ѻõ�ISP. 
TCP_PORT=80                # �˿�80��http. 
  
# ��������. (��Щ��'ping' . . .) 
echo "HEAD / HTTP/1.0" >/dev/tcp/${TCP_HOST}/${TCP_PORT}
MYEXIT=$?

: &lt;&lt;EXPLANATION
If bash was compiled with --enable-net-redirections, it has the capability of
using a special character device for both TCP and UDP redirections. These
redirections are used identically as STDIN/STDOUT/STDERR. The device entries
are 30,36 for /dev/tcp:

  mknod /dev/tcp c 30 36

>From the bash reference:
/dev/tcp/host/port
    If host is a valid hostname or Internet address, and port is an integer
port number or service name, Bash attempts to open a TCP connection to the
corresponding socket.
EXPLANATION

   
if [ "X$MYEXIT" = "X0" ]; then
  echo "Connection successful. Exit code: $MYEXIT"
else
  echo "Connection unsuccessful. Exit code: $MYEXIT"
fi

exit $MYEXIT
