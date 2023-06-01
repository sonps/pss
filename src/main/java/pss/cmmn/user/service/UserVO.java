package pss.cmmn.user.service;

import java.math.BigInteger;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

/**
 * 사용자
 * @author PhilSang Son (niceguyths@naver.com)
 *
 */
@Setter @Getter
@SuppressWarnings("serial")
public class UserVO extends CompanyVO{

	private String userUuid;
	private BigInteger userNo;
	private String userId;
	private String userPw;
	private String userTy;
	private String userNm;
	private String email;
	private String phone;
	private String job;
	private String nick;
	private String ci;
	private String di;
	private String emailYn;
	private String smsYn;
	private String newsYn;
	private String birthday;
	private String sex;
	private String picture;
	private String lockedAt;
	private String expirdate;
	private int loginCnt;
	private String loginStat;
	private Timestamp pwLastUpdateDate;
	private String deptCd;
	private String charge;
	private String position;
	private Timestamp secessionDt;
	private String secessionMemo;
	private String useAt;
	private String sysCd;
}