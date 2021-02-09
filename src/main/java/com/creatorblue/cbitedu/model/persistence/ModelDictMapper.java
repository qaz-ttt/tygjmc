package com.creatorblue.cbitedu.model.persistence;

import java.util.List;
import java.util.Map;

import com.creatorblue.cbitedu.model.domain.ModelDict;

public interface ModelDictMapper {
	
	//列表
	public  List<ModelDict> selectByType();
	
	//查询和模糊查询
	public  List<ModelDict> select(Map map);
	
	//新增
	public  void add(ModelDict dict);
	
	//修改
	public void edit(ModelDict dict);
	
	//删除
	public void del(String id);
	
	//回滚
	public ModelDict selectById(String id);
	
	//是否存在
	public List selectexist(ModelDict dict);
	
	//图片类型
	 public List<ModelDict> selectImgType();
	 
	
	//站点类型 
	public List<ModelDict> selectInformationType();
	 
	//标题重复
	public Integer selectCountBytitle(String carName);
}
