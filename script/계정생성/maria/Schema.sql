CREATE DATABASE IF NOT EXISTS `pss_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
CREATE USER 'pss'@'localhost' IDENTIFIED BY 'thsvlftkddjrakswkdwk0!029!6!526';
CREATE USER 'pss'@'%' IDENTIFIED BY 'thsvlftkddjrakswkdwk0!029!6!526';

GRANT ALL ON pss_db.* TO 'pss'@'localhost';
GRANT ALL ON pss_db.* TO 'pss'@'%';

FLUSH PRIVILEGES;