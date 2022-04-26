#!/bin/bash
#  cvt.sh:
#  ��һ��Ŀ¼�µ�����MacPaint��ʽ��ͼƬ�ļ���ת��Ϊ"pbm"��ʽ��ͼƬ�ļ�. 

#  ʹ��"netpbm"���е�"macptopbm"�������ת��, 
#+ ���������Ҫ����Brian Henderson(bryanh@giraffe-data.com)��ά����.
#  Netpbm�������Linux���а�ı�׼�׼�. 

OPERATION=macptopbm
SUFFIX=pbm          # �µ��ļ�����׺.

if [ -n "$1" ]
then
  directory=$1      # ���Ŀ¼����Ϊ�������ݸ��ű�...
else
  directory=$PWD    # ����ʹ�õ�ǰ�Ĺ���Ŀ¼.
fi  
  
#  �ٶ�Ŀ��Ŀ¼�е������ļ�����MacPaint��ʽ��ͼ���ļ�, 
#+ ���Ҷ�����".mac"��Ϊ�ļ�����׺. 

for file in $directory/*    # �ļ���ƥ��(filename globbing).
do
  filename=${file%.*c}      #  ȥ���ļ�����".mac"��׺
                            #+ ('.*c' ����ƥ��
			    #+ '.'��'c'֮�������ַ���).
  $OPERATION $file > "$filename.$SUFFIX"
                            # �ѽ���ض����µ��ļ���.
  rm -f $file               # ת����ɾ��ԭʼ�ļ�.
  echo "$filename.$SUFFIX"  # ��stdout���ת�����ļ����ļ���.
done

exit 0

# ��ϰ:
# -----
#  ���������ڵ�����, ����ű��ѵ�ǰ
#+ Ŀ¼�µ������ļ���ת����.
#  �޸�����ű�, ����ֻת����".mac"Ϊ��׺�����ļ�.
