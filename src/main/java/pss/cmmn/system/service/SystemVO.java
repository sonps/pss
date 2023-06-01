package pss.cmmn.system.service;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import pss.cmmn.service.CmmnVO;

/**
 * 시스템
 * @author PhilSang Son (niceguyths@naver.com)
 * @since 2022-06-14
 */
@Setter @Getter
@SuppressWarnings("serial")
public class SystemVO extends CmmnVO{
	/** 시스템코드 */
	private String sysCd;
	/** 시스템명 */
	private String sysNm;
	/** 상위코드 */
	private String parCd;
	/** 시스템버전 */
	private String sysVs;
	/** 등록일시 */
	private Timestamp regDt;
	/** 수정일시 */
	private Timestamp modDt;
	/** 종료일자 */
	private String endDate;
	/** 암호화값 */
	private String encVal;
	/** 로그인실패제한수 */
	private int loginFailCnt;
	/** 다중로그인여부 */
	private String multiLoginAt;
	/** 자동로그아웃분 */
	private int autoLogoutMin;
	/** 사용여부 */
	private String useAt;
}