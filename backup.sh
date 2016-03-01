#!/bin/sh
datestr=`date +%Y%m%d`
backupdir=$HOME/docker/ttrss/backup

docker exec -i -t ttrssdb pg_dump ttrss > $backupdir/ttrss-dump-$datestr.sql
bzip2 $backupdir/ttrss-dump-$datestr.sql
