package com.mbi.vo;

//		이름            널        유형             
//		------------- -------- -------------- 
//		EVERYDAYSID   NOT NULL NUMBER         
//		STORENAME              VARCHAR2(200)  
//		STOREPHONE             VARCHAR2(200)  
//		STOREADDR     NOT NULL VARCHAR2(200)  
//		STORERATE              NUMBER         
//		STOREFAVORITE          NUMBER         
//		STORECONTENT           VARCHAR2(2000) 
//		REGISTDATE             VARCHAR2(20)   
//		STORETYPE              NUMBER         

public class HoursVO {
	private int everydaysid;
	private String storeName;
	private String storePhone;
	private String storeAddr;
	private int storeRate;
	private int storeFavorite;
	private String storeContent;
	private String registDate;
	private int storeType;
	
	public int getEverydaysid() {
		return everydaysid;
	}
	public void setEverydaysid(int everydaysid) {
		this.everydaysid = everydaysid;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStorePhone() {
		return storePhone;
	}
	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}
	public String getStoreAddr() {
		return storeAddr;
	}
	public void setStoreAddr(String storeAddr) {
		this.storeAddr = storeAddr;
	}
	public int getStoreRate() {
		return storeRate;
	}
	public void setStoreRate(int storeRate) {
		this.storeRate = storeRate;
	}
	public int getStoreFavorite() {
		return storeFavorite;
	}
	public void setStoreFavorite(int storeFavorite) {
		this.storeFavorite = storeFavorite;
	}
	public String getStoreContent() {
		return storeContent;
	}
	public void setStoreContent(String storeContent) {
		this.storeContent = storeContent;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public int getStoreType() {
		return storeType;
	}
	public void setStoreType(int storeType) {
		this.storeType = storeType;
	}
	
	

}
