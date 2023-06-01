package pss.cmmn.interceptor;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import pss.cmmn.exception.PssException;
import pss.cmmn.ipCheck.service.IpCheckVO;
import pss.cmmn.logger.service.AccessCntVO;
import pss.cmmn.logger.service.SystemLogService;
import pss.cmmn.menu.service.MenuService;

public class LoggerInterceptor implements HandlerInterceptor{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "systemLogService")
	private SystemLogService systemLogService;
	
	@Resource(name = "menuService")
	private MenuService menuService;
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws PssException, Exception{
		request.setAttribute("mi.beginTime", System.currentTimeMillis());
        if(log.isDebugEnabled()){
            log.debug("============================== 시작 ==============================");
            log.debug("Request URI \t:"+request.getRequestURI());
        }
        
        Enumeration<?> enumeration = request.getParameterNames();
        String key = null;
        String[] values = null;
        while (enumeration.hasMoreElements()){
            key = (String) enumeration.nextElement();
            values = request.getParameterValues(key);
            if((values.length > 1)){
                for (int i=0;i<values.length;i++) {
                    log.debug("key : " + key + ", value : " + values[i]);
                }
            }else{
                log.debug("key : "+key+", value : "+ values[0]);
            }
        }
        
        /**
         * RSA 암호화 관련 세션 생성여부
         */
        if(request.getSession().getAttribute("_RSA_WEB_Key_") == null){
        	KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
			generator.initialize(1024);
			KeyPair keyPair = generator.genKeyPair();
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			PublicKey publicKey = keyPair.getPublic();
			PrivateKey privateKey = keyPair.getPrivate();
			
			request.getSession().setAttribute("_RSA_WEB_Key_", privateKey);
			
			RSAPublicKeySpec publicKeySpec = (RSAPublicKeySpec)keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			String publicKeyModulus = publicKeySpec.getModulus().toString(16);
			String publicKeyExponent = publicKeySpec.getPublicExponent().toString(16);
			
			request.getSession().setAttribute("RSAModulus", publicKeyModulus);
			request.getSession().setAttribute("RSAExponent", publicKeyExponent);
			log.debug("rsa세션 생성...");
        }
        
        /**
         * SYS_CD 확인
         */
        if(ObjectUtils.isEmpty(request.getSession().getAttribute("SYS_CD")) == true) {
        	log.error("SYS_CD가 없습니다!");
        	throw new RuntimeException();
        }else {
        	/**
             * 접속 카운트
             */
            AccessCntVO accessCntVO = new AccessCntVO();
            
            accessCntVO.setSysCd(String.valueOf(request.getSession().getAttribute("SYS_CD")));
            accessCntVO.setSessionId(request.getSession().getId());
            
            /**
             * 로컬 호스트가 아닐 시
             */
            if(!"127.0.0.1".equals(request.getRemoteAddr()) && !"0:0:0:0:0:0:0:1".equals(request.getRemoteAddr()) && !"::1".equals(request.getRemoteAddr())) {
            	
	            List<Map<String,Object>> accessCntList = systemLogService.getAccessCntList(accessCntVO);
	            if(accessCntList.size() < 1) {
	            	systemLogService.insertAccessCnt(accessCntVO);
	            }
	            /* else {
	            	systemLogService.updateAccessCnt(accessCntVO);
	            } */
	            
            }
            
            /**
             * 아이피 체크
             */
            if(!request.getRequestURI().equals(request.getContextPath()+"/cmmn/ipBlock.do")) {
            	IpCheckVO ipCheckVO = systemLogService.getIpCheck(request);
            	if(ipCheckVO != null) {
            		if("Y".equals(ipCheckVO.getAllwYn())) {
            			if("N".equals(ipCheckVO.getIpYn())) {
            				response.sendRedirect(request.getContextPath()+"/cmmn/ipBlock.do");
            				return false;
            			}
            		}else if("N".equals(ipCheckVO.getAllwYn())) {
            			if("Y".equals(ipCheckVO.getIpYn())) {
            				response.sendRedirect(request.getContextPath()+"/cmmn/ipBlock.do");
            				return false;
            			}
            		}
            	}else {
            		response.sendRedirect(request.getContextPath()+"/cmmn/ipBlock.do");
    				return false;
            	}
            	
            	List<Map<String,Object>> menuList = systemLogService.getMenuList(request);
            	for(Map<String,Object> map : menuList) {
            		String url = request.getContextPath()+map.get("pg_url").toString();
            		String menuPermitted = map.get("mn_permitted").toString();
            		log.debug("@@@"+request.getRequestURI());
            		log.debug("!!!"+url);
            		log.debug(request.getRequestURI()+"@@@"+url+"!!!"+menuPermitted);
            		
            		if(request.getRequestURI().equals(url) && "N".equals(menuPermitted)) {
		        		response.sendRedirect(request.getContextPath()+"/cmmn/ipBlock.do");
		        		return false;
		        	}
            	}
            	
            	request.getSession().setAttribute("menuList", menuList);
		        request.getSession().setAttribute("nowPURL", request.getRequestURI());
            }
        }
        
        return true;
	}
	
	@Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws PssException{
        if(log.isDebugEnabled()){
            log.debug("============================== postHandle 실행 ==============================");
        }
    }
	
	@Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws PssException{
        Long beginTime = (Long)request.getAttribute("mi.beginTime");
        long endTime = System.currentTimeMillis();
        if(log.isDebugEnabled()){
            log.debug(request.getRequestURI()+" 실행시간:"+(endTime - beginTime)+" ms");
            log.debug("============================== 끝 ==============================\n");
        }
    }
}