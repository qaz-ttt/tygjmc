package com.creatorblue.cbitedu.model.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.creatorblue.cbitedu.core.baseclass.persistence.BaseSqlMapper;
import com.creatorblue.cbitedu.model.domain.ModelDict;
import com.creatorblue.cbitedu.model.domain.ModelImg;

public interface ModelImgMapper<T> extends BaseSqlMapper<T> {
	
	public void add(ModelImg img);
	
	
	List<T> selectPageByMap(Map<String, Object> param);
	
	List selectByType();
	
	//List<ModelImg> selectByTypeCode();
  
	

	List selectBeach(String[] imgId);


}
