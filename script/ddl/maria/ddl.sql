-- 시스템
DROP TABLE IF EXISTS pss_system RESTRICT;

-- 시스템
CREATE TABLE pss_system (
	sys_cd          VARCHAR(50)       NOT NULL COMMENT '시스템코드', -- 시스템코드
	sys_nm          VARCHAR(100)      NOT NULL COMMENT '시스템명', -- 시스템명
	par_cd          VARCHAR(50)       NULL     COMMENT '상위코드', -- 상위코드
	sys_vs          VARCHAR(20)       NULL     DEFAULT '1.0.0' COMMENT '시스템버전', -- 시스템버전
	reg_dt          DATETIME          NULL     DEFAULT CURRENT_TIMESTAMP COMMENT '등록일시', -- 등록일시
	mod_dt          DATETIME          NULL     DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시', -- 수정일시
	end_date        VARCHAR(8)        NULL     COMMENT '종료일자', -- 종료일자
	enc_val         VARCHAR(200)      NULL     COMMENT '암호화값', -- 암호화값
	login_fail_cnt  SMALLINT UNSIGNED NULL     DEFAULT 0 COMMENT '로그인실패제한수', -- 로그인실패제한수
	multi_login_at  CHAR(1)           NULL     DEFAULT 'Y' COMMENT '다중로그인여부', -- 다중로그인여부
	auto_logout_min SMALLINT UNSIGNED NULL     DEFAULT 0 COMMENT '자동로그아웃분', -- 자동로그아웃분
	use_at          CHAR(1)           NULL     DEFAULT 'Y' COMMENT '사용여부' -- 사용여부
)
DEFAULT CHARACTER SET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_unicode_ci'
ENGINE = InnoDB
COMMENT '시스템';

-- 시스템
ALTER TABLE pss_system
	ADD CONSTRAINT PK_pss_system -- 시스템 기본키
		PRIMARY KEY (
			sys_cd -- 시스템코드
		);

-- ========================================================================================================================================
		
-- 시스템 로그
DROP TABLE IF EXISTS pss_system_log RESTRICT;

-- 시스템 로그
CREATE TABLE pss_system_log (
	log_id      BIGINT UNSIGNED NOT NULL COMMENT '로그 아이디', -- 로그 아이디
	reg_dt      DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시', -- 생성일시
	user_id     VARCHAR(500)    NULL     DEFAULT 'GUEST' COMMENT '사용자 아이디', -- 사용자 아이디
	user_nm     VARCHAR(500)    NULL     DEFAULT '게스트' COMMENT '사용자명', -- 사용자명
	user_ip     VARCHAR(50)     NULL     COMMENT '사용자 아이피', -- 사용자 아이피
	req_url     VARCHAR(500)    NULL     COMMENT '요청 URL', -- 요청 URL
	class_nm    VARCHAR(500)    NULL     COMMENT '클래스명', -- 클래스명
	method_nm   VARCHAR(500)    NOT NULL COMMENT '메소드명', -- 메소드명
	args        TEXT            NULL     COMMENT '아규먼트', -- 아규먼트
	crud        VARCHAR(10)     NULL     COMMENT 'CRUD', -- CRUD
	elapse_time DECIMAL(10,5)   NULL     COMMENT '경과시간', -- 경과시간
	user_nation VARCHAR(50)     NULL     COMMENT '국가', -- 국가
	sys_cd      VARCHAR(50)     NOT NULL COMMENT '시스템코드' -- 시스템코드
)
DEFAULT CHARACTER SET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_unicode_ci'
ENGINE = InnoDB
COMMENT '시스템 로그';

-- 시스템 로그
ALTER TABLE pss_system_log
	ADD CONSTRAINT PK_pss_system_log -- 시스템 로그 기본키
		PRIMARY KEY (
			log_id -- 로그 아이디
		);

ALTER TABLE pss_system_log
	MODIFY COLUMN log_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '로그 아이디';

-- 시스템 로그
ALTER TABLE pss_system_log
	ADD CONSTRAINT FK_pss_system_TO_pss_system_log -- 시스템 -> 시스템 로그
		FOREIGN KEY (
			sys_cd -- 시스템코드
		)
		REFERENCES pss_system ( -- 시스템
			sys_cd -- 시스템코드
		);		
		
-- ========================================================================================================================================

-- 접속카운트
DROP TABLE IF EXISTS pss_access_cnt RESTRICT;

