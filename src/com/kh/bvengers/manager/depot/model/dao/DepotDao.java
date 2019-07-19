package com.kh.bvengers.manager.depot.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.bvengers.manager.depot.model.vo.Depot;

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
		}
		return list;
	}

}
