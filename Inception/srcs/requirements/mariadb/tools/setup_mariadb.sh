if [ ! -d "/var/lib/mysql/wordpress" ]; then
    apt-get install -y mariadb-server

    mysql_install_db
    service mysql start

    mysqladmin -u root password "${MYSQL_ROOT_PASSWORD}"

    mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS wordpress;"
    mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

    service mysql stop
fi
mysqld --bind-address=0.0.0.0


