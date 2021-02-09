package com.creatorblue.cbitedu.model.domain;

import java.util.Date;

import com.alibaba.fastjson.JSONObject;

public class ModelQuestion {
	
	private static final long serialVersionUID = 1L;
	
	public static final String TABLE_ALIAS = "问题表";
		
	private static final String ALIAS_QuestionId="问题ID";
	private static final String ALIAS_QuestionTitle="问题标题";
	private static final String ALIAS_QuestionContent="问题内容";
	private static final String ALIAS_Creater="创建人";
	private static final String ALIAS_CreateDate="创建时间";
	private static final String ALIAS_EditDate="修改时间";
	private static final String ALIAS_QuestionState="问题状态";
	
	
	
	
	private String  questionId;
	private String  questionTitle;
	private String  questionContent;
	private String  creater;
	private String  createDate;
	private String  editDate;
	
	
	public void  setQuestionId(String questionId){
		this.questionId=questionId;
	}
	public String  getQuestionId(){
		return questionId;
	}
	
	public void  setQuestionTitle(String questionTitle){
		this.questionTitle=questionTitle;
	}
	public String  getQuestionTitle(){
		return questionTitle;
	}
	
	public void  setQuestionContent(String questionContent){
		this.questionContent=questionContent;
	}
	public String  getQuestionContent(){
		return questionContent;
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
	public String  getCreateDate(){
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
