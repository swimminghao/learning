#!/bin/bash
# ind-ref.sh: ��ӱ�������.
# ����һ������һ������������Ϊ���ֵı�����ֵ.(����ע: ��ô�붼��˳)

a=letter_of_alphabet   # ����"a"��ֵ����һ������������. 
letter_of_alphabet=z

echo

# ֱ������.
echo "a = $a"          # a = letter_of_alphabet

# �������.
eval a=\$$a
echo "Now a = $a"      # ���� a = z

echo


# ����, �����������޸ĵڶ������õ�ֵ.

t=table_cell_3
table_cell_3=24
echo "\"table_cell_3\" = $table_cell_3"            # "table_cell_3" = 24
echo -n "dereferenced \"t\" = "; eval echo \$$t    # ������ "t" = 24
# ������򵥵�������, ����ı��ʽҲ����������ô(Ϊʲô?).
#         eval t=\$$t; echo "\"t\" = $t"

echo

t=table_cell_3
NEW_VAL=387
table_cell_3=$NEW_VAL
echo "Changing value of \"table_cell_3\" to $NEW_VAL."
echo "\"table_cell_3\" now $table_cell_3"
echo -n "dereferenced \"t\" now "; eval echo \$$t
# "eval" ������������ "echo" �� "\$$t" (��$table_cell_3�ȼ�)

echo

# (��л, Stephane Chazelas, �������ϱ�������Ϊ.)


# ��һ��������ʹ��${!t}����, ��"Bash, �汾2"С�ڵ�����.
# Ҳ��ο� ex78.sh.

exit 0
