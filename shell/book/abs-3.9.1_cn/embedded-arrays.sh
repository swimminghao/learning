#!/bin/bash
# embedded-arrays.sh
# Ƕ������ͼ������. 

# ���ű���Dennis Leeuw��д. 
# ������Ȩ, �ڱ�����ʹ��. 
# �����������������޸�. 


ARRAY1=(
        VAR1_1=value11
        VAR1_2=value12
        VAR1_3=value13
)

ARRAY2=(
        VARIABLE="test"
        STRING="VAR1=value1 VAR2=value2 VAR3=value3"
        ARRAY21=${ARRAY1[*]}
)       # ��ARRAY1Ƕ�׵����������. 

function print () {
        OLD_IFS="$IFS"
        IFS=$'\n'       #  ��ô����Ϊ��ÿ��
                        #+ ֻ��ӡһ������Ԫ��.
        TEST1="ARRAY2[*]"
        local ${!TEST1} # ɾ����һ��, �����ᷢ��ʲô? 
        #  �������. 
	#  ��ʹ��$TEST1
	#+ ֻ�ܹ��ں����ڱ�����. 


        #  �����ǿ������ܸɵ�ʲô. 
        echo
        echo "\$TEST1 = $TEST1"       #  �����Ǳ�������. 
        echo; echo
        echo "{\$TEST1} = ${!TEST1}"  #  ��������. 
                                      #  �����
                                      #+ ������õ�����. 
        echo
        echo "-------------------------------------------"; echo
        echo


        # ��ӡ����
        echo "Variable VARIABLE: $VARIABLE"
	
        # ��ӡһ���ַ���Ԫ��
        IFS="$OLD_IFS"
        TEST2="STRING[*]"
        local ${!TEST2}      # �������(ͬ��). 
        echo "String element VAR2: $VAR2 from STRING"

        # ��ӡһ������Ԫ��
        TEST2="ARRAY21[*]"
        local ${!TEST2}      # �������(ͬ��). 
        echo "Array element VAR1_1: $VAR1_1 from ARRAY21"
}

print
echo

exit 0

#   �ű�����ע, 
#+ "����Ժ����׵Ľ�����չ��һ���ܴ���hash��Bash�ű�." 
#   (��) �������ߵ���ϰ: ʵ����. 
