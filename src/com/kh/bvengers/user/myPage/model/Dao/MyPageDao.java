package com.kh.bvengers.user.myPage.model.Dao;

import static com.kh.bvengers.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.bvengers.user.myPage.model.vo.myPage;

public class MyPageDao {
	Properties prop = new Properties();

	public MyPageDao(){

		String fileName = MyPageDao.class.getResource("/sql/user/myPage/myPage-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<myPage> selectMyPageList(Connection con, String memberNo, int currentPage, int limit) {
		ArrayList<myPage> mplist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		
		String query = prop.getProperty("selectMyPageList");
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, memberNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			mplist = new ArrayList<myPage>();

			while(rset.next()) {
			myPage m = new myPage();
			
			m.setOno(rset.getString("ORDER_NO"));
			m.setPname(rset.getString("PRODUCT_NAME"));
			m.setDstatus(rset.getString("DELIVERY_STATUS"));
			m.setoDate(rset.getDate("ORDER_DATE"));
			
			
			mplist.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return mplist;
	}


	public int getListCount(Connection con, String memberNo) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMyPageListCount");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}


	public ArrayList<myPage> selectDeliReadyList(Connection con, String memberNo) {
		ArrayList<myPage> drlist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		
		String query = prop.getProperty("selectDeliReadyList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberNo);
			
			rset = pstmt.executeQuery();
			drlist = new ArrayList<myPage>();

			while(rset.next()) {
			myPage m = new myPage();
			
			m.setOno(rset.getString("ORDER_NO"));
			m.setPname(rset.getString("PRODUCT_NAME"));
			m.setDstatus(rset.getString("DELIVERY_STATUS"));
			m.setoDate(rset.getDate("ORDER_DATE"));
			
			
			drlist.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return drlist;
	}


	public ArrayList<myPage> selectOrderLookList(Connection con, String memberNo, int currentPage, int limit) {
		ArrayList<myPage> olList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOrderLook");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, memberNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			olList = new ArrayList<myPage>();
			
			while(rset.next()) {
				myPage m = new myPage();
				m.setoDate(rset.getDate("ORDER_DATE"));
				m.setOno(rset.getString("ORDER_NO"));
				m.setPname(rset.getString("PRODUCT_NAME"));
				m.setPayStatus(rset.getString("PAY_STATUS"));
				m.setDstatus(rset.getString("DELIVERY_STATUS"));
				m.setRefundStatus(rset.getString("REFUND_STATUS"));
				
				olList.add(m);
			}	
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		
		}
		return olList;
	}

	public ArrayList<myPage> selectOrderDetailList(Connection con, String memberNo, String ono) {
		ArrayList<myPage> odList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOrderDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, ono);
			pstmt.setString(2, memberNo);
			
			rset = pstmt.executeQuery();
			
			odList = new ArrayList<myPage>();
			
			while(rset.next()) {
				myPage m = new myPage();
				m.setDtPay(rset.getInt("PRODUCT_DTPAY"));
				m.setoDate(rset.getDate("ORDER_DATE"));
				m.setOno(rset.getString("ORDER_NO"));
				m.setPname(rset.getString("PRODUCT_NAME"));
				m.setPayStatus(rset.getString("REFUND_STATUS"));
				m.setDstatus(rset.getString("DELIVERY_STATUS"));
				m.setInNo(rset.getString("INVOICE_NO"));
				m.setrName(rset.getString("RECIEVER_NAME"));
				m.setdSite(rset.getString("DELIVERY_SITE"));
				m.setrPhone(rset.getString("RECIEVER_PHONE"));
				m.setMno(rset.getString("MEMBER_NO"));	
				
				odList.add(m);
			}	
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		
		}
		return odList;
	}


	public ArrayList<myPage> selectOrderDateList(Connection con, String memberNo, String start, String end,
			int currentPage, int limit) {
		ArrayList<myPage> dateList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOrderDate");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
		
			pstmt.setString(1, memberNo);
			pstmt.setString(2, start);
			pstmt.setString(3, end);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			rset = pstmt.executeQuery();
			dateList = new ArrayList<myPage>();
			
			while(rset.next()) {
				myPage m = new myPage();
				m.setoDate(rset.getDate("ORDER_DATE"));
				m.setOno(rset.getString("ORDER_NO"));
				m.setPname(rset.getString("PRODUCT_NAME"));
				m.setPayStatus(rset.getString("PAY_STATUS"));
				m.setDstatus(rset.getString("DELIVERY_STATUS"));
				m.setRefundStatus(rset.getString("REFUND_STATUS"));
				
				dateList.add(m);
			}	
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		
		}
		return dateList;
	}


	public int getOrderLookListCount(Connection con, String memberNo) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOrderLookCount");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}


	public int getOrderDateCount(Connection con, String memberNo, String start, String end) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectOrderDateCount");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberNo);
			pstmt.setString(2, start);
			pstmt.setString(3, end);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	public int getListCountR(Connection con, String memberNo) {
		PreparedStatement pstmt = null;
		int listCountR = 0;
		ResultSet rset = null;

		String query = prop.getProperty("selectListCountR");

		try {

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {

				listCountR = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return listCountR;
	}
	
	public int getListCountC(Connection con, String memberNo) {
		PreparedStatement pstmt = null;
		int listCountC = 0;
		ResultSet rset = null;
		String query = prop.getProperty("selectListCountC");

		try {

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {

				listCountC = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return listCountC;
	}


	public ArrayList<myPage> selectRefundList(Connection con, String memberNo, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<myPage> rList = null;
		
		String query = prop.getProperty("selectRefundList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, memberNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3,  endRow);
			
			rList = new ArrayList<myPage>();
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				myPage m = new myPage();
				m.setOno(rset.getString("ORDER_NO"));
				m.setoDate(rset.getDate("ORDER_DATE"));
				m.setPname(rset.getString("PRODUCT_NAME"));
				m.setDtPay(rset.getInt("PRODUCT_DTPAY"));
				m.setRefundStatus(rset.getString("REFUND_STATUS"));
				
				rList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return rList;
	}
		
	

	public ArrayList<myPage> selectCalculateList(Connection con, String memberNo, int currentPage1, int limit1) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<myPage> cList = null;
		
		String query = prop.getProperty("selectCalculateList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage1 - 1) * limit1 + 1;
			int endRow = startRow + limit1 - 1;
			
			pstmt.setString(1, memberNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3,  endRow);
			
			cList = new ArrayList<myPage>();
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				myPage m = new myPage();
				
				m.setAno(rset.getString("ADJUST_NO"));
				m.setaDate(rset.getDate("ADJUST_DATE"));
				m.setaStatus(rset.getString("ADJUST_DIV"));
				m.setaPrice(rset.getInt("PRICE"));
				m.setAname(rset.getString("ACCOUNT_HOLDER"));
				m.setbCode(rset.getString("BANK_CODE"));
				m.setAccountNo(rset.getString("ACCOUNT_NO"));
				
				cList.add(m);
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return cList;
	}


	
}