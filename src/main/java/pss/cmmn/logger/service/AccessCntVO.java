package pss.cmmn.logger.service;

import java.math.BigInteger;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import pss.cmmn.service.CmmnVO;

/**
 * 접속카운트
 * @author PhilSang Son (niceguyths@naver.com)
 *
 */
@Setter @Getter
@SuppressWarnings("serial")
public class AccessCntVO extends CmmnVO{

	private BigInteger acIdx;
	private Timestamp accessDt;
	private BigInteger hitCnt;
	private String sessionId;
	private String sysCd;
}