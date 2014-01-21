#/bin/bash

if [ ! -f /var/lib/mysql/installed ]; then

  mysql_install_db

  /usr/bin/mysqld_safe &
  sleep 10s

  echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED BY '$1' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

  killall mysqld
  touch /var/lib/mysql/installed
  sleep 10s
fi

/usr/bin/mysqld_safe
