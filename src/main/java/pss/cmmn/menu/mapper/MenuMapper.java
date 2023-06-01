package pss.cmmn.menu.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import pss.cmmn.exception.PssException;
import pss.cmmn.menu.service.UserAuthorVO;

@Mapper("menuMapper")
public interface MenuMapper {

	/**
	 * SYS_CD별 menu List
	 * @param userAuthorVO
	 * @return List
	 * @throws PssException
	 */
	List<Map<String, Object>> getMenuList(UserAuthorVO userAuthorVO) throws PssException;

}