package com.creatorblue.cbitedu.model.persistence;

import java.util.List;
import java.util.Map;

import com.creatorblue.cbitedu.core.baseclass.persistence.BaseSqlMapper;

public interface ModelQuestionMapper<T> extends BaseSqlMapper<T>{
	
	/*
	 * 查询
	 */
	List<T> selectPageByMap(Map<String, Object> param);

}
