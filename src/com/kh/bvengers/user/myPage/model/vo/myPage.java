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
	private String pstatus; //상태 합치기
	private Date rDate; 	//환불신청 날짜
	private String ano;		//정산번호
	private Date aDate;		//정산날짜
	private String aStatus;	//정산상태
	private int aPrice;		//정산금액
	private String aname;	//예금주
	private String bCode;	//은행명
	private String accountNo; //계좌번호

	
	public myPage() {}


	public String getOno() {
		return ono;
	}


	public void setOno(String ono) {
		this.ono = ono;
	}


	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public String getDstatus() {
		return dstatus;
	}


	public void setDstatus(String dstatus) {
		this.dstatus = dstatus;
	}


	public Date getoDate() {
		return oDate;
	}


	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}


	public String getMno() {
		return mno;
	}


	public void setMno(String mno) {
		this.mno = mno;
	}


	public String getPayStatus() {
		return payStatus;
	}


	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}


	public String getRefundStatus() {
		return refundStatus;
	}


	public void setRefundStatus(String refundStatus) {
		this.refundStatus = refundStatus;
	}


	public int getDtPay() {
		return dtPay;
	}


	public void setDtPay(int dtPay) {
		this.dtPay = dtPay;
	}


	public String getInNo() {
		return inNo;
	}


	public void setInNo(String inNo) {
		this.inNo = inNo;
	}


	public String getrName() {
		return rName;
	}


	public void setrName(String rName) {
		this.rName = rName;
	}


	public String getdSite() {
		return dSite;
	}


	public void setdSite(String dSite) {
		this.dSite = dSite;
	}


	public String getrPhone() {
		return rPhone;
	}


	public void setrPhone(String rPhone) {
		this.rPhone = rPhone;
	}


	public String getPstatus() {
		return pstatus;
	}


	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}


	public Date getrDate() {
		return rDate;
	}


	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}


	public String getAno() {
		return ano;
	}


	public void setAno(String ano) {
		this.ano = ano;
	}


	public Date getaDate() {
		return aDate;
	}


	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}


	public String getaStatus() {
		return aStatus;
	}


	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}


	public int getaPrice() {
		return aPrice;
	}


	public void setaPrice(int aPrice) {
		this.aPrice = aPrice;
	}


	public String getAname() {
		return aname;
	}


	public void setAname(String aname) {
		this.aname = aname;
	}


	public String getbCode() {
		return bCode;
	}


	public void setbCode(String bCode) {
		this.bCode = bCode;
	}


	public String getAccountNo() {
		return accountNo;
	}


	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}


	@Override
	public String toString() {
		return "myPage [ono=" + ono + ", pname=" + pname + ", dstatus=" + dstatus + ", oDate=" + oDate + ", mno=" + mno
				+ ", payStatus=" + payStatus + ", refundStatus=" + refundStatus + ", dtPay=" + dtPay + ", inNo=" + inNo
				+ ", rName=" + rName + ", dSite=" + dSite + ", rPhone=" + rPhone + ", pstatus=" + pstatus + ", rDate="
				+ rDate + ", ano=" + ano + ", aDate=" + aDate + ", aStatus=" + aStatus + ", aPrice=" + aPrice
				+ ", aname=" + aname + ", bCode=" + bCode + ", accountNo=" + accountNo + "]";
	}
	
	
	
	
	
}
