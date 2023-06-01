package pss.cmmn.logger.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import pss.cmmn.exception.PssException;
import pss.cmmn.ipCheck.mapper.IpCheckMapper;
import pss.cmmn.ipCheck.service.IpCheckVO;
import pss.cmmn.logger.mapper.SystemLogMapper;
import pss.cmmn.logger.service.AccessCntVO;
import pss.cmmn.logger.service.SystemLogService;
import pss.cmmn.logger.service.SystemLogVO;
import pss.cmmn.menu.mapper.MenuMapper;
import pss.cmmn.menu.service.UserAuthorVO;
import pss.cmmn.service.PssAbstractServiceImpl;
import pss.cmmn.user.service.UserVO;

@Service("systemLogService")
public class SystemLogServiceImpl extends PssAbstractServiceImpl implements SystemLogService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "systemLogMapper")
	private SystemLogMapper systemLogMapper;
	
	@Resource(name = "ipCheckMapper")
	private IpCheckMapper ipCheckMapper;
	
	@Resource(name = "menuMapper")
	private MenuMapper menuMapper;

	@Override
	public void insertSystemLog(SystemLogVO systemLogVO) throws PssException {
		systemLogMapper.insertSystemLog(systemLogVO);
	}

	@Override
	public List<Map<String, Object>> getAccessCntList(AccessCntVO accessCntVO) throws PssException {
		return systemLogMapper.getAccessCntList(accessCntVO);
	}

	@Override
	public int insertAccessCnt(AccessCntVO accessCntVO) throws PssException {
		return systemLogMapper.insertAccessCnt(accessCntVO);
	}

	@Override
	public int updateAccessCnt(AccessCntVO accessCntVO) throws PssException {
		return systemLogMapper.updateAccessCnt(accessCntVO);
	}
	
	@Override
	public IpCheckVO getIpCheck(HttpServletRequest request) throws PssException {
		IpCheckVO ipCheckVO = new IpCheckVO();
		
		String clientIp = "";
		if("0:0:0:0:0:0:0:1".equals(request.getRemoteAddr())) {
			clientIp = "127.0.0.1";
		}else {
			clientIp = request.getRemoteAddr();
		}
		
		ipCheckVO.setClientIp(clientIp);
		ipCheckVO.setSysCd(String.valueOf(request.getSession().getAttribute("SYS_CD")));
		return ipCheckMapper.getIpCheck(ipCheckVO);
	}

	@Override
	public List<Map<String, Object>> getMenuList(HttpServletRequest request) throws PssException {
		
		UserAuthorVO userAuthorVO = new UserAuthorVO();
		
		if(ObjectUtils.isEmpty(request.getSession().getAttribute("userVO"))==true) {
			userAuthorVO.setSysCd(String.valueOf(request.getSession().getAttribute("SYS_CD")));
		}else {
			UserVO userVO = (UserVO) request.getSession().getAttribute("userVO");
			userAuthorVO.setSysCd(userVO.getSysCd());
			userAuthorVO.setUserUuid(userVO.getUserUuid());
		}
		
		return menuMapper.getMenuList(userAuthorVO);
	}
	
}