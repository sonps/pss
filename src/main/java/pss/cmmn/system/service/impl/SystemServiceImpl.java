package pss.cmmn.system.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import pss.cmmn.exception.PssException;
import pss.cmmn.service.MyBatisTransactionManager;
import pss.cmmn.service.PssAbstractServiceImpl;
import pss.cmmn.system.mapper.SystemMapper;
import pss.cmmn.system.service.SystemService;
import pss.cmmn.system.service.SystemVO;

@Service("systemService")
public class SystemServiceImpl extends PssAbstractServiceImpl implements SystemService{

	Logger log = Logger.getLogger(this.getClass());
	
	private MyBatisTransactionManager transaction;
	
	@Resource(name = "systemMapper")
	private SystemMapper systemMapper;
	
	@Override
	public List<?> getOtherSystemList(SystemVO systemVO) throws PssException {
		return systemMapper.getOtherSystemList(systemVO);
	}

}