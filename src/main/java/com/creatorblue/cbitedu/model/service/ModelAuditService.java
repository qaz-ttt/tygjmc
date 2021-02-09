package com.creatorblue.cbitedu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creatorblue.cbitedu.core.baseclass.service.BaseService;
import com.creatorblue.cbitedu.model.persistence.ModelAuditMapper;

@Service
public class ModelAuditService<T> extends BaseService<T> {
	@Autowired
	private ModelAuditMapper<T> mapper;
	
	@Override
	public ModelAuditMapper<T> getMapper() {
		return mapper;
	}
	
	public List selectByType(){
		return getMapper().selectByType();
	}
	
	public List selectPageByMap(Map<String, Object> param){
		return getMapper().selectPageByMap(param);
	}
	
	
	
	
	
	
	
	
	
	
}
