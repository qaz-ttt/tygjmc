package com.creatorblue.cbitedu.model.domain;

import java.util.Date;

import com.alibaba.fastjson.JSONObject;

public class ModelRecruit {
	
	private static final long serialVersionUID = 1L;
	
	public static final String TABLE_ALIAS = "招聘表";
	
	
		private static final String ALIAS_RecruitId="招聘ID";
		private static final String ALIAS_RecruitTitle="招聘标题";
		private static final String ALIAS_ReruitName="招聘岗位";
		private static final String ALIAS_ReruitContent="招聘内容";
		private static final String ALIAS_ReruitPay="招聘薪资";
		private static final String ALIAS_ReruitNum="招聘人数";
		private static final String ALIAS_ReruitMan="联系人";
		private static final String ALIAS_ReruitContactsPhone="联系方式";
		private static final String ALIAS_EndTime="截至时间";
		private static final String ALIAS_Creater="创建人";
		private static final String ALIAS_CreateDate="创建时间";
		private static final String ALIAS_EditDate="修改时间";
		private static final String ALIAS_AuditId="审核";
	
	
	
	
	private String  recruitId;
	private String  recruitTitle;
	private String  reruitName;
	private String  reruitContent;
	private String  reruitPay;
	private Integer  reruitNum;
	private String  reruitMan;
	private String  reruitContactsPhone;
	private String  endTime;
	private String  creater;
	private String  createDate;
	private String  editDate;
	private ModelAudit  audit;
	
	
	
	
	public String getRecruitId() {
		return recruitId;
	}




	public void setRecruitId(String recruitId) {
		this.recruitId = recruitId;
	}




	public String getRecruitTitle() {
		return recruitTitle;
	}




	public void setRecruitTitle(String recruitTitle) {
		this.recruitTitle = recruitTitle;
	}




	public String getReruitName() {
		return reruitName;
	}




	public void setReruitName(String reruitName) {
		this.reruitName = reruitName;
	}




	public String getReruitContent() {
		return reruitContent;
	}




	public void setReruitContent(String reruitContent) {
		this.reruitContent = reruitContent;
	}




	public String getReruitPay() {
		return reruitPay;
	}




	public void setReruitPay(String reruitPay) {
		this.reruitPay = reruitPay;
	}




	public Integer getReruitNum() {
		return reruitNum;
	}




	public void setReruitNum(Integer reruitNum) {
		this.reruitNum = reruitNum;
	}




	public String getReruitMan() {
		return reruitMan;
	}




	public void setReruitMan(String reruitMan) {
		this.reruitMan = reruitMan;
	}




	public String getReruitContactsPhone() {
		return reruitContactsPhone;
	}




	public void setReruitContactsPhone(String reruitContactsPhone) {
		this.reruitContactsPhone = reruitContactsPhone;
	}




	public String getEndTime() {
		return endTime;
	}




	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}




	public String getCreater() {
		return creater;
	}




	public void setCreater(String creater) {
		this.creater = creater;
	}




	public String getCreateDate() {
		return createDate;
	}




	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}




	public String getEditDate() {
		return editDate;
	}




	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}




	public ModelAudit getAudit() {
		return audit;
	}




	public void setAudit(ModelAudit audit) {
		this.audit = audit;
	}




	@Override
	public String toString() {
		return JSONObject.toJSONString(this);
	}
}
