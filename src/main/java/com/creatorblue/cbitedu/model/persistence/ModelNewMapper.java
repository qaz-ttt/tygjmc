package com.creatorblue.cbitedu.model.persistence;

import java.util.List;
import java.util.Map;

import com.creatorblue.cbitedu.core.baseclass.persistence.BaseSqlMapper;
import com.creatorblue.cbitedu.model.domain.ModelNew;
import com.creatorblue.cbitedu.model.domain.ModelRecruit;

 public interface ModelNewMapper<T> extends BaseSqlMapper<T>  {
	 
	 public  ModelNew selectnewById(String id);
	  
	  List<ModelNew> select(Map<String, Object> param);
	  
	  ModelNew selectBytitle(ModelNew n);
	  
	  //页面显示企业新闻
	  List<ModelNew> selectByEnterprise(ModelNew news);
	  
	  
 
	  ModelNew selectContentById(String id);
	  
	  ModelNew selectNewByAudit(String auditId);
	  
	  
}
