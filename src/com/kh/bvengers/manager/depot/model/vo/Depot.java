package com.kh.bvengers.manager.depot.model.vo;

import java.sql.Date;

public class Depot implements java.io.Serializable{
	private int productNumber;
	private String productCode;
	private String productCate;
	private String productName;
	private Date checkDate;
	private String checkStatus;
	private String locationCode;
	private String session;
	private String location;
	private String completStatus;
	private String checkPassContent;
	private Date releaseDate;
	private String selerId;
	
	public Depot() {}
	
	
	
	
	public Depot(int productNumber, String productCode, String productCate, String productName, Date checkDate,
			String checkStatus, String locationCode, String session, String location, String completStatus,
			String checkPassContent, Date releaseDate, String selerId) {
		super();
		this.productNumber = productNumber;
		this.productCode = productCode;
		this.productCate = productCate;
		this.productName = productName;
		this.checkDate = checkDate;
		this.checkStatus = checkStatus;
		this.locationCode = locationCode;
		this.session = session;
		this.location = location;
		this.completStatus = completStatus;
		this.checkPassContent = checkPassContent;
		this.releaseDate = releaseDate;
		this.selerId = selerId;
	}


	

	public String getSelerId() {
		return selerId;
	}




	public void setSelerId(String selerId) {
		this.selerId = selerId;
	}




	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getLocationCode() {
		return locationCode;
	}

	public void setLocationCode(String locationCode) {
		this.locationCode = locationCode;
	}

	public String getSession() {
		return session;
	}

	public void setSession(String session) {
		this.session = session;
	}

	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}



	public String getCompletStatus() {
		return completStatus;
	}



	public void setCompletStatus(String completStatus) {
		this.completStatus = completStatus;
	}



	public String getCheckPassContent() {
		return checkPassContent;
	}



	public void setCheckPassContent(String checkPassContent) {
		this.checkPassContent = checkPassContent;
	}



	public int getProductNumber() {
		return productNumber;
	}


	public void setProductNumber(int productNumber) {
		this.productNumber = productNumber;
	}


	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductCate() {
		return productCate;
	}

	public void setProductCate(String productCate) {
		this.productCate = productCate;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	public String getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
	}




	@Override
	public String toString() {
		return "Depot [productNumber=" + productNumber + ", productCode=" + productCode + ", productCate=" + productCate
				+ ", productName=" + productName + ", checkDate=" + checkDate + ", checkStatus=" + checkStatus
				+ ", locationCode=" + locationCode + ", session=" + session + ", location=" + location
				+ ", completStatus=" + completStatus + ", checkPassContent=" + checkPassContent + ", releaseDate="
				+ releaseDate + ", selerId=" + selerId + "]";
	}

	


	
}
