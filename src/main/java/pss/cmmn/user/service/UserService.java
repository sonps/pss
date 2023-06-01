package pss.cmmn.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pss.cmmn.exception.PssException;

public interface UserService {

	/**
	 * User 중복확인
	 * @param map
	 * @return map
	 * @throws PssException
	 */
	Map<?, ?> getUserDupliCheck(Map<?, ?> map) throws PssException;

	/**
	 * 사용자 등록
	 * @param userVO
	 * @return int
	 * @throws PssException
	 */
	Integer insertUser(UserVO userVO, HttpServletRequest request) throws PssException;

	/**
	 * 회원 로그인 처리 결과 얻기
	 * @param userVO
	 * @param request
	 * @param RA
	 * @return
	 * @throws PssException
	 * @throws Exception
	 */
	Integer getUserLoginResult(UserVO userVO, HttpServletRequest request, RedirectAttributes RA) throws PssException, Exception;

	/**
	 * 회원 로그아웃 처리
	 * @param request
	 * @throws PssException
	 */
	void setUserLogout(HttpServletRequest request) throws PssException;

}