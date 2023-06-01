package pss.cmmn.menu.service;

import java.math.BigInteger;

import lombok.Getter;
import lombok.Setter;
import pss.cmmn.service.CmmnVO;

/**
 * 프로그램목록
 * @author PhilSang Son (niceguyths@naver.com)
 *
 */
@Setter @Getter
@SuppressWarnings("serial")
public class ProgramVO extends CmmnVO{

	private BigInteger pgId;
	private String pgFileNm;
	private String pgSavePath;
	private String pgNm;
	private String pgDc;
	private String pgUrl;
	private String useAt;
	private String sysCd;
}