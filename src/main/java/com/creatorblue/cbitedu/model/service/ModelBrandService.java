package com.creatorblue.cbitedu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creatorblue.cbitedu.core.baseclass.persistence.BaseSqlMapper;
import com.creatorblue.cbitedu.core.baseclass.service.BaseService;
import com.creatorblue.cbitedu.model.domain.ModelBrand;
import com.creatorblue.cbitedu.model.persistence.ModelBrandMapper;

@Service
public class ModelBrandService<T> extends BaseService<T> {
	
	@Autowired
	private  ModelBrandMapper<T> mapper;

	@Override
	public ModelBrandMapper<T> getMapper() {
		return mapper;
	}
	
	public List selectPageByMap(Map<String, Object> param){
		return getMapper().selectPageByMap(param);
	}
	
	public ModelBrand selectByName(ModelBrand m) {
		return getMapper().selectByName(m);
	}


	public List selectBrand(ModelBrand modelBrand) {
		return getMapper().selectBrand(modelBrand);
	}
	
	public Integer selectCar(String id) {
		return getMapper().selectCar(id);
	}

}
