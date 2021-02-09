package com.creatorblue.cbitedu.model.domain;


import java.util.Date;

import com.alibaba.fastjson.JSONObject;

public class ModelNew {
	
	private static final long serialVersionUID = 1L;
	
	public static final String TABLE_ALIAS = "新闻表";
	
	
		private static final String ALIAS_NewId="新闻ID";
		private static final String ALIAS_NewTitle="新闻标题";
		private static final String ALIAS_NewContent="新闻内容";
		private static final String ALIAS_NewReleTime="新闻发布时间";
		private static final String ALIAS_NewReleMan="新闻发布人";
		private static final String ALIAS_NewState="新闻状态";
		private static final String ALIAS_NewType="新闻类型";
		private static final String ALIAS_Creater="创建人";
		private static final String ALIAS_CreateDate="创建时间";
		private static final String ALIAS_EditDate="修改时间";
	
	
	
	
	private String  newId;
	private String  newTitle;
	private String  newContent;
	private String  newReleTime;
	private String  newReleMan;
	private Integer  newState;
	private String  newType;
	private String  creater;
	private String  createDate;
	private String  editDate;
	private ModelImg img;
	private ModelAudit audit;
	
	public ModelAudit getAudit() {
		return audit;
	}
	public void setAudit(ModelAudit audit) {
		this.audit = audit;
	}
	public ModelImg getImg() {
		return img;
	}
	public void setImg(ModelImg img) {
		this.img = img;
	}
	public void  setNewId(String newId){
		this.newId=newId;
	}
	public String  getNewId(){
		return newId;
	}
	
	public void  setNewTitle(String newTitle){
		this.newTitle=newTitle;
	}
	public String  getNewTitle(){
		return newTitle;
	}
	
	public void  setNewContent(String newContent){
		this.newContent=newContent;
	}
	public String  getNewContent(){
		return newContent;
	}
	
	public void  setNewReleTime(String newReleTime){
		this.newReleTime=newReleTime;
	}

	public String  getNewReleTime(){

		return newReleTime;
	}
	
	public void  setNewReleMan(String newReleMan){
		this.newReleMan=newReleMan;
	}
	public String  getNewReleMan(){
		return newReleMan;
	}
	
	public void  setNewState(Integer newState){
		this.newState=newState;
	}
	public Integer  getNewState(){
		return newState;
	}
	
	public void  setNewType(String newType){
		this.newType=newType;
	}
	public String  getNewType(){
		return newType;
	}
	
	public void  setCreater(String creater){
		this.creater=creater;
	}
	public String  getCreater(){
		return creater;
	}
	
	public void  setCreateDate(String createDate){
		this.createDate=createDate;
	}
	public String getCreateDate(){
		return createDate;
	}
	
	public void  setEditDate(String editDate){
		this.editDate=editDate;
	}
	public String  getEditDate(){
		return editDate;
	}
	
	@Override
	public String toString() {
		return JSONObject.toJSONString(this);
	}
}
