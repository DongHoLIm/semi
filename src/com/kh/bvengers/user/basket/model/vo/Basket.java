package com.kh.bvengers.user.basket.model.vo;

public class Basket implements java.io.Serializable {
	private String productCode;
	private String fileName;
	private String productName;
	private int price;
	private String count;
	private String content;
	
	public Basket() {}

	public Basket(String productCode, String fileName, String productName, int price, String count, String content) {
		super();
		this.productCode = productCode;
		this.fileName = fileName;
		this.productName = productName;
		this.price = price;
		this.count = count;
		this.content = content;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Basket [productCode=" + productCode + ", fileName=" + fileName + ", productName=" + productName
				+ ", price=" + price + ", count=" + count + ", content=" + content + "]";
	}
	
	
	
}
