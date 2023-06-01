package pss.cmmn.user.mapper;

import java.math.BigInteger;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import pss.cmmn.exception.PssException;
import pss.cmmn.user.service.LoginoutLogVO;
import pss.cmmn.user.service.UserVO;

@Mapper("userMapper")
public interface UserMapper {

	/**
	 * User 중복확인
	 * @param map
	 * @return map
	 * @throws PssException
	 */
	Map<?, ?> getUserDupliCheck(Map<?, ?> map) throws PssException;

	/**
	 * 사용자 입력
	 * @param userVO
	 * @return int
	 * @throws PssException
	 */
	Integer insertUser(UserVO userVO) throws PssException;

	/**
	 * 관리자 입력
	 * @param userVO
	 * @return int
	 * @throws PssException
	 */
	Integer insertManager(UserVO userVO) throws PssException;

	/**
	 * 사용자 번호 얻기
	 * @return
	 * @throws PssException
	 */
	BigInteger getUserNo() throws PssException;

	/**
	 * 사용자 로그인
	 * @param userVO
	 * @return
	 * @throws PssException
	 */
	UserVO getUserLogin(UserVO userVO) throws PssException;

	/**
	 * 로그인아웃 로그 등록
	 * @param loginoutLogVO
	 * @return 
	 * @throws PssException
	 */
	Integer insertLoginLog(LoginoutLogVO loginoutLogVO) throws PssException;

	/**
	 * 사용자 로그인 상태 변경
	 * @param resUserVO
	 * @return
	 * @throws PssException
	 */
	Integer updateLoginStat(UserVO userVO) throws PssException;

	/**
	 * 로그인 시도 횟수 증가
	 * @param userVO
	 * @return
	 * @throws PssException
	 */
	Integer updateLoginCntAdd(UserVO userVO) throws PssException;

	/**
	 * 로그인 시도 초기화
	 * @param userVO
	 * @return
	 * @throws PssException
	 */
	Integer updateLoginInit(UserVO userVO) throws PssException;

}