-- 접속카운트
CREATE TABLE pss_access_cnt (
	ac_idx     BIGINT UNSIGNED NOT NULL COMMENT '순번', -- 순번
	access_dt  DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '접속일시', -- 접속일시
	hit_cnt    BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '히트수', -- 히트수
	session_id VARCHAR(200)    NOT NULL COMMENT '세션_아이디', -- 세션_아이디
	sys_cd     VARCHAR(50)     NULL     COMMENT '시스템코드' -- 시스템코드
)
DEFAULT CHARACTER SET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_unicode_ci'
ENGINE = InnoDB
COMMENT '접속카운트';

-- 접속카운트
ALTER TABLE pss_access_cnt
	ADD CONSTRAINT PK_pss_access_cnt -- 접속카운트 기본키
		PRIMARY KEY (
			ac_idx -- 순번
		);

ALTER TABLE pss_access_cnt
	MODIFY COLUMN ac_idx BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '순번';

-- 접속카운트
ALTER TABLE pss_access_cnt
	ADD CONSTRAINT FK_pss_system_TO_pss_access_cnt -- 시스템 -> 접속카운트
		FOREIGN KEY (
			sys_cd -- 시스템코드
		)
		REFERENCES pss_system ( -- 시스템
			sys_cd -- 시스템코드
		);		
		
-- ========================================================================================================================================

-- 아이피체크
DROP TABLE IF EXISTS pss_ip_check RESTRICT;
		
-- 아이피체크
CREATE TABLE pss_ip_check (
	idx      BIGINT UNSIGNED NOT NULL COMMENT '순번', -- 순번
	allw_yn  VARCHAR(1)      NOT NULL DEFAULT 'Y' COMMENT '허용여부', -- 허용여부
	ip1      VARCHAR(3)      NULL     DEFAULT '*' COMMENT 'IP1', -- IP1
	ip2      VARCHAR(3)      NULL     DEFAULT '*' COMMENT 'IP2', -- IP2
	ip3      VARCHAR(3)      NULL     DEFAULT '*' COMMENT 'IP3', -- IP3
	ip4      VARCHAR(3)      NULL     DEFAULT '*' COMMENT 'IP4', -- IP4
	ip5      VARCHAR(3)      NULL     DEFAULT '*' COMMENT 'IP5', -- IP5
	ip6      VARCHAR(3)      NULL     DEFAULT '*' COMMENT 'IP6', -- IP6
	remk     VARCHAR(255)    NULL     COMMENT '비고', -- 비고
	use_at   VARCHAR(1)      NULL     DEFAULT 'Y' COMMENT '사용여부', -- 사용여부
	reg_user VARCHAR(50)     NULL     COMMENT '작성자', -- 작성자
	reg_dt   DATETIME        NULL     DEFAULT CURRENT_TIMESTAMP COMMENT '작성일시', -- 작성일시
	mod_user VARCHAR(50)     NULL     COMMENT '수정자', -- 수정자
	mod_dt   DATETIME        NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시', -- 수정일시
	sys_cd   VARCHAR(50)     NOT NULL COMMENT '시스템코드' -- 시스템코드
)
DEFAULT CHARACTER SET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_unicode_ci'
ENGINE = InnoDB
COMMENT '아이피체크';

-- 아이피체크
ALTER TABLE pss_ip_check
	ADD CONSTRAINT PK_pss_ip_check -- 아이피체크 기본키
		PRIMARY KEY (
			idx -- 순번
		);

ALTER TABLE pss_ip_check
	MODIFY COLUMN idx BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '순번';

-- 아이피체크
ALTER TABLE pss_ip_check
	ADD CONSTRAINT FK_pss_system_TO_pss_ip_check -- 시스템 -> 아이피체크
		FOREIGN KEY (
			sys_cd -- 시스템코드
		)
		REFERENCES pss_system ( -- 시스템
			sys_cd -- 시스템코드
		);
		
-- ========================================================================================================================================

-- 프로그램목록
DROP TABLE IF EXISTS pss_program RESTRICT;

-- 프로그램목록
CREATE TABLE pss_program (
	pg_id        BIGINT UNSIGNED NOT NULL COMMENT '프로그램 아이디', -- 프로그램 아이디
	pg_file_nm   VARCHAR(50)     NULL     COMMENT '프로그램 파일명', -- 프로그램 파일명
	pg_save_path VARCHAR(200)    NULL     COMMENT '프로그램 저장경로', -- 프로그램 저장경로
	pg_nm        VARCHAR(50)     NULL     COMMENT '프로그램 명', -- 프로그램 명
	pg_dc        VARCHAR(300)    NULL     COMMENT '프로그램 설명', -- 프로그램 설명
	pg_url       VARCHAR(500)    NULL     COMMENT '프로그램 URL', -- 프로그램 URL
	use_at       VARCHAR(1)      NULL     DEFAULT 'Y' COMMENT '사용여부', -- 사용여부
	sys_cd       VARCHAR(50)     NULL     COMMENT '시스템코드' -- 시스템코드
)
DEFAULT CHARACTER SET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_unicode_ci'
ENGINE = InnoDB
COMMENT '프로그램목록';

