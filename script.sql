
# Creacion de base de datos
CREATE DATABASE DB_201807190;

USE DB_201807190;

# Creacion de tabla
CREATE TABLE IF NOT EXISTS Practica1(
	nombre VARCHAR(50),
	palabraSecreta VARCHAR(50)
);

# Insersion de datos
mysql -uroot -p DB_201807190 < ./Carga2.sql
mysql -uroot -p DB_201807190 < ./Carga3.sql
mysql -uroot -p DB_201807190 < ./Carga4.sql
mysql -uroot -p DB_201807190 < ./Carga5.sql
mysql -uroot -p DB_201807190 < ./Carga1.sql


# Eliminacion de base de datos
DROP DATABASE DB_201807190;

# Capturas de 
SELECT * FROM Practica1 LIMIT 5;
SELECT * from Practica1 ORDER BY nombre DESC LIMIT 5;

# Full backup
mysqldump -u root -p DB_201807190 > FB1_DB_201807190.sql
mysqldump -u root -p DB_201807190 > FB2_DB_201807190.sql
mysqldump -u root -p DB_201807190 > FB3_DB_201807190.sql
mysqldump -u root -p DB_201807190 > FB4_DB_201807190.sql
mysqldump -u root -p DB_201807190 > FB5_DB_201807190.sql

# Restauracion full backup
mysql -u root -p DB_201807190 < FB1_DB_201807190.sql
mysql -u root -p DB_201807190 < FB2_DB_201807190.sql
mysql -u root -p DB_201807190 < FB3_DB_201807190.sql
mysql -u root -p DB_201807190 < FB4_DB_201807190.sql
mysql -u root -p DB_201807190 < FB5_DB_201807190.sql

# Ejecucion de archivos en mysql
source ./FB1_DB_201807190.sql
source ./FB2_DB_201807190.sql
source ./FB3_DB_201807190.sql
source ./FB4_DB_201807190.sql
source ./FB5_DB_201807190.sql

# Flush logs incrementales
mysqladmin -u root -p flush-logs
flush logs;

# Pasar a un archivo SQL el contenido del binlog
# Tomar en cuenta el binlog.000003
mysqlbinlog /var/lib/mysql/binlog.000003 > I1_DB201807190.sql
mysqlbinlog /var/lib/mysql/binlog.000004 > I2_DB201807190.sql
mysqlbinlog /var/lib/mysql/binlog.000005 > I3_DB201807190.sql
mysqlbinlog /var/lib/mysql/binlog.000006 > I4_DB201807190.sql
mysqlbinlog /var/lib/mysql/binlog.000007 > I5_DB201807190.sql

# Restauracion incremental
mysqlbinlog /var/lib/mysql/binlog.000003 | mysql -u root -p DB_201807190
mysqlbinlog /var/lib/mysql/binlog.000004 | mysql -u root -p DB_201807190
mysqlbinlog /var/lib/mysql/binlog.000005 | mysql -u root -p DB_201807190
mysqlbinlog /var/lib/mysql/binlog.000006 | mysql -u root -p DB_201807190
mysqlbinlog /var/lib/mysql/binlog.000007 | mysql -u root -p DB_201807190

# Restauracion de los incrementales
mysql -u root -p DB_201807190 < I1_DB201807190.sql
mysql -u root -p DB_201807190 < I2_DB201807190.sql
mysql -u root -p DB_201807190 < I3_DB201807190.sql
mysql -u root -p DB_201807190 < I4_DB201807190.sql
mysql -u root -p DB_201807190 < I5_DB201807190.sql

# Ejecucion de archivos en mysql
source ./I1_DB201807190.sql
source ./I2_DB201807190.sql
source ./I3_DB201807190.sql
source ./I4_DB201807190.sql
source ./I5_DB201807190.sql


cd /var/lib/mysql
ls -lat
mysql -uroot -p