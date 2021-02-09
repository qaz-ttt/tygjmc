package com.creatorblue.cbitedu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creatorblue.cbitedu.core.baseclass.service.BaseService;
import com.creatorblue.cbitedu.model.domain.ModelInformation;
import com.creatorblue.cbitedu.model.persistence.ModelQuestionMapper;

@Service
public class ModelQuestionService<T> extends BaseService<T>{
	
	@Autowired
	private ModelQuestionMapper<T> mapper;
	
	@Override
	public ModelQuestionMapper<T> getMapper() {
		// TODO Auto-generated method stub
		return mapper;
	}
	
	public List selectPageByMap(Map map){
		return getMapper().selectPageByMap(map);
	}

}
