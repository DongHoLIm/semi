package com.kh.bvengers.user.myPage.model.vo;

import java.sql.Date;

public class myPage {
	private String ono;		//주문번호
	private String pname;	 //상품명
	private String dstatus; //배송상태
	private Date oDate;		//주문날짜
	private String mno; 	//회원번호
	private int bno;		//조회 갯수
	
	public myPage() {}

	public myPage(String ono, String pname, String dstatus, Date oDate, String mno, int bno) {
		super();
		this.ono = ono;
		this.pname = pname;
		this.dstatus = dstatus;
		this.oDate = oDate;
		this.mno = mno;
		this.bno = bno;
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

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	@Override
	public String toString() {
		return "myPage [ono=" + ono + ", pname=" + pname + ", dstatus=" + dstatus + ", oDate=" + oDate + ", mno=" + mno
				+ ", bno=" + bno + "]";
	}


	
	

}
