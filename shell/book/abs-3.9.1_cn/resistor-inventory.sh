#!/bin/bash
# resistor-inventory.sh
# ʹ�ü�ӱ������õļ����ݿ�Ӧ��. 

# ============================================================== #
# ����

B1723_value=470                                   # ŷķ
B1723_powerdissip=.25                             # ����
B1723_colorcode="yellow-violet-brown"             # ��ɫ
B1723_loc=173                                     # λ��
B1723_inventory=78                                # ����

B1724_value=1000
B1724_powerdissip=.25
B1724_colorcode="brown-black-red"
B1724_loc=24N
B1724_inventory=243

B1725_value=10000
B1725_powerdissip=.25
B1725_colorcode="brown-black-orange"
B1725_loc=24N
B1725_inventory=89

# ============================================================== #


echo

PS3='Enter catalog number: '

echo

select catalog_number in "B1723" "B1724" "B1725"
do
  Inv=${catalog_number}_inventory
  Val=${catalog_number}_value
  Pdissip=${catalog_number}_powerdissip
  Loc=${catalog_number}_loc
  Ccode=${catalog_number}_colorcode

  echo
  echo "Catalog number $catalog_number:"
  echo "There are ${!Inv} of [${!Val} ohm / ${!Pdissip} watt] resistors in stock."
  echo "These are located in bin # ${!Loc}."
  echo "Their color code is \"${!Ccode}\"."

  break
done

echo; echo

# ��ϰ:
# -----
# 1) ��д�ű�, ʹ����ⲿ�ļ���ȡ����. 
# 2) ��д�ű�, 
#+   �������������ӱ�������, 
#    ��Ϊʹ���������, ���׶�. 


# ע:
# ---
#  ������򵥵����ݿ�Ӧ��, ��ʵ��, Shell�ű��������ʺ������ݿ�Ӧ��. 
#+ ��Ϊ��̫�����ڹ��������ͻ�������������. 
#  ���õİ취����ʹ��֧�����ݽṹ�ı�������, 
#+ ����C++����Java(��������������Perl). 

exit 0
