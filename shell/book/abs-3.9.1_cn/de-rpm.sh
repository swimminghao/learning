#!/bin/bash
# de-rpm.sh: ���һ��'rpm'�鵵�ļ�

: ${1?"Usage: `basename $0` target-file"}
# ����ָ��'rpm'�鵵�ļ�����Ϊ����. 


TEMPFILE=$$.cpio                         # Tempfile������һ��"Ψһ"������.
                                         # $$������ű��Ľ���ID.
                                                                                 
rpm2cpio < $1 > $TEMPFILE                # ��rpm�鵵�ļ�ת��Ϊcpio�鵵�ļ�.
cpio --make-directories -F $TEMPFILE -i  # ���cpio�鵵�ļ�.
rm -f $TEMPFILE                          # ɾ��cpio�鵵�ļ�.

exit 0

#  ��ϰ:
#  ���һЩ���������    1) "target-file"�Ƿ����
#+                       2) ����ļ��Ƿ���һ��rpm�鵵�ļ�.
#  ��ʾ:                    ����'file'��������.
