package com.kh.bvengers.user.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.kh.bvengers.common.JDBCTemplate.*;
import com.kh.bvengers.user.member.model.vo.Member;

public class MemberDao {
	Properties prop = new Properties();
	
	public MemberDao(){
	
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public Member loginCheck(Connection con, String memberId, String memberPwd) {
		PreparedStatement pstmt = null;
		Member loginUser = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("loginSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member();
				
				loginUser.setMemberId("MEMBER_ID");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return loginUser;
	}
	public int insertMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		
		return result;
	}

}
