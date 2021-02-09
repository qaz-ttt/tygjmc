package com.creatorblue.cbitedu.model.domain;

import com.alibaba.fastjson.JSONObject;

public class ModelInformation {
	
	private static final long serialVersionUID = 1L;
	

	
	
		private static final String ALIAS_InfoId="信息ID";
		private static final String ALIAS_InfoName="信息名称";
		private static final String ALIAS_InfoValue="信息值";
		private static final String ALIAS_CreateString="创建时间";
		private static final String ALIAS_Creater="创建人";
		private static final String ALIAS_EditString="修改时间";
	
	
	
	
	private String  infoId;
	
	private String  infoName;
	private String  infoValue;
	private String  createDate;
	private String  creater;
	private String  editDate;
	private Integer orderId;
	private String orderIds;
	public String getOrderIds() {
		return String.valueOf(orderId);
	}





	private String infoType;



	
	
	public String getInfoType() {
		return infoType;
	}


public void setInfoType(String infoType) {
		this.infoType = infoType;
	}





	public Integer getOrderId() {
		return orderId;
	}





	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}





	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}





	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}





	public String getInfoId() {
		return infoId;
	}





	public void setInfoId(String infoId) {
		this.infoId = infoId;
	}


	public String getInfoName() {
		return infoName;
	}





	public void setInfoName(String infoName) {
		this.infoName = infoName;
	}





	public String getInfoValue() {
		return infoValue;
	}





	public void setInfoValue(String infoValue) {
		this.infoValue = infoValue;
	}





	public String getCreateDate() {
		return createDate;
	}





	public void setCreateString(String createDate) {
		this.createDate = createDate;
	}





	public String getCreater() {
		return creater;
	}





	public void setCreater(String creater) {
		this.creater = creater;
	}





	public String getEditDate() {
		return editDate;
	}





	public void setEditString(String editDate) {
		this.editDate = editDate;
	}





	@Override
	public String toString() {
		return JSONObject.toJSONString(this);
	}
}
