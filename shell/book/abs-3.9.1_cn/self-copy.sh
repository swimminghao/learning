#!/bin/bash
# self-copy.sh

# ����ű��´������. 

file_subscript=copy

dd if=$0 of=$0.$file_subscript 2>/dev/null
# ��ֹdd��������Ϣ:            ^^^^^^^^^^^

exit $?
