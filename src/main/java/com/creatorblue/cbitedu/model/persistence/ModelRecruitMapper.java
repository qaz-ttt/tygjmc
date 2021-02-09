package com.creatorblue.cbitedu.model.persistence;

import java.util.List;
import java.util.Map;

import org.apache.poi.ss.formula.functions.T;

import com.creatorblue.cbitedu.core.baseclass.persistence.BaseSqlMapper;
import com.creatorblue.cbitedu.model.domain.ModelRecruit;


public interface ModelRecruitMapper<T> extends BaseSqlMapper<T> {
	
	//查询
	public List selectPageModelRecruitByMap(Map<String, Object> para);
	
	//回滚
	public ModelRecruit selectById(String aaa);
	
	//新增
	public void add(ModelRecruit recruit);
	
	
	
	//修改
	public void update(ModelRecruit recruit); 
	
	//删除
	public void del(String id);
	
	public List selectexist(ModelRecruit recruit);
	
	
	//前端
	public List selectPageByMap(ModelRecruit recruit);

	
	

}