-- 프로그램목록
ALTER TABLE pss_program
	ADD CONSTRAINT PK_pss_program -- 프로그램목록 기본키
		PRIMARY KEY (
			pg_id -- 프로그램 아이디
		);

ALTER TABLE pss_program
	MODIFY COLUMN pg_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '프로그램 아이디';

-- 프로그램목록
ALTER TABLE pss_program
	ADD CONSTRAINT FK_pss_system_TO_pss_program -- 시스템 -> 프로그램목록
		FOREIGN KEY (
			sys_cd -- 시스템코드
		)
		REFERENCES pss_system ( -- 시스템
			sys_cd -- 시스템코드
		);		
		
-- ========================================================================================================================================		
		
-- 메뉴정보
DROP TABLE IF EXISTS pss_menu RESTRICT;

-- 메뉴정보
CREATE TABLE pss_menu (
	mn_id             BIGINT UNSIGNED NOT NULL COMMENT '메뉴 아이디', -- 메뉴 아이디
	up_mn_id          BIGINT UNSIGNED NULL     COMMENT '상위메뉴 아이디', -- 상위메뉴 아이디
	mn_nm             VARCHAR(50)     NULL     COMMENT '메뉴명', -- 메뉴명
	mn_dc             VARCHAR(300)    NULL     COMMENT '메뉴설명', -- 메뉴설명
	mn_ty_cd          VARCHAR(50)     NULL     COMMENT '메뉴유형', -- 메뉴유형
	sort_ord          INT UNSIGNED    NULL     DEFAULT 1 COMMENT '정렬순서', -- 정렬순서
	display_yn        VARCHAR(1)      NULL     DEFAULT 'Y' COMMENT '공개여부', -- 공개여부
	main_yn           VARCHAR(1)      NULL     DEFAULT 'N' COMMENT '메인여부', -- 메인여부
	context_menu_yn   VARCHAR(1)      NULL     DEFAULT 'Y' COMMENT '우클릭 제한', -- 우클릭 제한
	display_period_yn VARCHAR(1)      NULL     DEFAULT 'N' COMMENT '표시기간 여부', -- 표시기간 여부
	display_start_dt  DATETIME        NULL     COMMENT '표시 시작일', -- 표시 시작일
	display_end_dt    DATETIME        NULL     COMMENT '표시 종료일', -- 표시 종료일
	use_at            VARCHAR(1)      NULL     DEFAULT 'Y' COMMENT '사용여부', -- 사용여부
	content_id        BIGINT UNSIGNED NULL     DEFAULT 0 COMMENT '컨텐츠 아이디', -- 컨텐츠 아이디
	ref               BIGINT UNSIGNED NULL     DEFAULT 0 COMMENT '부모메뉴', -- 위치
	pos               BIGINT UNSIGNED NULL     DEFAULT 0 COMMENT '위치', -- 위치
	depth             BIGINT UNSIGNED NULL     DEFAULT 0 COMMENT '깊이', -- 깊이
	pg_id             BIGINT UNSIGNED NULL     COMMENT '프로그램 아이디' -- 프로그램 아이디
)
DEFAULT CHARACTER SET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_unicode_ci'
ENGINE = InnoDB
COMMENT '메뉴정보';

-- 메뉴정보
ALTER TABLE pss_menu
	ADD CONSTRAINT PK_pss_menu -- 메뉴정보 기본키
		PRIMARY KEY (
			mn_id -- 메뉴 아이디
		);

ALTER TABLE pss_menu
	MODIFY COLUMN mn_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '메뉴 아이디';

-- 메뉴정보
ALTER TABLE pss_menu
	ADD CONSTRAINT FK_pss_program_TO_pss_menu -- 프로그램목록 -> 메뉴정보
		FOREIGN KEY (
			pg_id -- 프로그램 아이디
		)
		REFERENCES pss_program ( -- 프로그램목록
			pg_id -- 프로그램 아이디
		);		
		
-- ========================================================================================================================================		

-- 권한롤
DROP TABLE IF EXISTS pss_author RESTRICT;

