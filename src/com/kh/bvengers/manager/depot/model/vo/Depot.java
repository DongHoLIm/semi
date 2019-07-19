package com.kh.bvengers.manager.depot.model.vo;

import java.sql.Date;

public class Depot implements java.io.Serializable{
	private int productNumber;
	private String productCode;
	private String productCate;
	private String productName;
	private Date checkDate;
	private String checkStatus;
	
	public Depot() {}
	
	
	public Depot(int productNumber, String productCode, String productCate, String productName, Date checkDate,
			String checkStatus) {
		super();
		this.productNumber = productNumber;
		this.productCode = productCode;
		this.productCate = productCate;
		this.productName = productName;
		this.checkDate = checkDate;
		this.checkStatus = checkStatus;
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
				+ ", productName=" + productName + ", checkDate=" + checkDate + ", checkStatus=" + checkStatus + "]";
	}

	
	
	
}
