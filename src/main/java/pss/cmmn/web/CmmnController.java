package pss.cmmn.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pss.cmmn.exception.PssException;
import pss.cmmn.system.service.SystemService;
import pss.cmmn.system.service.SystemVO;

/**
 * 공통 Controller
 * @author PhilSang Son (niceguyths@naver.com)
 * @since 2022-04-08
 */
@Controller
public class CmmnController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "systemService")
	private SystemService systemService;
	
	@RequestMapping(value = "/{sysCd}/{page}.do")
	public ModelAndView sysCdPage(ModelAndView mav, @RequestParam Map<?,?> map, HttpServletRequest request, @PathVariable("sysCd") String sysCd, @PathVariable("page") String page) throws PssException{
		String url = "";
		if(!sysCd.equals(String.valueOf(request.getSession().getAttribute("SYS_CD")))) {
			sysCd = String.valueOf(request.getSession().getAttribute("SYS_CD"));
			request.getSession().setAttribute("SYS_CD", sysCd);
			url = "redirect:/"+sysCd+"/"+page+".do";
		}else {
			if(ObjectUtils.isEmpty(map.get("page")) == false) {
				url = sysCd+"/pages/"+map.get("page");
			}else {
				if("meister".equals(sysCd)) {
					SystemVO systemVO = new SystemVO();
					systemVO.setSysCd(sysCd);
					
					List<?> otherSystemList = systemService.getOtherSystemList(systemVO);
					mav.addObject("otherSystemList", otherSystemList);
				}
				url = sysCd+"/"+page+"."+sysCd;
			}
		}
		mav.addObject("page", page);
		mav.setViewName(url);
		return mav;
	}
	
	@RequestMapping(value = "/{sysCd}/{section}/{page}.do")
	public ModelAndView sysCdSectionPage(ModelAndView mav, @RequestParam Map<?, ?> map, HttpServletRequest request, @PathVariable("sysCd") String sysCd, @PathVariable("section") String section, @PathVariable("page") String page) throws PssException{
		String referer = request.getHeader("Referer");
		request.getSession().setAttribute("redirectURI", referer);
		
		String url = "";
		if(!sysCd.equals(String.valueOf(request.getSession().getAttribute("SYS_CD")))) {
			sysCd = String.valueOf(request.getSession().getAttribute("SYS_CD"));
			request.getSession().setAttribute("SYS_CD", sysCd);
			url = "redirect:/"+sysCd+"/"+section+"/"+page+".do";
		}else {
			if(ObjectUtils.isEmpty(map.get("page")) == false) {
				url = sysCd+"/"+section+"/pages/"+map.get("page");
			}else {
				if("user".equals(section) && 
						"login".equals(page) ||
						"register".equals(page)) {
					url = sysCd+"/"+section+"/"+page;
				}else {
					url = sysCd+"/"+section+"/"+page+"."+sysCd;
				}
			}
		}
		mav.setViewName(url);
		return mav;
	}
	
	/**
	 * 아이피 차단
	 * @param mav
	 * @param map
	 * @return
	 * @throws PssException
	 */
	@RequestMapping(value = "/cmmn/ipBlock.do")
	public ModelAndView cmmnIpBlock(ModelAndView mav, @RequestParam Map<?,?> map) throws PssException{
		mav.setViewName("cmmn/ipBlock");
		return mav;
	}
}