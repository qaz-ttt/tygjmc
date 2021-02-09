package com.creatorblue.cbitedu.model.domain;

import java.util.Date;

import com.alibaba.fastjson.JSONObject;

public class ModelAudit {
	
	private static final long serialVersionUID = 1L;
	
	public static final String TABLE_ALIAS = "审核表";
	
	
		private static final String ALIAS_AuditId="审核id";
		private static final String ALIAS_AuditPeople="审核人";
		private static final String ALIAS_AuditTime="审核时间";
		private static final String ALIAS_AuditResult="审核结果";
		private static final String ALIAS_AuditRemake="审核备注";
		private static final String ALIAS_Creater="创建者";
		private static final String ALIAS_CreateDate="创建日期";
		private static final String ALIAS_AuditType="审核类型";
		private static final String ALIAS_AuditState="审核状态";
	
	
	
	private String  auditId;
	private String  auditPeople;
	private String  auditTime;
	private String auditTitle;
	private String  auditResult;
	private String  auditRemake;
	private String  auditType;
	private String auditState;
	private String  creater;
	private String  createDate;
	
	
	
	
	public String getAuditTitle() {
		return auditTitle;
	}
	public void setAuditTitle(String auditTitle) {
		this.auditTitle = auditTitle;
	}
	public String getAuditState() {
		return auditState;
	}
	public void setAuditState(String auditState) {
		this.auditState = auditState;
	}
	public void  setAuditId(String auditId){
		this.auditId=auditId;
	}
	public String  getAuditId(){
		return auditId;
	}
	
	public void  setAuditPeople(String auditPeople){
		this.auditPeople=auditPeople;
	}
	public String  getAuditPeople(){
		return auditPeople;
	}
	
	public void  setAuditTime(String auditTime){
		this.auditTime=auditTime;
	}
	public String  getAuditTime(){
		return auditTime;
	}
	
	public void  setAuditResult(String auditResult){
		this.auditResult=auditResult;
	}
	public String  getAuditResult(){
		return auditResult;
	}
	
	public void  setAuditRemake(String auditRemake){
		this.auditRemake=auditRemake;
	}
	public String  getAuditRemake(){
		return auditRemake;
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
	
	public void  setAuditType(String auditType){
		this.auditType=auditType;
	}
	public String getAuditType(){
		return auditType;
	}
	

	@Override
	public String toString() {
		return JSONObject.toJSONString(this);
	}
}
