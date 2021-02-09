package com.creatorblue.cbitedu.model.domain;

import java.util.Date;

import com.alibaba.fastjson.JSONObject;

public class ModelBrand {
	
	private static final long serialVersionUID = 1L;
	
	public static final String TABLE_ALIAS = "品牌表";
	
	
		private static final String ALIAS_BrandId="品牌ID";
		private static final String ALIAS_ImgId="图片ID";
		private static final String ALIAS_BrandName="品牌类型";
		private static final String ALIAS_Creater="创建人";
		private static final String ALIAS_CreateDate="创建时间";
		private static final String ALIAS_EditDate="修改时间";
		private static final String ALIAS_BrandState="品牌状态";
	
	
	
	
	private String  brandId;
	private ModelImg  img;
	private String  brandName;
	private String  creater;
	private String  createDate;
	private String  editDate;
	private String  brandState;
	private ModelAudit audit;
	
	


	public ModelAudit getAudit() {
		return audit;
	}



	public void setAudit(ModelAudit audit) {
		this.audit = audit;
	}



	public String getBrandId() {
		return brandId;
	}



	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}



	public ModelImg getImg() {
		return img;
	}



	public void setImg(ModelImg img) {
		this.img = img;
	}



	public String getBrandName() {
		return brandName;
	}



	public void setBrandName(String brandName) {
		this.brandName = brandName;
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



	public String getBrandState() {
		return brandState;
	}



	public void setBrandState(String brandState) {
		this.brandState = brandState;
	}



	@Override
	public String toString() {
		return JSONObject.toJSONString(this);
	}
}
