package pss.cmmn.logger;

import java.math.BigDecimal;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StopWatch;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import pss.cmmn.logger.service.SystemLogService;
import pss.cmmn.logger.service.SystemLogVO;
import pss.cmmn.user.service.UserVO;

public class SystemLogAspect {
	
	@Resource(name = "systemLogService")
	private SystemLogService systemLogService;
	
	public Object systemSelectLog(ProceedingJoinPoint joinPoint) throws Throwable{
		SystemLogVO systemLogVO = new SystemLogVO();
		systemLogVO.setCrud("R");
		return insertSystemLog(joinPoint, systemLogVO);
	}
	public Object systemInsertLog(ProceedingJoinPoint joinPoint) throws Throwable{
		SystemLogVO systemLogVO = new SystemLogVO();
		systemLogVO.setCrud("C");
		return insertSystemLog(joinPoint, systemLogVO);
	}
	public Object systemUpdateLog(ProceedingJoinPoint joinPoint) throws Throwable{
		SystemLogVO systemLogVO = new SystemLogVO();
		systemLogVO.setCrud("U");
		return insertSystemLog(joinPoint, systemLogVO);
	}
	public Object systemDeleteLog(ProceedingJoinPoint joinPoint) throws Throwable{
		SystemLogVO systemLogVO = new SystemLogVO();
		systemLogVO.setCrud("D");
		return insertSystemLog(joinPoint, systemLogVO);
	}
	
	private Object insertSystemLog(ProceedingJoinPoint joinPoint, SystemLogVO systemLogVO) throws Throwable{
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		StopWatch stopWatch = new StopWatch();
		
		try {
			stopWatch.start();
			Object retValue = joinPoint.proceed();
			return retValue;
		}catch (Throwable e) {
			if(stopWatch.isRunning()) {
				stopWatch.stop();
			}
			
			if(ObjectUtils.isEmpty(request.getSession().getAttribute("userVO"))==true) {
				systemLogVO.setUserId("anonymous");
				systemLogVO.setUserNm("익명");
			}else {
				UserVO userVO = (UserVO) request.getSession().getAttribute("userVO");
				systemLogVO.setUserId(userVO.getUserId());
				systemLogVO.setUserNm(userVO.getUserNm());
			}
		}finally {
			if(stopWatch.isRunning()) {
				stopWatch.stop();
			}
			
			if(ObjectUtils.isEmpty(request.getSession().getAttribute("userVO"))==true) {
				systemLogVO.setUserId("anonymous");
				systemLogVO.setUserNm("익명");
			}else {
				UserVO userVO = (UserVO) request.getSession().getAttribute("userVO");
				systemLogVO.setUserId(userVO.getUserId());
				systemLogVO.setUserNm(userVO.getUserNm());
			}
			
			String clientIp = "";
			if("0:0:0:0:0:0:0:1".equals(request.getRemoteAddr())){
				clientIp = "127.0.0.1";
			}else{
				clientIp = request.getRemoteAddr();
			}
			String userNation = "";
			if(request.getHeader("accept-language") != null){
				String[] userNationArr =request.getHeader("accept-language").split(",");
				userNation = userNationArr[0];
			}else {
				userNation = "unknown";
			}
			
			systemLogVO.setUserIp(clientIp);
			systemLogVO.setReqUrl(request.getRequestURI());
			systemLogVO.setClassNm(joinPoint.getTarget().getClass().getName());
			systemLogVO.setMethodNm(joinPoint.getSignature().getName());
			systemLogVO.setElapseTime(BigDecimal.valueOf(stopWatch.getTotalTimeSeconds()));
			systemLogVO.setUserNation(userNation);
			systemLogVO.setSysCd(String.valueOf(request.getSession().getAttribute("SYS_CD")));
			
			@SuppressWarnings("unused")
			String args = "";
			Object[] signatureArgs = joinPoint.getArgs();
			for(Object signatureArg : signatureArgs) {
				args += signatureArg;
			}
			
			systemLogVO.setArgs(args);
			
			systemLogService.insertSystemLog(systemLogVO);
		}
		
		return null;
	}
	
}