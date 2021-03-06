package com.creatorblue.cbitedu.system.service;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creatorblue.cbitedu.core.baseclass.service.BaseService;
import com.creatorblue.cbitedu.core.exception.ServiceException;
import com.creatorblue.cbitedu.system.domain.TsysRoleprivilege;
import com.creatorblue.cbitedu.system.persistence.TsysRoleprivilegeMapper;
/**
 * <p> Title: </p>
 * <p> Description:</p>
 * <p> Copyright: Copyright (c) 2014 </p>
 * <p> Company:hihsoft.co.,ltd </p>
 *
 * @author zhujw
 * @version 1.0
 */

@Service(value ="tsysRoleprivilegeService")
public class TsysRoleprivilegeService extends BaseService<TsysRoleprivilege> {
	@Autowired
	private TsysRoleprivilegeMapper<TsysRoleprivilege> mapper;
	//@Autowired允许业务逻辑层调用其他服务
	//private TsysUserService<TsysUser> tsysUserService;

	public TsysRoleprivilegeMapper<TsysRoleprivilege> getMapper() {
		return mapper;
	}
	
	public List selectPageTsysRoleprivilegeByMap(Map map) throws ServiceException {
		return getMapper().selectPageTsysRoleprivilegeByMap(map);

	}

	public List selectPageTsysRoleprivilege(TsysRoleprivilege roleprivilege) throws ServiceException {
		return getMapper().selectPageTsysRoleprivilege(roleprivilege);
	}

}
