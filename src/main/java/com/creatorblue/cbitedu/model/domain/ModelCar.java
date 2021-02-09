package com.creatorblue.cbitedu.model.domain;


import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSONObject;

public class ModelCar {
	
	private static final long serialVersionUID = 1L;
	
	public static final String TABLE_ALIAS = "汽车表";
	
	
		private static final String ALIAS_CarId="汽车ID";
		private static final String ALIAS_Brand="品牌ID";
		private static final String ALIAS_audit="审核ID";
		private static final String ALIAS_CarName="汽车名称";
		private static final String ALIAS_CarType="汽车类型名称";
		private static final String ALIAS_CarColor="汽车颜色";
		private static final String ALIAS_CarGuar="汽车保障";
		private static final String ALIAS_CarSeller="汽车商家";
		private static final String ALIAS_Phone="联系电话";
		private static final String ALIAS_PriceRange="价格区间";
		private static final String ALIAS_CarReleTime="汽车发布时间";
		private static final String ALIAS_CarState="汽车状态";
		private static final String ALIAS_CarOldPrice="汽车原价";
		private static final String ALIAS_CarNowPrice="汽车折扣价";
		private static final String ALIAS_Car_Characteristic="汽车特点";
		private static final String ALIAS_CarContent="汽车详细类容";
		private static final String ALIAS_CarSellNum="汽车销量";
		private static final String ALIAS_Creater="创建人";
		private static final String ALIAS_CreateDate="创建时间";
		private static final String ALIAS_EditDate="修改时间";
		private static final String ALIAS_Stock="库存";
	
	
	
	
	private String  carId;
	private ModelBrand  brand;
	private ModelAudit  audit;
	private String  carName;
	private ModelDict  carType;
	private String  carColor;
	private String  carGuar;
	private String  carSeller;
	private String  phone;
	private ModelDict  priceRange;
	private String  carReleTime;
	private String  carState;
	private String  carOldPrice;
	private String  carNowPrice;
	private String  carCharacteristic;
	private String  carContent;
	private Integer  carSellNum;
	private String  creater;
	private String  createDate;
	private String  editDate;
	private Integer  stock;
	private List<ModelImg> img;
	
	
	
	
	
	public List<ModelImg> getImg() {
		return img;
	}
	public void setImg(List<ModelImg> img) {
		this.img = img;
	}
	public ModelBrand getBrand() {
		return brand;
	}
	public ModelAudit getAudit() {
		return audit;
	}
	public void setAudit(ModelAudit audit) {
		this.audit = audit;
	}
	public void  setCarId(String carId){
		this.carId=carId;
	}
	public String  getCarId(){
		return carId;
	}
	
	public void  setBrand(ModelBrand brand){
		this.brand=brand;
	}
	public ModelBrand  getBrandId(){
		return brand;
	}
	
	public void  setCarName(String carName){
		this.carName=carName;
	}
	public String  getCarName(){
		return carName;
	}
	
	
	
	public String getCarCharacteristic() {
		return carCharacteristic;
	}
	public void setCarCharacteristic(String carCharacteristic) {
		this.carCharacteristic = carCharacteristic;
	}
	public void  setCarColor(String carColor){
		this.carColor=carColor;
	}
	public String  getCarColor(){
		return carColor;
	}
	
	public void  setCarGuar(String carGuar){
		this.carGuar=carGuar;
	}
	public String  getCarGuar(){
		return carGuar;
	}
	
	public void  setCarSeller(String carSeller){
		this.carSeller=carSeller;
	}
	public String  getCarSeller(){
		return carSeller;
	}
	
	public void  setPhone(String phone){
		this.phone=phone;
	}
	public String  getPhone(){
		return phone;
	}
	
	public void  setPriceRange(ModelDict priceRange){
		this.priceRange=priceRange;
	}
	public ModelDict  getPriceRange(){
		return priceRange;
	}
	
	public void  setCarReleTime(String carReleTime){
		this.carReleTime=carReleTime;
	}
	public String  getCarReleTime(){
		return carReleTime;
	}
	
	public void  setCarState(String carState){
		this.carState=carState;
	}
	public String  getCarState(){
		return carState;
	}
	
	public void  setCarOldPrice(String carOldPrice){
		this.carOldPrice=carOldPrice;
	}
	public String  getCarOldPrice(){
		return carOldPrice;
	}
	
	public void  setCarNowPrice(String carNowPrice){
		this.carNowPrice=carNowPrice;
	}
	public String  getCarNowPrice(){
		return carNowPrice;
	}
	
	public void  setCarType(ModelDict carType){
		this.carType=carType;
	}
	public ModelDict  getCarType(){
		return carType;
	}
	
	public void  setCarContent(String carContent){
		this.carContent=carContent;
	}
	public String  getCarContent(){
		return carContent;
	}
	
	public void  setCarSellNum(Integer carSellNum){
		this.carSellNum=carSellNum;
	}
	public Integer  getCarSellNum(){
		return carSellNum;
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
	
	public void  setStock(Integer stock){
		this.stock=stock;
	}
	public Integer  getStock(){
		return stock;
	}
	
	
	@Override
	public String toString() {
		return JSONObject.toJSONString(this);
	}
}
