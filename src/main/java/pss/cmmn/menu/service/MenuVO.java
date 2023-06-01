package pss.cmmn.menu.service;

import java.math.BigInteger;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

/**
 * 메뉴정보
 * @author PhilSang Son (niceguyths@naver.com)
 *
 */
@Setter @Getter
@SuppressWarnings("serial")
public class MenuVO extends ProgramVO{

	private BigInteger mnId;
	private BigInteger upMnId;
	private String mnNm;
	private String mnDc;
	private String mnTyCd;
	private int sortOrd;
	private String displayYn;
	private String mainYn;
	private String contextMenuYn;
	private String displayPeriodYn;
	private Timestamp displayStartDt;
	private Timestamp displayEndDt;
	private String useAt;
	private BigInteger contentId;
	private BigInteger pos;
	private BigInteger depth;
	private BigInteger pgId;
}