-- 권한롤
CREATE TABLE pss_author (
	sys_cd   VARCHAR(50)  NOT NULL COMMENT '시스템코드', -- 시스템코드
	auth_cd  VARCHAR(50)  NOT NULL COMMENT '권한코드', -- 권한코드
	auth_nm  VARCHAR(100) NULL     COMMENT '권한명', -- 권한명
	auth_dc  VARCHAR(300) NULL     COMMENT '권한설명', -- 권한설명
	reg_user VARCHAR(50)  NULL     COMMENT '작성자', -- 작성자
	reg_dt   DATETIME     NULL     DEFAULT CURRENT_TIMESTAMP COMMENT '작성일시', -- 작성일시
	mod_user VARCHAR(50)  NULL     COMMENT '수정자', -- 수정자
	mod_dt   DATETIME     NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시' -- 수정일시
)
DEFAULT CHARACTER SET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_unicode_ci'
ENGINE = InnoDB
COMMENT '권한롤';

-- 권한롤
ALTER TABLE pss_author
	ADD CONSTRAINT PK_pss_author -- 권한롤 기본키
		PRIMARY KEY (
			sys_cd,  -- 시스템코드
			auth_cd  -- 권한코드
		);

-- 권한롤
ALTER TABLE pss_author
	ADD CONSTRAINT FK_pss_system_TO_pss_author -- 시스템 -> 권한롤
		FOREIGN KEY (
			sys_cd -- 시스템코드
		)
		REFERENCES pss_system ( -- 시스템
			sys_cd -- 시스템코드
		);

-- ========================================================================================================================================		

-- 권한별메뉴정보
DROP TABLE IF EXISTS pss_author_menu_mapping RESTRICT;

-- 권한별메뉴정보
CREATE TABLE pss_author_menu_mapping (
	sys_cd  VARCHAR(50)     NOT NULL COMMENT '시스템코드', -- 시스템코드
	mn_id   BIGINT UNSIGNED NOT NULL COMMENT '메뉴 아이디', -- 메뉴 아이디
	auth_cd VARCHAR(50)     NOT NULL COMMENT '권한코드' -- 권한코드
)
DEFAULT CHARACTER SET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_unicode_ci'
ENGINE = InnoDB
COMMENT '권한별메뉴정보';

-- 권한별메뉴정보
ALTER TABLE pss_author_menu_mapping
	ADD CONSTRAINT PK_pss_author_menu_mapping -- 권한별메뉴정보 기본키
		PRIMARY KEY (
			sys_cd,  -- 시스템코드
			mn_id,   -- 메뉴 아이디
			auth_cd  -- 권한코드
		);

-- 권한별메뉴정보
ALTER TABLE pss_author_menu_mapping
	ADD CONSTRAINT FK_pss_menu_TO_pss_author_menu_mapping -- 메뉴정보 -> 권한별메뉴정보
		FOREIGN KEY (
			mn_id -- 메뉴 아이디
		)
		REFERENCES pss_menu ( -- 메뉴정보
			mn_id -- 메뉴 아이디
		);

-- 권한별메뉴정보
ALTER TABLE pss_author_menu_mapping
	ADD CONSTRAINT FK_pss_author_TO_pss_author_menu_mapping -- 권한롤 -> 권한별메뉴정보
		FOREIGN KEY (
			sys_cd,  -- 시스템코드
			auth_cd  -- 권한코드
		)
		REFERENCES pss_author ( -- 권한롤
			sys_cd,  -- 시스템코드
			auth_cd  -- 권한코드
		);		
		
-- ========================================================================================================================================		

-- 기업(업체)
DROP TABLE IF EXISTS pss_company RESTRICT;

