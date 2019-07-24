package com.kh.bvengers.user.myPage.model.Dao;

import static com.kh.bvengers.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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
	
	
	public ArrayList<myPage> selectMyPageList(Connection con, String memberId) {
		ArrayList<myPage> mplist = null;
		Statement stmt = null;
		ResultSet rset = null;

		
		String query = prop.getProperty("selectMyPageList");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			mplist = new ArrayList<myPage>();

			while(rset.next()) {
			myPage m = new myPage();
			
			m.setOno(rset.getString("ORDER_NO"));
			m.setPname(rset.getString("PRODUCT_NAME"));
			m.setDstatus(rset.getString("DELIVERY_STATUS"));
			m.setoDate(rset.getDate("ORDER_DATE"));
			m.setMno(rset.getString("MEMBER_NO"));

			mplist.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return mplist;
	}

}
