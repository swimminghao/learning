#!/bin/bash
# unset.sh: Unset һ������.

variable=hello                       # ��ʼ��.
echo "variable = $variable"

unset variable                       # Unset.
                                     # �� variable= Ч����ͬ.
echo "(unset) variable = $variable"  # $variable ��Ϊ null.

exit 0
