package pss.cmmn.user.service;

import lombok.Getter;
import lombok.Setter;

/**
 * 로그인아웃 로그
 * @author PhilSang Son (niceguyths@naver.com)
 *
 */
@Setter @Getter
@SuppressWarnings("serial")
public class LoginoutLogVO extends UserVO{

	private String connectNm;
	private String connectIp;
	private String connectMethodCd;
	private String connectTyCd;
}