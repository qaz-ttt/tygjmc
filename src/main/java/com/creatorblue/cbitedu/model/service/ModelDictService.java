package com.creatorblue.cbitedu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.creatorblue.cbitedu.model.domain.ModelDict;

import com.creatorblue.cbitedu.model.persistence.ModelDictMapper;


@Service(value ="ModelDictService")
public class ModelDictService<T> {
	
	@Autowired
	private ModelDictMapper mapper;
	
	
	//列表下拉
	public List list() {
			List<ModelDict> list = mapper.selectByType();
		return list;
	}
	
	
	
	//查询
	public List select(Map map) {
		List<ModelDict> list = mapper.select(map);
		return list;
	}
	
	//跳转
	public ModelDict selectById(String id) {
		ModelDict dict = mapper.selectById(id);
		return dict;
	}
	
	//新增
	public void add(ModelDict dict) {
		mapper.add(dict);
	}
	
	//修改
	public void edit(ModelDict dict) {
		mapper.edit(dict);
	}

	//修改
	public void del(String id) {
			mapper.del(id);
	}
	
	public List selectexist(ModelDict dict) {
		List list = mapper.selectexist(dict);
		return list;
	}
	
	//图片类型
	public List<ModelDict> selectImgType() {
		return mapper.selectImgType();
	}
	
	//站点类型 
	public List<ModelDict> selectInformationType() { 
		return mapper.selectInformationType(); 
	}
	 
}
