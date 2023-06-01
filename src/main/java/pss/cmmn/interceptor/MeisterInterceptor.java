package pss.cmmn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;

import pss.cmmn.exception.PssException;

public class MeisterInterceptor implements HandlerInterceptor{

	Logger log = Logger.getLogger(this.getClass());
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws PssException, Exception{
		if(!"MEISTER".equals(request.getSession().getAttribute("USER_AUTH"))){
            response.sendRedirect(request.getContextPath()+"/"+request.getSession().getAttribute("SYS_CD")+"/user/login.do");
            return false;
        }
        return true;
	}
}