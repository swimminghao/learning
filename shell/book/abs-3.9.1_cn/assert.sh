#!/bin/bash
# assert.sh

assert ()                 #  �������Ϊfalse, 
{                         #+ ��ô�ʹ�ӡ������Ϣ���˳��ű�. 
  E_PARAM_ERR=98
  E_ASSERT_FAILED=99


  if [ -z "$2" ]          # ���ݽ����Ĳ�����������. 
  then
    return $E_PARAM_ERR   # ʲô��������return. 
  fi

  lineno=$2

  if [ ! $1 ] 
  then
    echo "Assertion failed:  \"$1\""
    echo "File \"$0\", line $lineno"
    exit $E_ASSERT_FAILED
  # else
  #   ����
  #   Ȼ�����ִ�нű����µĴ���. 
  fi  
}    


a=5
b=4
condition="$a -lt $b"     # ����������Ϣ���˳��ű�. 
                          #  ���԰����"����"�ŵ������ĵط�, 
                          #+ Ȼ�󿴿�������ʲô. 

assert "$condition" $LINENO
# ֻ����"assert"�ɹ�ʱ, �ű����µĴ���Ż����ִ��. 


# ������õ���������һЩ����. 
# ...
echo "This statement echoes only if the \"assert\" does not fail."
# ...
# ����Ҳ��������һЩ����. 

exit 0
