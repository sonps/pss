package pss.cmmn.menu.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import pss.cmmn.exception.PssException;
import pss.cmmn.menu.mapper.MenuMapper;
import pss.cmmn.menu.service.MenuService;
import pss.cmmn.menu.service.UserAuthorVO;
import pss.cmmn.service.MyBatisTransactionManager;
import pss.cmmn.service.PssAbstractServiceImpl;
import pss.cmmn.user.service.UserVO;

@Service("menuService")
public class MenuServiceImpl extends PssAbstractServiceImpl implements MenuService{

	Logger log = Logger.getLogger(this.getClass());
	
	private MyBatisTransactionManager transaction;
	
	@Resource(name = "menuMapper")
	private MenuMapper menuMapper;

}