-- 기업(업체)
CREATE TABLE pss_company (
	corp_number        VARCHAR(50)  NOT NULL COMMENT '사업자번호', -- 사업자번호
	corp_nm            VARCHAR(200) NULL     COMMENT '기업명', -- 기업명
	corp_paper         VARCHAR(500) NULL     COMMENT '사업자등록증', -- 사업자등록증
	zipcd              VARCHAR(50)  NULL     COMMENT '우편번호', -- 우편번호
	address1           VARCHAR(100) NULL     COMMENT '주소1', -- 주소1
	address2           VARCHAR(100) NULL     COMMENT '주소2(상세주소)', -- 주소2(상세주소)
	tel                VARCHAR(500) NULL     COMMENT '전화번호', -- 전화번호
	fax                VARCHAR(500) NULL     COMMENT '팩스', -- 팩스
	corp_ceo_nm        VARCHAR(500) NULL     COMMENT '대표자명', -- 대표자명
	corp_ceo_email     VARCHAR(500) NULL     COMMENT '대표 이메일', -- 대표 이메일
	corp_ty            VARCHAR(50)  NULL     COMMENT '기업 구분', -- 기업 구분
	corp_biz_part      VARCHAR(50)  NULL     COMMENT '기업 산업 분류', -- 기업 산업 분류
	corp_dc            VARCHAR(500) NULL     COMMENT '기업설명', -- 기업설명
	days_arrears       INT UNSIGNED NULL     DEFAULT 0 COMMENT '체납일수', -- 체납일수
	person_charge_bill VARCHAR(500) NULL     COMMENT '계산서 담당자', -- 계산서 담당자
	person_email_bill  VARCHAR(500) NULL     COMMENT '계산서 담당자 이메일', -- 계산서 담당자 이메일
	person_tel_bill    VARCHAR(500) NULL     COMMENT '계산서 담당자 연락처', -- 계산서 담당자 연락처
	cfm_at             VARCHAR(1)   NULL     DEFAULT 'Y' COMMENT '승인여부', -- 승인여부
	reg_user           VARCHAR(50)  NULL     COMMENT '작성자UUID', -- 작성자UUID
	reg_dt             DATETIME     NULL     DEFAULT CURRENT_TIMESTAMP COMMENT '작성일시', -- 작성일시
	mod_user           VARCHAR(50)  NULL     COMMENT '수정자UUID', -- 수정자UUID
	mod_dt             DATETIME     NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시' -- 수정일시
)
DEFAULT CHARACTER SET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_unicode_ci'
ENGINE = InnoDB
COMMENT '기업(업체)';

-- 기업(업체)
ALTER TABLE pss_company
	ADD CONSTRAINT PK_pss_company -- 기업(업체) 기본키
		PRIMARY KEY (
			corp_number -- 사업자번호
		);		
		
-- ========================================================================================================================================		

-- 사용자
DROP TABLE IF EXISTS pss_userinfo RESTRICT;

-- 사용자
CREATE TABLE pss_userinfo (
	user_uuid           VARCHAR(50)       NOT NULL COMMENT '사용자UUID', -- 사용자UUID
	user_no             BIGINT UNSIGNED   NOT NULL DEFAULT 0 COMMENT '사용자 번호', -- 사용자 번호
	user_id             VARCHAR(500)      NOT NULL DEFAULT 'GUEST' COMMENT '사용자 아이디', -- 사용자 아이디
	user_pw             VARCHAR(500)      NOT NULL COMMENT '사용자 패스워드', -- 사용자 패스워드
	user_ty             VARCHAR(50)       NULL     COMMENT '사용자 구분', -- 사용자 구분
	user_nm             VARCHAR(500)      NULL     DEFAULT '게스트' COMMENT '사용자명', -- 사용자명
	email               VARCHAR(500)      NULL     COMMENT '이메일', -- 이메일
	tel                 VARCHAR(500)      NULL     COMMENT '전화번호', -- 전화번호
	phone               VARCHAR(500)      NULL     COMMENT '휴대폰번호', -- 휴대폰번호
	job                 VARCHAR(50)       NULL     COMMENT '직업', -- 직업
	nick                VARCHAR(500)      NULL     COMMENT '별명', -- 별명
	zipcd               VARCHAR(50)       NULL     COMMENT '우편번호', -- 우편번호
	address1            VARCHAR(100)      NULL     COMMENT '주소1', -- 주소1
	address2            VARCHAR(100)      NULL     COMMENT '주소2(상세주소)', -- 주소2(상세주소)
	ci                  VARCHAR(100)      NULL     COMMENT '실명확인 CI', -- 실명확인 CI
	di                  VARCHAR(100)      NULL     COMMENT '실명확인 DI', -- 실명확인 DI
	email_yn            VARCHAR(1)        NULL     DEFAULT 'Y' COMMENT '이메일 수신여부', -- 이메일 수신여부
	sms_yn              VARCHAR(1)        NULL     DEFAULT 'Y' COMMENT '문자 수신여부', -- 문자 수신여부
	news_yn             VARCHAR(1)        NULL     DEFAULT 'Y' COMMENT '뉴스레터 수신여부', -- 뉴스레터 수신여부
	birthday            VARCHAR(8)        NULL     COMMENT '생년월일', -- 생년월일
	sex                 VARCHAR(1)        NULL     COMMENT '성별', -- 성별
	picture             VARCHAR(200)      NULL     COMMENT '사진', -- 사진
	cfm_at              VARCHAR(1)        NULL     DEFAULT 'Y' COMMENT '승인여부', -- 승인여부
	locked_at           VARCHAR(1)        NULL     DEFAULT 'N' COMMENT '잠금여부', -- 잠금여부
	expirdate           VARCHAR(8)        NULL     COMMENT '만료일자', -- 만료일자
	login_cnt           SMALLINT UNSIGNED NULL     DEFAULT 0 COMMENT '로그인 시도 횟수', -- 로그인 시도 횟수
	login_stat          VARCHAR(1)        NULL     DEFAULT 'N' COMMENT '로그인 상태', -- 로그인 상태
	pw_last_update_date DATETIME          NULL     COMMENT '패스워드 마지막 수정일', -- 패스워드 마지막 수정일
	dept_cd             VARCHAR(50)       NULL     COMMENT '부서코드', -- 부서코드
	charge              VARCHAR(50)       NULL     COMMENT '직책', -- 직책
	position            VARCHAR(50)       NULL     COMMENT '직위', -- 직위
	corp_number         VARCHAR(50)       NULL     COMMENT '사업자번호', -- 사업자번호
	secession_dt        DATETIME          NULL     COMMENT '탈퇴일시', -- 탈퇴일시
	secession_memo      VARCHAR(200)      NULL     COMMENT '탈퇴사유', -- 탈퇴사유
	use_at              VARCHAR(1)        NULL     DEFAULT 'Y' COMMENT '사용여부', -- 사용여부
	reg_user            VARCHAR(50)       NULL     COMMENT '작성자UUID', -- 작성자UUID
	reg_dt              DATETIME          NULL     DEFAULT CURRENT_TIMESTAMP COMMENT '작성일시', -- 작성일시
	mod_user            VARCHAR(50)       NULL     COMMENT '수정자UUID', -- 수정자UUID
	mod_dt              DATETIME          NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시', -- 수정일시
	sys_cd              VARCHAR(50)       NULL     COMMENT '시스템코드' -- 시스템코드
)
DEFAULT CHARACTER SET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_unicode_ci'
ENGINE = InnoDB
COMMENT '사용자';

