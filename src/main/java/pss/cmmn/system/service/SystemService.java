package pss.cmmn.system.service;

import java.util.List;

import pss.cmmn.exception.PssException;

public interface SystemService {

	/**
	 * 본 system 제외 List
	 * @param systemVO
	 * @return
	 * @throws PssException
	 */
	List<?> getOtherSystemList(SystemVO systemVO) throws PssException;

}