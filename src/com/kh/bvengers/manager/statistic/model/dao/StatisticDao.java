package com.kh.bvengers.manager.statistic.model.dao;

import static com.kh.bvengers.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.bvengers.product.model.dao.ProductDao;
public class StatisticDao {
	private Properties prop = new Properties();
	
	public StatisticDao() {
		String fileName = ProductDao.class.getResource("/sql/manager/statistic/statistic-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<String> countDate(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<String> dateList = null;
		
		String query = prop.getProperty("selectDate");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			int i = 0;
			dateList = new ArrayList<String>();
			while(rset.next()) {
				dateList.add(i, rset.getString("DA"));
				i++;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return dateList;
	}
	
	public ArrayList<HashMap<String, Object>> memberStatistic(Connection con, ArrayList<String> dateList, String time) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>>  list = null;
		HashMap<String, Object> hmap = null;
		
		int count = 0;
		
		String query = prop.getProperty("memberStatistic");
		try {
			list = new ArrayList<HashMap<String, Object>>();
			int dateLength = dateList.size();
			if(dateLength > 6) {
				dateLength = 6;
			}
			
			for(int i = 0; i < dateLength; i++) {
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, time);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					hmap = new HashMap<String, Object>();
					
					String yy = time.substring(0,2);
					String MM = time.substring(2,4);
					String dd = time.substring(4);
					hmap.put("payDate", MM+"월"+dd+"일");
					hmap.put("row", rset.getString("COUNT(*)"));
					
					int dpay = 0;
					if(rset.getString("SUM(PAY_MONEY)") != null) {
						dpay = Integer.parseInt(rset.getString("SUM(PAY_MONEY)"))/10000;
					}else {
						count++;
					}
					
					hmap.put("allPay", dpay+"");
					list.add(hmap);
				}
				time = Integer.parseInt(time)-1+"";
			}
			
			if(count > 0) {
				
				for(int i = 0; i < count; i++) {
					
					pstmt = con.prepareStatement(query);
					pstmt.setString(1, time);
					rset = pstmt.executeQuery();
					
					while(rset.next()) {
						hmap = new HashMap<String, Object>();
						
						String yy = time.substring(0,2);
						String MM = time.substring(2,4);
						String dd = time.substring(4);
						hmap.put("payDate", MM+"월"+dd+"일");
						hmap.put("row", rset.getString("COUNT(*)"));
						
						int dpay = 0;
						if(rset.getString("SUM(PAY_MONEY)") != null) {
							dpay = Integer.parseInt(rset.getString("SUM(PAY_MONEY)"))/10000;
						}
						
						hmap.put("allPay", dpay+"");
						list.add(hmap);
					}
					time = Integer.parseInt(time)-1+"";
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	

}





















