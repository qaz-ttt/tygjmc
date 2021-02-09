package com.creatorblue.cbitedu.model.persistence;

import java.util.List;
import java.util.Map;

import com.creatorblue.cbitedu.core.baseclass.persistence.BaseSqlMapper;
import com.creatorblue.cbitedu.model.domain.ModelAudit;
import com.creatorblue.cbitedu.model.domain.ModelRecruit;

public interface ModelAuditMapper<T> extends BaseSqlMapper<T> {
	
	/*
	 * 查询
	 */
	List<T> selectPageByMap(Map<String, Object> param);
	
	
	//回滚
	 ModelAudit selectById(String id);
	 
	//检查是否存在
	List selectexist(ModelAudit audit);
	
	//新增
	void add(ModelAudit audit);
	
	//修改
	void edit(ModelAudit audit);
	
	//删除
	void del(String id);
	 
	List selectByType() ;
}
