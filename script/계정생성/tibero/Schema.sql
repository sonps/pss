CREATE TABLESPACE pss
DATAFILE  'pss.dbf' SIZE 512M 
AUTOEXTEND ON NEXT 10M MAXSIZE 1G 
EXTENT MANAGEMENT LOCAL AUTOALLOCATE;

CREATE USER pss IDENTIFIED BY thsvlftkddjrakswkdwk
DEFAULT TABLESPACE pss;

GRANT RESOURCE, CONNECT, DBA TO pss;

/* 
 * jdbc:tibero:thin:@pss01.com:8629:tibero
 * pss
 * thsvlftkddjrakswkdwk
 * 
 */