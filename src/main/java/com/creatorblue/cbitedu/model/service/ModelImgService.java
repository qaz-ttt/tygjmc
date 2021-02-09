package com.creatorblue.cbitedu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creatorblue.cbitedu.core.baseclass.service.BaseService;
import com.creatorblue.cbitedu.model.domain.ModelDict;
import com.creatorblue.cbitedu.model.domain.ModelImg;
import com.creatorblue.cbitedu.model.persistence.ModelImgMapper;


@Service(value ="ModelImmgService")
public class ModelImgService<T> extends BaseService<T>{
	
	@Autowired
	private ModelImgMapper<T> imgMapper;
	
	@Override
	public ModelImgMapper<T> getMapper() {                         
		// TODO Auto-generated method stub
		return imgMapper;
	}
	
	public void add(ModelImg img) {
		imgMapper.add(img);
	}
	
	public List selectPageByMap(Map<String, Object> param){
		return getMapper().selectPageByMap(param);
	}
	
	public List selectByType() {
		return imgMapper.selectByType();
	}

	/*
	 * public List<ModelImg> selectByTypeCode() { return
	 * imgMapper.selectByTypeCode(); }
	 */
	

	public List selectBeach(String[] imgId) {
		return imgMapper.selectBeach(imgId);

	}
}
