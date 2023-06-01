package pss.cmmn.logger.service;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import pss.cmmn.service.CmmnVO;

/**
 * 시스템 로그
 * @author PhilSang Son (niceguyths@naver.com)
 *
 */
@SuppressWarnings("serial")
@Setter @Getter
public class SystemLogVO extends CmmnVO{

	private BigInteger logId;
	private Timestamp regDt;
	private String userId;
	private String userNm;
	private String userIp;
	private String reqUrl;
	private String classNm;
	private String methodNm;
	private String args;
	private String crud;
	private BigDecimal elapseTime;
	private String userNation;
	private String sysCd;
}