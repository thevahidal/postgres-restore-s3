#! /bin/sh

set -e

dump_sql_gz="dump.sql.gz"
dump_sql="dump.sql"

if [ -f "$dump_sql_gz" ]; then
  echo "Removing previous dump file ($dump_sql_gz)"
  rm "$dump_sql_gz"
fi

if [ -f "$dump_sql" ]; then
  echo "Removing previous dump file ($dump_sql)"
  rm "$dump_sql"
fi

if [ "${SCHEDULE}" = "**None**" ]; then
  echo $SCHEDULE

  sh restore.sh
else
  exec go-cron "$SCHEDULE" /bin/sh restore.sh
fi
