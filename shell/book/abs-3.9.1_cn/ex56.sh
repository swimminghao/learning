#!/bin/bash

# Shell������Էŵ�Perl�ű���ǰ��. 
echo "This precedes the embedded Perl script within \"$0\"."
echo "==============================================================="

perl -e 'print "This is an embedded Perl script.\n";'
# ������sed, PerlҲ����ʹ��"-e"ѡ��. 

echo "==============================================================="
echo "However, the script may also contain shell and system commands."

exit 0
