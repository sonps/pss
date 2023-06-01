package pss.cmmn.user.service.impl;

import java.security.PrivateKey;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pss.cmmn.exception.PssException;
import pss.cmmn.service.MyBatisTransactionManager;
import pss.cmmn.service.PssAbstractServiceImpl;
import pss.cmmn.system.mapper.SystemMapper;
import pss.cmmn.system.service.SystemVO;
import pss.cmmn.user.mapper.UserMapper;
import pss.cmmn.user.service.LoginoutLogVO;
import pss.cmmn.user.service.UserService;
import pss.cmmn.user.service.UserVO;
import pss.cmmn.util.RSA;
import pss.cmmn.util.Utils;

@Service("userService")
public class UserServiceImpl extends PssAbstractServiceImpl implements UserService{

	Logger log = Logger.getLogger(this.getClass());
	
	private MyBatisTransactionManager transaction;
	
	@Resource(name = "userMapper")
	private UserMapper userMapper;
	
	@Resource(name = "systemMapper")
	private SystemMapper systemMapper;
	
	@Override
	public Map<?, ?> getUserDupliCheck(Map<?, ?> map) throws PssException {
		return userMapper.getUserDupliCheck(map);
	}

	@Override
	public Integer insertUser(UserVO userVO, HttpServletRequest request) throws PssException {
		
		int res = -1;
		
		userVO.setSysCd(String.valueOf(request.getSession().getAttribute("SYS_CD")));
		userVO.setUserPw(Utils.encode(userVO.getUserPw())); // 스프링 BCryptPasswordEncoder
		userVO.setUserNo(userMapper.getUserNo()); // 회원번호 생성
		
		transaction = getTransactionManager();
		
		try {
			transaction.start();
			
			res = userMapper.insertUser(userVO);
			if("STAFF".equals(userVO.getUserTy())) {
				res += userMapper.insertManager(userVO);
			}
			
			if(res < 1) {
				transaction.rollback();
			}
		}catch(TransactionException e) {
			transaction.rollback();
		}finally {
			transaction.commit();
			transaction.end();
		}

		return res;
	}

	@Override
	public Integer getUserLoginResult(UserVO userVO, HttpServletRequest request, RedirectAttributes RA) throws PssException, Exception {
		transaction = getTransactionManager();
		
		SystemVO systemVO = systemMapper.getSystem(userVO);
		request.getSession().setAttribute("systemVO", systemVO);
		
		PrivateKey privateKey = (PrivateKey)request.getSession().getAttribute("_RSA_WEB_Key_");
		userVO.setUserId(RSA.decryptRsa(privateKey, userVO.getUserId()));
		final String reqPW =  RSA.decryptRsa(privateKey, userVO.getUserPw());
		
		int result = -1;
		
		try {
			transaction.start();
			
			userVO = userMapper.getUserLogin(userVO);
			
			LoginoutLogVO loginoutLogVO = new LoginoutLogVO();
			loginoutLogVO.setUserUuid(userVO.getUserUuid());
			loginoutLogVO.setUserNo(userVO.getUserNo());
			loginoutLogVO.setSysCd(request.getParameter("sysCd"));
			loginoutLogVO.setConnectIp(request.getRemoteAddr());
			loginoutLogVO.setConnectTyCd(Utils.userAgentCheck(request));
			
			if(userVO.getUserUuid() != null) {
				
				if("N".equals(userVO.getUseAt())) {
					result = 1; // 사용중지
				}else if("L".equals(userVO.getLoginStat())) {
					result = 2; // 잠김
				}else {
					
					if("N".equals(systemVO.getMultiLoginAt()) && "Y".equals(userVO.getLoginStat())) {
						result = 3; // 이미 로그인중
					}else {
					
						if(Utils.matches(reqPW, userVO.getUserPw())) {
							if("meister".equals(request.getParameter("sysCd"))) {
								request.getSession().setAttribute("USER_AUTH", "MEISTER");
							}
							
							/** 로그인 시도 초기화 */
							userVO.setLoginCnt(0);
							userVO.setLoginStat("Y");
							int res = userMapper.updateLoginInit(userVO);
							
							/** 세션 셋팅 */
							request.getSession().setAttribute("userVO", userVO);
							
							loginoutLogVO.setConnectNm(request.getParameter("sysCd")+" 로그인");
							loginoutLogVO.setConnectMethodCd("LogIn");
							res += userMapper.insertLoginLog(loginoutLogVO);

							if(res < 2) {
								transaction.rollback();
								result = 99;
							}else {
								result = 0;
							}
						}else {
							
							if(systemVO.getLoginFailCnt() > 0) {
								if(userVO.getLoginCnt() < systemVO.getLoginFailCnt()) {
									userMapper.updateLoginCntAdd(userVO);
									loginoutLogVO.setConnectNm(request.getParameter("sysCd")+" 로그인 실패");
									loginoutLogVO.setConnectMethodCd("LogFail");
									userMapper.insertLoginLog(loginoutLogVO);
									
									RA.addFlashAttribute("usrLoginCnt", userVO.getLoginCnt()+1);
									
									result = 4; // 로그인 시도 횟수
								}else {
									userVO.setLoginStat("L");
									userMapper.updateLoginStat(userVO);
								
									result = 2; // 잠김
								}
							}
							
						}
					
					}
					
				}
				
			}
		}catch(TransactionException e) {
			transaction.rollback();
		}finally {
			transaction.commit();
			transaction.end();
		}
		
		return result;
	}

	@Override
	public void setUserLogout(HttpServletRequest request) throws PssException {
		transaction = getTransactionManager();
		
		try {
			transaction.start();
			
			LoginoutLogVO loginoutLogVO = new LoginoutLogVO();
			UserVO userVO = (UserVO) request.getSession().getAttribute("userVO");
			loginoutLogVO.setUserUuid(userVO.getUserUuid());
			loginoutLogVO.setSysCd(userVO.getSysCd());
			loginoutLogVO.setConnectNm(userVO.getSysCd()+" 로그아웃");
			loginoutLogVO.setConnectIp(request.getRemoteAddr());
			loginoutLogVO.setConnectMethodCd("LogOut");
			loginoutLogVO.setConnectTyCd(Utils.userAgentCheck(request));
			
			int res = userMapper.insertLoginLog(loginoutLogVO);
			
			userVO.setLoginStat("N");
			
			res += userMapper.updateLoginStat(userVO);
			log.debug("@@@@@@@@@@"+res);
			if(res < 2) {
				transaction.rollback();
			}
			
		}catch(TransactionException e) {
			transaction.rollback();
		}finally {
			transaction.commit();
			transaction.end();
		}
	}

}