package pss.cmmn.logger.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import pss.cmmn.exception.PssException;
import pss.cmmn.logger.service.AccessCntVO;
import pss.cmmn.logger.service.SystemLogVO;

@Mapper("systemLogMapper")
public interface SystemLogMapper {

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

}