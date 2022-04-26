#!/bin/bash
# array-strops.sh: ����������ַ�������. 
# ���ű���Michael Zick����д. 
# ��Ȩʹ���ڱ�����. 

#  һ����˵, �κ�������${name ... }(������ʽ)���ַ�������
#+ ���ܹ�Ӧ���������е������ַ���Ԫ��, 
#+ ����˵${name[@] ... }��${name[*] ...}��������ʽ. 


arrayZ=( one two three four five five )

echo

# ��ȡβ�����Ӵ�
echo ${arrayZ[@]:0}     # one two three four five five
                        # ����Ԫ��. 

echo ${arrayZ[@]:1}     # two three four five five
                        # element[0]��ߵ�����Ԫ��. 

echo ${arrayZ[@]:1:2}   # two three
                        # ֻ��ȡelement[0]��ߵ�����Ԫ��. 

echo "-----------------------"

#  �Ӵ�ɾ��
#  ���ַ����Ŀ�ͷɾ����̵�ƥ��, 
#+ ƥ����Ӵ�Ҳ������������ʽ. 

echo ${arrayZ[@]#f*r}   # one two three five five
                        # ƥ�佫Ӧ�������������Ԫ��. 
                        # ƥ�䵽��"four", ���ҽ���ɾ��. 

# ���ַ����Ŀ�ͷɾ�����ƥ��
echo ${arrayZ[@]##t*e}  # one two four five five
                        # ƥ�佫Ӧ�������������Ԫ��. 
                        # ƥ�䵽��"three", ���ҽ���ɾ��. 

# ���ַ����Ľ�βɾ����̵�ƥ��
echo ${arrayZ[@]%h*e}   # one two t four five five
                        # ƥ�佫Ӧ�������������Ԫ��. 
                        # ƥ�䵽��"hree", ���ҽ���ɾ��. 

# ���ַ����Ľ�βɾ�����ƥ��
echo ${arrayZ[@]%%t*e}  # one two four five five
                        # ƥ�佫Ӧ�������������Ԫ��. 
                        # ƥ�䵽��"three", ���ҽ���ɾ��. 

echo "-----------------------"

# �Ӵ��滻

# ��һ��ƥ�䵽���Ӵ����ᱻ�滻
echo ${arrayZ[@]/fiv/XYZ}   # one two three four XYZe XYZe
                            # ƥ�佫Ӧ�������������Ԫ��. 

# ����ƥ�䵽���Ӵ����ᱻ�滻
echo ${arrayZ[@]//iv/YY}    # one two three four fYYe fYYe
                            # ƥ�佫Ӧ�������������Ԫ��. 

# ɾ�����е�ƥ���Ӵ�
# ���û��ָ���滻�ַ����Ļ�, �Ǿ���ζ��'ɾ��'
echo ${arrayZ[@]//fi/}      # one two three four ve ve
                            # ƥ�佫Ӧ�������������Ԫ��. 

# �滻�ַ���ǰ���Ӵ�
echo ${arrayZ[@]/#fi/XY}    # one two three four XYve XYve
                            # ƥ�佫Ӧ�������������Ԫ��. 

# �滻�ַ�������Ӵ�
echo ${arrayZ[@]/%ve/ZZ}    # one two three four fiZZ fiZZ
                            # ƥ�佫Ӧ�������������Ԫ��. 

echo ${arrayZ[@]/%o/XX}     # one twXX three four five five
                            # Ϊʲô? 

echo "-----------------------"


# �ڽ������Ľ�����͵�awk(���������Ĵ�����)֮ǰ --
# ����һ��:
#   $( ... )�������滻. 
#   ������Ϊ�ӽ�������. 
#   ������������stdout. 
#   ��read����ȡ������stdout. 
#   ʹ��name[@]��ʾ��ָ����һ��"for-each"����. 

newstr() {
    echo -n "!!!"
}

echo ${arrayZ[@]/%e/$(newstr)}
# on!!! two thre!!! four fiv!!! fiv!!!
# Q.E.D: �滻����ʵ������һ��'��ֵ'. 

#  ʹ��"For-Each"��ʽ��
echo ${arrayZ[@]//*/$(newstr optional_arguments)}
#  ����, ���Bashֻ��ƥ�䵽���Ӵ���Ϊ$0
#+ ���ݸ��������õĺ��� . . .

echo

exit 0
