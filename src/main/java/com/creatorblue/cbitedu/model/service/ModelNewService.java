package com.creatorblue.cbitedu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creatorblue.cbitedu.model.domain.ModelNew;
import com.creatorblue.cbitedu.model.persistence.ModelNewMapper;

@Service
public class ModelNewService {

	@Autowired
	private ModelNewMapper<ModelNew> modelnew;

	public List<ModelNew> select(Map<String, Object> param) {
		return modelnew.select(param);
	}

	public void delete(String id) {
		modelnew.delete(id);
	}

	public void update(ModelNew n) {
	     modelnew.update(n);
	}

	public void insert(ModelNew n) {
		 modelnew.insert(n);
	}

	public ModelNew selectnewById(String id) {
		return modelnew.selectnewById(id);
	}
	
	public ModelNew selectBytitle(ModelNew n ) {
		return modelnew.selectBytitle(n);
	}
	//企业新闻
	public List<ModelNew> selectByEnterprise(ModelNew news) {
		return modelnew.selectByEnterprise(news);
	}
	
	public ModelNew selectContentById(String id) {
		return modelnew.selectContentById(id);
	}
	
	public ModelNew selectnewByAudit(String auditId) {
		return modelnew.selectNewByAudit(auditId);
	}
	
}
