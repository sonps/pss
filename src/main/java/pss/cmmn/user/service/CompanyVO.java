package pss.cmmn.user.service;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import pss.cmmn.service.CmmnVO;

/**
 * 기업(업체)
 * @author PhilSang Son (niceguyths@naver.com)
 *
 */
@Setter @Getter
@SuppressWarnings("serial")
public class CompanyVO extends CmmnVO{

	private String corpNumber;
	private String corpNm;
	private String corpPaper;
	private String zipcd;
	private String address1;
	private String address2;
	private String tel;
	private String fax;
	private String corpCeoNm;
	private String corpCeoEmail;
	private String corpTy;
	private String corpBizPart;
	private String corpDc;
	private int daysArrears;
	private String personChargeBill;
	private String personEmailBill;
	private String personTelBill;
	private String cfmAt;
	private String regUser;
	private Timestamp regDt;
	private String modUser;
	private Timestamp modDt;
}