-- 사용자
ALTER TABLE pss_userinfo
	ADD CONSTRAINT PK_pss_userinfo -- 사용자 기본키
		PRIMARY KEY (
			user_uuid -- 사용자UUID
		);

-- 사용자
ALTER TABLE pss_userinfo
	ADD CONSTRAINT FK_pss_system_TO_pss_userinfo -- 시스템 -> 사용자
		FOREIGN KEY (
			sys_cd -- 시스템코드
		)
		REFERENCES pss_system ( -- 시스템
			sys_cd -- 시스템코드
		);

-- 사용자
ALTER TABLE pss_userinfo
	ADD CONSTRAINT FK_pss_company_TO_pss_userinfo -- 기업(업체) -> 사용자
		FOREIGN KEY (
			corp_number -- 사업자번호
		)
		REFERENCES pss_company ( -- 기업(업체)
			corp_number -- 사업자번호
		);
		
-- ========================================================================================================================================		

-- 사용자권한정보
DROP TABLE IF EXISTS pss_user_author RESTRICT;

-- 사용자권한정보
CREATE TABLE pss_user_author (
	user_uuid  VARCHAR(50) NOT NULL COMMENT '사용자UUID', -- 사용자UUID
	sys_cd     VARCHAR(50) NOT NULL COMMENT '시스템코드', -- 시스템코드
	auth_cd    VARCHAR(50) NOT NULL COMMENT '권한코드', -- 권한코드
	start_date VARCHAR(8)  NULL     COMMENT '시작일자', -- 시작일자
	end_date   VARCHAR(8)  NULL     COMMENT '종료일자', -- 종료일자
	mod_user   VARCHAR(50) NULL     COMMENT '수정자UUID', -- 수정자UUID
	mod_dt     DATETIME    NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시' -- 수정일시
)
DEFAULT CHARACTER SET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_unicode_ci'
ENGINE = InnoDB
COMMENT '사용자권한정보';

-- 사용자권한정보
ALTER TABLE pss_user_author
	ADD CONSTRAINT PK_pss_user_author -- 사용자권한정보 기본키
		PRIMARY KEY (
			user_uuid, -- 사용자UUID
			sys_cd,    -- 시스템코드
			auth_cd    -- 권한코드
		);

