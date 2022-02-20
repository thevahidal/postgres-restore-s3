#! /bin/sh

set -e


if [ "${SCHEDULE}" = "**None**" ]; then
  echo $SCHEDULE

  sh restore.sh
else
  exec go-cron "$SCHEDULE" /bin/sh restore.sh
fi
