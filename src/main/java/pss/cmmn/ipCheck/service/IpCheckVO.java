package pss.cmmn.ipCheck.service;

import java.math.BigInteger;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import pss.cmmn.service.CmmnVO;

/**
 * 아이피 체크
 * @author PhilSang Son (niceguyths@naver.com)
 *
 */
@Setter @Getter
@SuppressWarnings("serial")
public class IpCheckVO extends CmmnVO{

	private BigInteger idx;
	private String allwYn;
	private String ip1;
	private String ip2;
	private String ip3;
	private String ip4;
	private String ip5;
	private String ip6;
	private String remk;
	private String useAt;
	private String regUser;
	private Timestamp regDt;
	private String modUser;
	private Timestamp modDt;
	private String sysCd;
	
	private String clientIp;
	private String ipYn;
}