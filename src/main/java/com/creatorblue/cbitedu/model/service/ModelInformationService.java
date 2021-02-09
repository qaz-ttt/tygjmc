package com.creatorblue.cbitedu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creatorblue.cbitedu.core.baseclass.service.BaseService;
import com.creatorblue.cbitedu.model.domain.ModelInformation;
import com.creatorblue.cbitedu.model.persistence.ModelInformationMapper;

@Service
public class ModelInformationService<T> extends BaseService<T>{
	@Autowired
	private ModelInformationMapper<T> mapper;

	@Override
	public ModelInformationMapper<T> getMapper() {
		return mapper;
	}
	
	public List selectPageByMap(Map<String, Object> param){
		return getMapper().selectPageByMap(param);
	}
	public ModelInformation selectByName(ModelInformation information) {
		return mapper.selectByName(information);
	}
	
}
