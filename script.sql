
# Creacion de base de datos
CREATE DATABASE DB_201807190;

USE DB_201807190;

# Creacion de tabla
CREATE TABLE IF NOT EXISTS Practica1(
	nombre VARCHAR(50),
	palabraSecreta VARCHAR(50)
);

# Flush logs incrementales
mysqladmin -u root -p flush-logs
flush logs;

# Eliminacion de base de datos
DROP DATABASE DB_201807190;

# Capturas de 
SELECT * FROM Practica1 LIMIT 5;
SELECT * from Practica1 ORDER BY nombre DESC LIMIT 5;

# Full backup
mysqldump -u root -p DB_201807190 > FB#_DB_201807190.sql

# Restauracion full backup
mysql -u root -p DB_201807190 < FB#_DB_201807190.sql

# Ejecucion de archivos en mysql
source ./FB#_DB_201807190.sql

# Restauracion incremental
mysqlbinlog binlog.0000000 | mysql -u root -b DB_201807190

cd /var/lib/mysql
ls -lat

# Pasar a un archivo SQL el contenido del binlog
mysqlbinlog binlog.0000000 > IncrementaID.sql
