#!/bin/bash
# ��/etc/fstab�ж���.

File=/etc/fstab

{
read line1
read line2
} < $File

echo "First line in $File is:"
echo "$line1"
echo
echo "Second line in $File is:"
echo "$line2"

exit 0

# ����, ����ô����ÿ�еķָ���?
# С��ʾ: ʹ��awk.
