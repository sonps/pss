package pss.cmmn.logger.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import pss.cmmn.exception.PssException;
import pss.cmmn.ipCheck.service.IpCheckVO;

public interface SystemLogService {

	/**
	 * 시스템 로그정보를 생성
	 * @param systemLogVO
	 * @throws PssException
	 */
	void insertSystemLog(SystemLogVO systemLogVO) throws PssException;

	/**
	 * 접속카운트 -해당날짜존재여부확인
	 * @param accessCntVO
	 * @return List
	 * @throws PssException
	 */
	List<Map<String, Object>> getAccessCntList(AccessCntVO accessCntVO) throws PssException;

	/**
	 * 접속카운트 추가
	 * @param accessCntVO
	 * @return int
	 * @throws PssException
	 */
	int insertAccessCnt(AccessCntVO accessCntVO) throws PssException;

	/**
	 * 접속카운트 증가
	 * @param accessCntVO
	 * @return int
	 * @throws PssException
	 */
	int updateAccessCnt(AccessCntVO accessCntVO) throws PssException;

	/**
	 * 아이피 체크
	 * @param request
	 * @return IpCheckVO
	 * @throws PssException
	 */
	IpCheckVO getIpCheck(HttpServletRequest request) throws PssException;

	/**
	 * sysCd별 menu List
	 * @param request
	 * @return List
	 * @throws PssException
	 */
	List<Map<String, Object>> getMenuList(HttpServletRequest request) throws PssException;

}