-- 사용자권한정보
ALTER TABLE pss_user_author
	ADD CONSTRAINT FK_pss_userinfo_TO_pss_user_author -- 사용자 -> 사용자권한정보
		FOREIGN KEY (
			user_uuid -- 사용자UUID
		)
		REFERENCES pss_userinfo ( -- 사용자
			user_uuid -- 사용자UUID
		);

-- 사용자권한정보
ALTER TABLE pss_user_author
	ADD CONSTRAINT FK_pss_author_TO_pss_user_author -- 권한롤 -> 사용자권한정보
		FOREIGN KEY (
			sys_cd,  -- 시스템코드
			auth_cd  -- 권한코드
		)
		REFERENCES pss_author ( -- 권한롤
			sys_cd,  -- 시스템코드
			auth_cd  -- 권한코드
		);		
		
-- ========================================================================================================================================		

-- 로그인아웃 로그
DROP TABLE IF EXISTS pss_loginout_log RESTRICT;

-- 로그인아웃 로그
CREATE TABLE pss_loginout_log (
	user_uuid         VARCHAR(50)  NOT NULL COMMENT '사용자UUID', -- 사용자UUID
	sys_cd            VARCHAR(50)  NOT NULL COMMENT '시스템코드', -- 시스템코드
	reg_dt            DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일시', -- 작성일시
	connect_nm        VARCHAR(100) NULL     COMMENT '접속명', -- 접속명
	connect_ip        VARCHAR(50)  NULL     COMMENT '접속 아이피', -- 접속 아이피
	connect_method_cd VARCHAR(50)  NULL     COMMENT '접속방법코드', -- 접속방법코드
	connect_ty_cd     VARCHAR(50)  NULL     COMMENT '접속유형코드' -- 접속유형코드
)
DEFAULT CHARACTER SET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_unicode_ci'
ENGINE = InnoDB
COMMENT '로그인아웃 로그';

-- 로그인아웃 로그
ALTER TABLE pss_loginout_log
	ADD CONSTRAINT PK_pss_loginout_log -- 로그인아웃 로그 기본키
		PRIMARY KEY (
			user_uuid, -- 사용자UUID
			sys_cd,    -- 시스템코드
			reg_dt     -- 작성일시
		);

-- 로그인아웃 로그
ALTER TABLE pss_loginout_log
	ADD CONSTRAINT FK_pss_userinfo_TO_pss_loginout_log -- 사용자 -> 로그인아웃 로그
		FOREIGN KEY (
			user_uuid -- 사용자UUID
		)
		REFERENCES pss_userinfo ( -- 사용자
			user_uuid -- 사용자UUID
		);

-- 로그인아웃 로그
ALTER TABLE pss_loginout_log
	ADD CONSTRAINT FK_pss_system_TO_pss_loginout_log -- 시스템 -> 로그인아웃 로그
		FOREIGN KEY (
			sys_cd -- 시스템코드
		)
		REFERENCES pss_system ( -- 시스템
			sys_cd -- 시스템코드
		);		
		
-- ========================================================================================================================================		

-- 센터
DROP TABLE IF EXISTS pss_cent RESTRICT;

-- 센터
CREATE TABLE pss_cent (
	cent_uuid   VARCHAR(50)     NOT NULL COMMENT '센터UUID', -- 센터UUID
	cent_no     BIGINT UNSIGNED NOT NULL COMMENT '센터 번호', -- 센터 번호
	cent_id     VARCHAR(500)    NOT NULL COMMENT '센터ID', -- 센터ID
	cent_nm     VARCHAR(500)    NULL     COMMENT '센터명', -- 센터명
	cent_fax    VARCHAR(500)    NULL     COMMENT '센터FAX', -- 센터FAX
	email       VARCHAR(500)    NULL     COMMENT '이메일', -- 이메일
	tel         VARCHAR(500)    NULL     COMMENT '전화번호', -- 전화번호
	zipcd       VARCHAR(50)     NULL     COMMENT '우편번호', -- 우편번호
	address1    VARCHAR(100)    NULL     COMMENT '주소1', -- 주소1
	address2    VARCHAR(100)    NULL     COMMENT '주소2(상세주소)', -- 주소2(상세주소)
	cfm_at      VARCHAR(1)      NULL     DEFAULT 'Y' COMMENT '승인여부', -- 승인여부
	corp_number VARCHAR(50)     NULL     COMMENT '사업자번호', -- 사업자번호
	sort_ord    INT UNSIGNED    NULL     DEFAULT 1 COMMENT '정렬순서', -- 정렬순서
	use_at      VARCHAR(1)      NULL     DEFAULT 'Y' COMMENT '사용여부', -- 사용여부
	reg_user    VARCHAR(50)     NULL     COMMENT '작성자UUID', -- 작성자UUID
	reg_dt      DATETIME        NULL     DEFAULT CURRENT_TIMESTAMP COMMENT '작성일시', -- 작성일시
	mod_user    VARCHAR(50)     NULL     COMMENT '수정자UUID', -- 수정자UUID
	mod_dt      DATETIME        NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시', -- 수정일시
	sys_cd      VARCHAR(50)     NULL     COMMENT '시스템코드' -- 시스템코드
)
DEFAULT CHARACTER SET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_unicode_ci'
ENGINE = InnoDB
COMMENT '센터';

