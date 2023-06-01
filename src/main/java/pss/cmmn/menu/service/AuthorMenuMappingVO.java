package pss.cmmn.menu.service;

import java.math.BigInteger;

import lombok.Getter;
import lombok.Setter;

/**
 * 권한별메뉴정보
 * @author PhilSang Son (niceguyths@naver.com)
 *
 */
@Setter @Getter
@SuppressWarnings("serial")
public class AuthorMenuMappingVO extends AuthorVO{

	private String sysCd;
	private BigInteger mnId;
	private String authCd;
}