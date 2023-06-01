package pss.cmmn.user.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pss.cmmn.exception.PssException;
import pss.cmmn.user.service.UserService;
import pss.cmmn.user.service.UserVO;

/**
 * 공통 User Controller
 * @author PhilSang Son (niceguyths@naver.com)
 * @since 2022-04-14
 */
@Controller
public class CmmnUserController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="userService")
	private UserService userService;
	
	/**
	 * 아이디 중복확인
	 * @param mav
	 * @param map
	 * @param request
	 * @param sysCd
	 * @return Map
	 * @throws PssException
	 */
	@RequestMapping(value = "/{sysCd}/user/dupliCheck.do")
	public ModelAndView sysCdUserDupliCheck(ModelAndView mav, @RequestParam Map<?, ?> map, HttpServletRequest request, @PathVariable("sysCd") String sysCd) throws PssException{
		mav.setViewName("jsonView");
		mav.addObject("res", userService.getUserDupliCheck(map));
		return mav;
	}
	
	/**
	 * 초기 회원 등록처리
	 * @param mav
	 * @param userVO
	 * @param request
	 * @param sysCd
	 * @return
	 * @throws PssException
	 */
	@RequestMapping(value = "/{sysCd}/user/insertProc.do")
	public ModelAndView sysCdUserInsertProc(ModelAndView mav, UserVO userVO, HttpServletRequest request, @PathVariable("sysCd") String sysCd) throws PssException{
		mav.setViewName("jsonView");
		mav.addObject("res", userService.insertUser(userVO, request));
		return mav;
	}
	
	/**
	 * 회원 로그인 처리
	 * @param mav
	 * @param userVO
	 * @param request
	 * @param sysCd
	 * @return
	 * @throws PssException
	 * @throws Exception
	 */
	@RequestMapping(value = "/{sysCd}/user/doLogin.do")
	public ModelAndView sysCdUserDoLogin(ModelAndView mav, UserVO userVO, HttpServletRequest request, RedirectAttributes RA, @PathVariable("sysCd") String sysCd) throws PssException, Exception{
		mav.setViewName("jsonView");
		mav.addObject("res", userService.getUserLoginResult(userVO, request, RA));
		return mav;
	}
	
	/**
	 * 회원 로그아웃 처리
	 * @param mav
	 * @param request
	 * @param sysCd
	 * @return
	 * @throws PssException
	 */
	@RequestMapping(value = "/{sysCd}/user/doLogout.do")
	public ModelAndView sysCdUserDoLogout(ModelAndView mav, HttpServletRequest request, @PathVariable("sysCd") String sysCd) throws PssException{
		mav.setViewName("redirect:/"+sysCd+"/main.do");
		
		userService.setUserLogout(request);
		request.getSession().removeAttribute("userVO");
		if("meister".equals(sysCd)) {
			request.getSession().removeAttribute("USER_AUTH");
		}
		
		return mav;
	}
}