package com.kh.bvengers.manager.member.model.dao;

import static com.kh.bvengers.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.bvengers.manager.member.model.vo.Report;
public class ManagerMemberDao {

	Properties prop = new Properties();
	public ManagerMemberDao() {
		String fileName = ManagerMemberDao.class.getResource("/sql/manager/member/managermember-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				listCount=rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return listCount;
	}
	public ArrayList<Report> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Report> mlist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage-1)*limit +1;
			int endRow = startRow + limit-1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			mlist = new ArrayList<Report>();
			while(rset.next()) {
				Report r = new Report();
				
				r.setReportNo(rset.getString("REPORT_NO"));
				r.setReporter(rset.getString("REPORTER"));
				r.setMemberDest(rset.getString("MEMBER_DEST"));
				r.setPostsId(rset.getString("POSTS_ID"));
				r.setReportDate(rset.getDate("REPORT_DATE"));
				r.setReportComments(rset.getString("REPORT_COMMENTS"));
				
				mlist.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return mlist;
	}
	public int memberban(Connection con, String memberId, int term, String reason) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("memberban");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, reason);
			pstmt.setInt(3, term);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
