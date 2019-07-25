package com.kh.bvengers.user.myPage.model.Dao;

import static com.kh.bvengers.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
	
	
	public ArrayList<myPage> selectMyPageList(Connection con, String memberNo, int currentPage, int limit, int limit2) {
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
			
			m.setBno(rset.getInt("RNUM"));
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




}
