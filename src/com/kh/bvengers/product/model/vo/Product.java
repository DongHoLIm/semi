package com.kh.bvengers.product.model.vo;

import java.io.Serializable;

public class Product  implements Serializable{
	private String productCode;
	private String productName;
	private int productMoney;
	private String productCate;
	private String memberNo;
	private String keepDate;
	private String postId;

	public Product() {}

	public Product(String productCode, String productName, int productMoney, String productCate, String memberNo,
			String keepDate, String postId) {
		super();
		this.productCode = productCode;
		this.productName = productName;
		this.productMoney = productMoney;
		this.productCate = productCate;
		this.memberNo = memberNo;
		this.keepDate = keepDate;
		this.postId = postId;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductMoney() {
		return productMoney;
	}

	public void setProductMoney(int productMoney) {
		this.productMoney = productMoney;
	}

	public String getProductCate() {
		return productCate;
	}

	public void setProductCate(String productCate) {
		this.productCate = productCate;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getKeepDate() {
		return keepDate;
	}

	public void setKeepDate(String keepDate) {
		this.keepDate = keepDate;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	@Override
	public String toString() {
		return "Product [productCode=" + productCode + ", productName=" + productName + ", productMoney=" + productMoney
				+ ", productCate=" + productCate + ", memberNo=" + memberNo + ", keepDate=" + keepDate + ", postId="
				+ postId + "]";
	}


}
