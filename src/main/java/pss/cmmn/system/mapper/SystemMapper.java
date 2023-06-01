package pss.cmmn.system.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import pss.cmmn.exception.PssException;
import pss.cmmn.system.service.SystemVO;
import pss.cmmn.user.service.UserVO;

@Mapper("systemMapper")
public interface SystemMapper {

	/**
	 * 시스템 정보 얻기
	 * @param userVO
	 * @return
	 * @throws PssException
	 */
	SystemVO getSystem(UserVO userVO) throws PssException;

	/**
	 * 본 system 제외 List
	 * @param systemVO
	 * @return
	 * @throws PssException
	 */
	List<?> getOtherSystemList(SystemVO systemVO) throws PssException;

}