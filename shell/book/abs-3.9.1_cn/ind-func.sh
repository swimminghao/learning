#!/bin/bash
# ind-func.sh: ��һ��������ô��ݸ�����. 

echo_var ()
{
echo "$1"
}

message=Hello
Hello=Goodbye

echo_var "$message"        # Hello
# ���ڣ������Ǵ���һ��������ø�����. 
echo_var "${!message}"     # Goodbye

echo "-------------"

# ������Ǹı�"hello"������ֵ�ᷢ��ʲô? 
Hello="Hello, again!"
echo_var "$message"        # Hello
echo_var "${!message}"     # Hello, again!

exit 0
