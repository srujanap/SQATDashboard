#! /bin/bash
export RAILS_ENV=production
DAEMON=unicorn
DAEMON_OPTS="-c /opt/usr/apps/sqat/Dashboard/Wrapper/config/unicorn.rb -E production  -D"
NAME=unicorn
PID=/opt/usr/apps/sqat/Dashboard/Wrapper/tmp/unicorn.pid

CD_TO_APP_DIR="cd /opt/usr/apps/sqat/Dashboard/Wrapper"
START_DAEMON_PROCESS="bundle exec $DAEMON $DAEMON_OPTS"

case "$1" in
  start)
        echo -n "Starting Dashboard App "
        $CD_TO_APP_DIR > /dev/null 2>&1 && $START_DAEMON_PROCESS
        echo "$NAME."
        ;;
  stop)
        echo -n "Stopping Dashboard App "
        kill -QUIT `cat $PID`
        echo "$NAME."
        ;;
  restart)
        echo -n "Restarting Dashboard App "
        kill -QUIT `cat $PID`
        echo -n "Stopped Dashboard App "
        $CD_TO_APP_DIR > /dev/null 2>&1 && $START_DAEMON_PROCESS
        echo -n "Started Dashboard App"
        echo "$NAME."
        ;;

  *)
        echo "Usage: $NAME {start|stop|restart}" >&2
        exit 1
        ;;
esac

exit 0
