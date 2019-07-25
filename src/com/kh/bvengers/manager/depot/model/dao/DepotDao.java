package com.kh.bvengers.manager.depot.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.bvengers.manager.depot.model.vo.Depot;

import static com.kh.bvengers.common.JDBCTemplate.*;
public class DepotDao {
	private Properties prop = new Properties();
	public DepotDao() {
		String fileName = DepotDao.class.getResource("/sql/manager/depot/Depot-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public ArrayList<Depot> selectCheckAll(Connection con) {
		Statement stmt  =null;
		ResultSet rset =null;
		ArrayList<Depot> list = null;
		Depot d = null;
		int i = 1;
		String query = prop.getProperty("selectRequestList");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<Depot>();
			while(rset.next()) {
				d = new Depot();
				d.setProductNumber(i);
				d.setProductCode(rset.getString("PRODUCT_CODE"));
				d.setProductName(rset.getString("PRODUCT_NAME"));
				d.setProductCate(rset.getString("PRODUCT_CATE"));
				d.setCheckDate(rset.getDate("CHECK_DATE"));
				d.setCheckStatus(rset.getString("CHECK_STATUS"));
				i++;
				list.add(d);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	public int insertLocation(Connection con, Depot d) {
		PreparedStatement pstmt = null;
		int result =0;
		String query = prop.getProperty("insertLocation");
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1,d.getLocationCode());
			pstmt.setString(2,d.getProductCode());
			result =pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
				
		
		return result;
	}
	public int updateStatus(Connection con, Depot d) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query =prop.getProperty("updateStatus");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, d.getCheckStatus());
			pstmt.setString(2, d.getCompletStatus());
			pstmt.setString(3, d.getCheckPassContent());
			pstmt.setString(4, d.getProductCode());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	public int updateLocation(Connection con, Depot d) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateLocation");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, d.getLocationCode());
			pstmt.setString(2, d.getProductCode());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public ArrayList<Depot> selectAllList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList <Depot> list = null;
		Depot d = null;
		String query = prop.getProperty("selectAll");
		int i = 1;
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list= new ArrayList<Depot>();
			while(rset.next()) {
				d = new Depot();
				d.setProductNumber(i);
				d.setProductCode(rset.getString("PRODUCT_CODE"));
				d.setProductName(rset.getString("PRODUCT_NAME"));
				d.setLocationCode(rset.getString("LOCATION"));
				d.setCheckDate(rset.getDate("MAX_DEPOT_DATE"));
				d.setReleaseDate(rset.getDate("RELEASE_DATE"));
				i++;
				list.add(d);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}
	public ArrayList<Depot> selectBarcodeAllList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList <Depot> list = null;
		Depot d = null;
		String query = prop.getProperty("createBarcode");
		int i = 1;
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list= new ArrayList<Depot>();
			while(rset.next()) {
				d = new Depot();
				d.setProductNumber(i);
				d.setProductCode(rset.getString("PRODUCT_CODE"));
				d.setProductName(rset.getString("PRODUCT_NAME"));
				d.setLocationCode(rset.getString("LOCATION"));
				d.setCheckDate(rset.getDate("CHECK_DATE"));
				d.setReleaseDate(rset.getDate("RELEASE_DATE"));
				i++;
				list.add(d);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}
	public ArrayList<Depot> selectInList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Depot> list = null;
		Depot d = null;
		int i =1;
		String query = prop.getProperty("selectInList");
		try {
			stmt =con.createStatement();
			rset =stmt.executeQuery(query);
			list= new ArrayList<Depot>();
			while(rset.next()) {
				d=new Depot();
				d.setProductNumber(i);
				d.setProductCode(rset.getString("PRODUCT_CODE"));
				d.setSelerId(rset.getString("MEMBER_ID"));
				d.setLocationCode(rset.getString("LOCATION"));
				d.setCompletStatus(rset.getString("COMPLETE_STATUS"));
				d.setCheckDate(rset.getDate("CHECK_DATE"));
				d.setReleaseDate(rset.getDate("RELEASE_DATE"));
				
				i++;
				list.add(d);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	public int updateRelesDate(Connection con, String productCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateRelesDate");
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, productCode);
			result= pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
