CREATE DATABASE IF NOT EXISTS `` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
CREATE USER 'pss'@'localhost' IDENTIFIED BY '';
CREATE USER 'pss'@'%' IDENTIFIED BY '';

GRANT ALL ON pss_db.* TO 'pss'@'localhost';
GRANT ALL ON pss_db.* TO 'pss'@'%';

FLUSH PRIVILEGES;
