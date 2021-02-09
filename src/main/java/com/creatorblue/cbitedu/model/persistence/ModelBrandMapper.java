 package com.creatorblue.cbitedu.model.persistence;

import java.util.List;
import java.util.Map;

import com.creatorblue.cbitedu.core.baseclass.persistence.BaseSqlMapper;
import com.creatorblue.cbitedu.model.domain.ModelBrand;

public interface ModelBrandMapper<T> extends BaseSqlMapper<T> {
	
	List<T> selectPageByMap(Map<String, Object> param);
	

	ModelBrand selectByName(ModelBrand  m);

	List<ModelBrand> selectBrand(ModelBrand modelBrand);
	
	Integer selectCar(String id);
}
