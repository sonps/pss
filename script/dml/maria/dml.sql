INSERT INTO pss_system
(sys_cd, sys_nm, par_cd)
VALUES('meister', '마이스터', NULL);

INSERT INTO pss_ip_check
(allw_yn, ip1, ip2, ip3, ip4, ip5, ip6, remk, sys_cd)
VALUES('Y', '*', '*', '*', '*', '*', '*', 'meister', 'meister');