-- 센터
ALTER TABLE pss_cent
	ADD CONSTRAINT PK_pss_cent -- 센터 기본키
		PRIMARY KEY (
			cent_uuid -- 센터UUID
		);

-- 센터
ALTER TABLE pss_cent
	ADD CONSTRAINT FK_pss_system_TO_pss_cent -- 시스템 -> 센터
		FOREIGN KEY (
			sys_cd -- 시스템코드
		)
		REFERENCES pss_system ( -- 시스템
			sys_cd -- 시스템코드
		);
		
-- ========================================================================================================================================		

-- 시스템사용자
DROP TABLE IF EXISTS pss_manager RESTRICT;

-- 시스템사용자
CREATE TABLE pss_manager (
	m_idx     BIGINT UNSIGNED NOT NULL COMMENT '순번', -- 순번
	user_uuid VARCHAR(50)     NOT NULL COMMENT '사용자UUID', -- 사용자UUID
	user_id   VARCHAR(500)    NOT NULL DEFAULT 'GUEST' COMMENT '사용자 아이디', -- 사용자 아이디
	user_pw   VARCHAR(500)    NOT NULL COMMENT '사용자 패스워드', -- 사용자 패스워드
	user_nm   VARCHAR(500)    NULL     DEFAULT '게스트' COMMENT '사용자명', -- 사용자명
	cent_uuid VARCHAR(50)     NULL     COMMENT '센터UUID', -- 센터UUID
	team_id   VARCHAR(500)    NULL     COMMENT '팀아이디', -- 팀아이디
	team_nm   VARCHAR(500)    NULL     COMMENT '팀명', -- 팀명
	sign_img  VARCHAR(200)    NULL     COMMENT '서명이미지', -- 서명이미지
	fax       VARCHAR(500)    NULL     COMMENT '팩스', -- 팩스
	tel       VARCHAR(500)    NULL     COMMENT '전화번호', -- 전화번호
	email     VARCHAR(500)    NULL     COMMENT '이메일', -- 이메일
	phone     VARCHAR(500)    NULL     COMMENT '휴대폰번호', -- 휴대폰번호
	state     VARCHAR(50)     NULL     COMMENT '상태' -- 상태
)
DEFAULT CHARACTER SET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_unicode_ci'
ENGINE = InnoDB
COMMENT '시스템사용자';

-- 시스템사용자
ALTER TABLE pss_manager
	ADD CONSTRAINT PK_pss_manager -- 시스템사용자 기본키
		PRIMARY KEY (
			m_idx,     -- 순번
			user_uuid  -- 사용자UUID
		);

ALTER TABLE pss_manager
	MODIFY COLUMN m_idx BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '순번';

-- 시스템사용자
ALTER TABLE pss_manager
	ADD CONSTRAINT FK_pss_userinfo_TO_pss_manager -- 사용자 -> 시스템사용자
		FOREIGN KEY (
			user_uuid -- 사용자UUID
		)
		REFERENCES pss_userinfo ( -- 사용자
			user_uuid -- 사용자UUID
		);

-- 시스템사용자
ALTER TABLE pss_manager
	ADD CONSTRAINT FK_pss_cent_TO_pss_manager -- 센터 -> 시스템사용자
		FOREIGN KEY (
			cent_uuid -- 센터UUID
		)
		REFERENCES pss_cent ( -- 센터
			cent_uuid -- 센터UUID
		);		
		
-- ========================================================================================================================================		

		
		
-- ========================================================================================================================================		

		
		
-- ========================================================================================================================================		

		
		
-- ========================================================================================================================================		

		
		
-- ========================================================================================================================================		

		
		
-- ========================================================================================================================================		

		
		
-- ========================================================================================================================================		

		
		
-- ========================================================================================================================================				