package pss.cmmn.menu.service;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

/**
 * 사용자권한정보
 * @author PhilSang Son (niceguyths@naver.com)
 *
 */
@Setter @Getter
@SuppressWarnings("serial")
public class UserAuthorVO extends AuthorMenuMappingVO{

	private String userUuid;
	private String sysCd;
	private String authCd;
	private String startDate;
	private String endDate;
	private String modUser;
	private Timestamp modDt;
}