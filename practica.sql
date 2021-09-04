# docker run --name=mysql1 --restart on-failure -d -p 3307:3306 -e MYSQL_ROOT_PASSWORD=12345 -e MYSQL_ROOT_HOST=% -e TZ=America/Guatemala -v "/home/ubuntu/practica1":"/practica1"  mysql



# Entrar a mysql para crear la base de datos
mysql -u root -p

# Creacion de base de datos
CREATE DATABASE DB_201807190;

USE DB_201807190;

# Creacion de tabla
CREATE TABLE IF NOT EXISTS Practica1(
	nombre VARCHAR(50),
	palabraSecreta VARCHAR(50)
);

mysqladmin -u root -p flush-logs


# Dia 1
mysql -uroot -p DB_201807190 < ./Carga2.sql
mysqldump -u root -p DB_201807190 > FB1_DB_201807190.sql
mysqladmin -u root -p flush-logs
mysqlbinlog /var/lib/mysql/binlog.000003 > I1_DB201807190.sql
mysql -uroot -p DB_201807190


# Dia 2
mysql -uroot -p DB_201807190 < ./Carga3.sql
mysqldump -u root -p DB_201807190 > FB2_DB_201807190.sql
mysqladmin -u root -p flush-logs
mysqlbinlog /var/lib/mysql/binlog.000004 > I2_DB201807190.sql
mysql -uroot -p DB_201807190


# Dia 3
mysql -uroot -p DB_201807190 < ./Carga4.sql
mysqldump -u root -p DB_201807190 > FB3_DB_201807190.sql
mysqladmin -u root -p flush-logs
mysqlbinlog /var/lib/mysql/binlog.000005 > I3_DB201807190.sql
mysql -uroot -p DB_201807190


# Dia 4
mysql -uroot -p DB_201807190 < ./Carga5.sql
mysqldump -u root -p DB_201807190 > FB4_DB_201807190.sql
mysqladmin -u root -p flush-logs
mysqlbinlog /var/lib/mysql/binlog.000006 > I4_DB201807190.sql
mysql -uroot -p DB_201807190


# Dia 5
mysql -uroot -p DB_201807190 < ./Carga1.sql
mysqldump -u root -p DB_201807190 > FB5_DB_201807190.sql
mysqladmin -u root -p flush-logs
mysqlbinlog /var/lib/mysql/binlog.000007 > I5_DB201807190.sql
mysql -uroot -p DB_201807190