package com.creatorblue.cbitedu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creatorblue.cbitedu.core.baseclass.service.BaseService;
import com.creatorblue.cbitedu.model.domain.ModelCar;
import com.creatorblue.cbitedu.model.persistence.ModelCarMapper;
@Service
public class ModelCarService<T> extends BaseService<T>{
	@Autowired
	private ModelCarMapper<T> mapper;

	@Override
	public ModelCarMapper<T> getMapper() {
		// TODO Auto-generated method stub
		return mapper;
	}
	public List selectPageByMap(Map<String, Object> param){
		return getMapper().selectPageByMap(param);
	}
	
	public void updateImg(Map map) {
		getMapper().updateImg(map);
	}
	public ModelCar selectByAudit(String auditId) {
		return getMapper().selectByAudit(auditId);
	}

	public Integer selectCountBytitle(String carName) {
		return  getMapper().selectCountBytitle(carName);
	}
}
