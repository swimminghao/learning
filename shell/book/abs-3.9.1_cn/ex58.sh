#!/bin/bash

#  ��һ��"tarball"��(����tar��gzip��������ļ�)
#+ �������24Сʱ��ǰĿ¼��d�����޸ĵ��ļ�. 

BACKUPFILE=backup-$(date +%m-%d-%Y)
#                 �ڱ����ļ���Ƕ��ʱ��.
#                 Thanks, Joshua Tschida, for the idea.
archive=${1:-$BACKUPFILE}
#  �������������û��ָ�������ļ����ļ���,
#+ ��ô��Ĭ��ʹ��"backup-MM-DD-YYYY.tar.gz".

tar cvf - `find . -mtime -1 -type f -print` > $archive.tar
gzip $archive.tar
echo "Directory $PWD backed up in archive file \"$archive.tar.gz\"."


#  Stephane Chazelasָ���ϱߴ���,
#+ ����ڷ���̫����ļ���ʱ��, ����������ļ�
#+ �������ո��ʱ��, ��ִ��ʧ��.

# Stephane Chazelas����ʹ���±ߵ����ִ���֮һ:
# -------------------------------------------------------------------
#   find . -mtime -1 -type f -print0 | xargs -0 tar rvf "$archive.tar"
#      ʹ��gnu�汾��"find".


#   find . -mtime -1 -type f -exec tar rvf "$archive.tar" '{}' \;
#         ������������UNIX������ֲ, ���ǱȽ���.
# -------------------------------------------------------------------


exit 0
