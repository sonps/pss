package pss.cmmn.menu.service;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

/**
 * 권한롤
 * @author PhilSang Son (niceguyths@naver.com)
 *
 */
@Setter @Getter
@SuppressWarnings("serial")
public class AuthorVO extends MenuVO{

	private String sysCd;
	private String authCd;
	private String authNm;
	private String authDc;
	private String regUser;
	private Timestamp regDt;
	private String modUser;
	private Timestamp modDt;
}