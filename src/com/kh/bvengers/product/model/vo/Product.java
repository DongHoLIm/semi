package com.kh.bvengers.product.model.vo;

import java.sql.Date;

public class Product {
	private String pCode;
	private String pName;
	private int pMoney;
	private String pCate;
	private String userId;
	private Date keepDate;
	private String postId;
	
	public Product() {}

	public Product(String pCode, String pName, int pMoney, String pCate, String userId, Date keepDate, String postId) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.pMoney = pMoney;
		this.pCate = pCate;
		this.userId = userId;
		this.keepDate = keepDate;
		this.postId = postId;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpMoney() {
		return pMoney;
	}

	public void setpMoney(int pMoney) {
		this.pMoney = pMoney;
	}

	public String getpCate() {
		return pCate;
	}

	public void setpCate(String pCate) {
		this.pCate = pCate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getKeepDate() {
		return keepDate;
	}

	public void setKeepDate(Date keepDate) {
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
		return "Product [pCode=" + pCode + ", pName=" + pName + ", pMoney=" + pMoney + ", pCate=" + pCate + ", userId="
				+ userId + ", keepDate=" + keepDate + ", postId=" + postId + "]";
	}
	
	
	
}
