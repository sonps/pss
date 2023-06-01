package pss.cmmn.service;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;

public class PssAbstractServiceImpl extends EgovAbstractServiceImpl{

	@Autowired(required = false)
	@Qualifier("sqlSession")
	protected SqlSessionTemplate sqlSession;
	
	@Autowired
	ApplicationContext applicationContext;
	
	public MyBatisTransactionManager getTransactionManager() {
		return applicationContext.getBean(MyBatisTransactionManager.class);
	}
}