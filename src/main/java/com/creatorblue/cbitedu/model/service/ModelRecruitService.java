package com.creatorblue.cbitedu.model.service;



import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creatorblue.cbitedu.core.baseclass.service.BaseService;
import com.creatorblue.cbitedu.core.exception.ServiceException;
import com.creatorblue.cbitedu.model.domain.ModelRecruit;
import com.creatorblue.cbitedu.model.persistence.ModelRecruitMapper;




@Service(value ="ModelRecruitService")
public class ModelRecruitService<T>  extends BaseService<T> {
	
	@Autowired
	private ModelRecruitMapper<T> mapper;

	@Override
	public ModelRecruitMapper<T> getMapper() {
		return mapper;
	}



	//查询
	public List select1(Map map) {
		List<ModelRecruit> list = getMapper().selectPageModelRecruitByMap(map);
		return list;
	}
	
	
	//回滚数据
	public ModelRecruit selectById(String id) {
		if(id!=null && id.equals(""));
		ModelRecruit recruit = getMapper().selectById(id);
		return recruit;
	}
	
	public void del(String ids) {
		getMapper().del(ids);
		
	}
	
	//添加
	public void add(ModelRecruit recruit) {
		getMapper().add(recruit);
	}
	
	public void update1(ModelRecruit recruit) {
		getMapper().update(recruit);
	}
	
	public List selectexist(ModelRecruit recruit) {
		List list = getMapper().selectexist(recruit);
		return list;
	}
	//前端
	public List selectPageByMap(ModelRecruit recruit){
		return mapper.selectPageByMap(recruit);
	}
	
	
	
	

}
