package com.creatorblue.cbitedu.model.domain;

import java.sql.Date;

import com.alibaba.fastjson.JSONObject;

public class ModelDict {
	
	private static final long serialVersionUID = 1L;
	
	public static final String TABLE_ALIAS = "字典表";
	
	
		private static final String ALIAS_DictId="字典ID";
		private static final String ALIAS_DictType="字典类型";
		
		private static final String ALIAS_DictValue="字典值";
		private static final String ALIAS_DictNo="排序号";
		private static final String ALIAS_Creater="创建人";
		private static final String ALIAS_CreateDate="创建时间";
		private static final String ALIAS_EditDate="修改时间";
	
	
	private String  dictId;
	private String  dictType;
	private String  dictValue;
	private String  dictNo;
	private String  creater;
	private Date  createDate;
	private Date  editDate;
	
	public void  setDictId(String dictId){
		this.dictId=dictId;
	}
	public String  getDictId(){
		return dictId;
	}
	
	public void  setDictType(String dictType){
		this.dictType=dictType;
	}
	public String  getDictType(){
		return dictType;
	}
	
	public void  setDictValue(String dictValue){
		this.dictValue=dictValue;
	}
	public String  getDictValue(){
		return dictValue;
	}
	
	public void  setDictNo(String dictNo){
		this.dictNo=dictNo;
	}
	public String  getDictNo(){
		return dictNo;
	}
	
	public void  setCreater(String creater){
		this.creater=creater;
	}
	public String  getCreater(){
		return creater;
	}
	
	public void  setCreateDate(Date createDate){
		this.createDate=createDate;
	}
	public Date  getCreateDate(){
		return createDate;
	}
	
	public void  setEditDate(Date editDate){
		this.editDate=editDate;
	}
	public Date  getEditDate(){
		return editDate;
	}
	
	
	@Override
	public String toString() {
		return JSONObject.toJSONString(this);
	}
}
