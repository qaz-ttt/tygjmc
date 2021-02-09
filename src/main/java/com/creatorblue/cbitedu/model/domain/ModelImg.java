package com.creatorblue.cbitedu.model.domain;

import java.util.Date;

import com.alibaba.fastjson.JSONObject;

public class ModelImg {
	
	private static final long serialVersionUID = 1L;
	
	public static final String TABLE_ALIAS = "图片表";
	
	
		private static final String ALIAS_ImgId="图片ID";
		private static final String ALIAS_ImgName="图片名称";
		private static final String ALIAS_ImgUrl="图片路径";
		private static final String ALIAS_ImgStartTime="图片生效时间";
		private static final String ALIAS_ImgEndTime="图片失效时间";
		private static final String ALIAS_ImgUploadTime="图片上传时间";
		private static final String ALIAS_ImgType="图片类型";
		private static final String ALIAS_Creater="创建人";
		private static final String ALIAS_CreateDate="创建时间";
		private static final String ALIAS_EditDate="修改时间";
		
	
	
	
	
	private String  imgId;
	private String imgName;
	private String  imgUrl;
	private String  imgStartTime;
	private String  imgEndTime;
	private String  imgUploadTime;
	private String  imgType;
	private String  creater;
	private String  createDate;
	private String  editDate;
	
	
	
	public void  setImgId(String imgId){
		this.imgId=imgId;
	}
	public String  getImgId(){
		return imgId;
	}
	
	
	
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public void  setImgUrl(String imgUrl){
		this.imgUrl=imgUrl;
	}
	public String  getImgUrl(){
		return imgUrl;
	}
	
	public void  setImgStartTime(String imgStartTime){
		this.imgStartTime=imgStartTime;
	}
	public String  getImgStartTime(){
		return imgStartTime;
	}
	
	public void  setImgEndTime(String imgEndTime){
		this.imgEndTime=imgEndTime;
	}
	public String  getImgEndTime(){
		return imgEndTime;
	}
	
	public void  setImgUploadTime(String imgUploadTime){
		this.imgUploadTime=imgUploadTime;
	}
	public String  getImgUploadTime(){
		return imgUploadTime;
	}
	
	public void  setImgType(String imgType){
		this.imgType=imgType;
	}
	public String  getImgType(){
		return imgType;
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
