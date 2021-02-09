package com.creatorblue.cbitedu.model.persistence;

import java.util.List;
import java.util.Map;

import com.creatorblue.cbitedu.core.baseclass.persistence.BaseSqlMapper;
import com.creatorblue.cbitedu.model.domain.ModelCar;

public interface ModelCarMapper<T> extends BaseSqlMapper<T>{
	
	/*
	 * 查询
	 */
	List<T> selectPageByMap(Map<String, Object> param);
	
	void updateImg(Map map);
	
	ModelCar selectByAudit(String auditId);

	Integer selectCountBytitle(String carName);
    
}
