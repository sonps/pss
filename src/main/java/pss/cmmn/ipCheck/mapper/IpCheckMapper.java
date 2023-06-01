package pss.cmmn.ipCheck.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import pss.cmmn.exception.PssException;
import pss.cmmn.ipCheck.service.IpCheckVO;

@Mapper("ipCheckMapper")
public interface IpCheckMapper {

	/**
	 * 아이피 체크
	 * @param ipCheckVO
	 * @return
	 * @throws PssException
	 */
	IpCheckVO getIpCheck(IpCheckVO ipCheckVO) throws PssException;

}