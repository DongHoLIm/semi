package com.kh.bvengers.user.myPage.model.vo;

import java.sql.Date;

public class myPage {
	private String ono;		//주문번호
	private String pname;	 //상품명
	private String dstatus; //배송상태
	private Date oDate;		//주문날짜
	private String mno; 	//회원번호
	private String payStatus; //결제상태
	private String refundStatus; //환불상태
	private int dtPay;//주문상세금액
	private String inNo; //송장번호
	private String rName; //수취인이름
	private String dSite;//배송지
	private String rPhone;//수취인연락처
	
	public myPage() {}

	public myPage(String ono, String pname, String dstatus, Date oDate, String mno, String payStatus,
			String refundStatus, int dtPay, String inNo, String rName, String dSite, String rPhone) {
		super();
		this.ono = ono;
		this.pname = pname;
		this.dstatus = dstatus;
		this.oDate = oDate;
		this.mno = mno;
		this.payStatus = payStatus;
		this.refundStatus = refundStatus;
		this.dtPay = dtPay;
		this.inNo = inNo;
		this.rName = rName;
		this.dSite = dSite;
		this.rPhone = rPhone;
	}

	public String getOno() {
		return ono;
	}

	public String getPname() {
		return pname;
	}

	public String getDstatus() {
		return dstatus;
	}

	public Date getoDate() {
		return oDate;
	}

	public String getMno() {
		return mno;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public String getRefundStatus() {
		return refundStatus;
	}

	public int getDtPay() {
		return dtPay;
	}

	public String getInNo() {
		return inNo;
	}

	public String getrName() {
		return rName;
	}

	public String getdSite() {
		return dSite;
	}

	public String getrPhone() {
		return rPhone;
	}

	public void setOno(String ono) {
		this.ono = ono;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public void setDstatus(String dstatus) {
		this.dstatus = dstatus;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public void setRefundStatus(String refundStatus) {
		this.refundStatus = refundStatus;
	}

	public void setDtPay(int dtPay) {
		this.dtPay = dtPay;
	}

	public void setInNo(String inNo) {
		this.inNo = inNo;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public void setdSite(String dSite) {
		this.dSite = dSite;
	}

	public void setrPhone(String rPhone) {
		this.rPhone = rPhone;
	}

	@Override
	public String toString() {
		return "myPage [ono=" + ono + ", pname=" + pname + ", dstatus=" + dstatus + ", oDate=" + oDate + ", mno=" + mno
				+ ", payStatus=" + payStatus + ", refundStatus=" + refundStatus + ", dtPay=" + dtPay + ", inNo=" + inNo
				+ ", rName=" + rName + ", dSite=" + dSite + ", rPhone=" + rPhone + "]";
	}
	
	
}
