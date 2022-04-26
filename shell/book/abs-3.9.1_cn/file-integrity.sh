#!/bin/bash
# file-integrity.sh: ���һ������Ŀ¼�µ��ļ�
#                    �Ƿ񱻸Ķ���. 

E_DIR_NOMATCH=70
E_BAD_DBFILE=71

dbfile=File_record.md5
# �洢��¼���ļ���(���ݿ��ļ�).


set_up_database ()
{
  echo ""$directory"" > "$dbfile"
  # ��Ŀ¼��д���ļ��ĵ�һ��. 
  md5sum "$directory"/* >> "$dbfile"
  # ���ļ��и���md5 checksum��filename. 
}

check_database ()
{
  local n=0
  local filename
  local checksum

  # ------------------------------------------- #
  #  ����ļ������ʵ�ǲ���Ҫ��,
  #+ �����ܸ���ȫһЩ.

  if [ ! -r "$dbfile" ]
  then
    echo "Unable to read checksum database file!"
    exit $E_BAD_DBFILE
  fi
  # ------------------------------------------- #

  while read record[n]
  do

    directory_checked="${record[0]}"
    if [ "$directory_checked" != "$directory" ]
    then
      echo "Directories do not match up!"
      # ����Ŀ¼��һ��. 
      exit $E_DIR_NOMATCH
    fi

    if [ "$n" -gt 0 ]   # ����Ŀ¼��. 
    then
      filename[n]=$( echo ${record[$n]} | awk '{ print $2 }' )
      #  md5sum���д��¼, 
      #+ ��дchecksum, Ȼ��дfilename. 
      checksum[n]=$( md5sum "${filename[n]}" )


      if [ "${record[n]}" = "${checksum[n]}" ]
      then
        echo "${filename[n]} unchanged."

      elif [ "`basename ${filename[n]}`" != "$dbfile" ]
             #  ����checksum���ݿ��ļ�, 
             #+ ��Ϊ��ÿ�ε��ýű������ᱻ�޸�. 
	     #  ---
	     #  �ⲻ�ҵ���ζ�ŵ�������$PWD����������ű�ʱ��, 
	     #+ �۸����checksum��
	     #+ �ݿ��ļ������ᱻ������. 
	     #  ��ϰ: �����������.
	then
          echo "${filename[n]} : CHECKSUM ERROR!"
        # ���ϴεļ��֮��, �ļ��Ѿ����޸�. 
      fi

      fi



    let "n+=1"
  done <"$dbfile"       # ��checksum���ݿ��ļ��ж�.  

}  

# =================================================== #
# main ()

if [ -z  "$1" ]
then
  directory="$PWD"      #  ���ûָ�������Ļ�, 
else                    #+ ��ô��ʹ�õ�ǰ�Ĺ���Ŀ¼. 
  directory="$1"
fi  

clear                   # ����.
echo " Running file integrity check on $directory"
echo

# ------------------------------------------------------------------ #
  if [ ! -r "$dbfile" ] # �Ƿ���Ҫ�������ݿ��ļ�? 
  then
    echo "Setting up database file, \""$directory"/"$dbfile"\"."; echo
    set_up_database
  fi  
# ------------------------------------------------------------------ #

check_database          # ������Ҫ������. 

echo 

#  ������������ű�������ض����ļ���, 
#+ ���������Ŀ¼���кܶ��ļ���ʱ��. 

exit 0

#  ���Ҫ�������ǳ�����ļ��������Լ��, 
#+ ���Կ���һ��"Tripwire"��,
#+ http://sourceforge.net/projects/tripwire/.

