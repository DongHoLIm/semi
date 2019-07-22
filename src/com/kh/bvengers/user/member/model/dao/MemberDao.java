package com.kh.bvengers.user.member.model.dao;

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

				loginUser.setMemberNo(rset.getString("MEMBER_NO"));
				loginUser.setMemberId(rset.getString("MEMBER_ID"));
				loginUser.setMemberPassword(rset.getString("MEMBER_PASSWORD"));
				loginUser.setMemberName(rset.getString("MEMBER_NAME"));
				loginUser.setEmail(rset.getString("EMAIL"));
				loginUser.setAddress(rset.getString("ADDRESS"));
				loginUser.setPhone(rset.getString("PHONE"));
				loginUser.setEnrollDate(rset.getDate("ENROLL_DATE"));
				loginUser.setRetireDate(rset.getDate("RETIRE_DATE"));
				loginUser.setRetire(rset.getString("RETIRE"));
				loginUser.setMemberDiv(rset.getString("MEMBER_DIV"));
				loginUser.setAccountHolder(rset.getString("ACCOUNT_HOLDER"));
				loginUser.setBankCode(rset.getString("BANK_CODE"));
				loginUser.setAccountNo(rset.getString("ACCOUNT_NO"));
				loginUser.setGradeCode(rset.getString("GRADE_CODE"));
				loginUser.setSellCount(rset.getInt("SELL_COUNT"));
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

		try {
			pstmt = con.prepareStatement(query);


			pstmt.setString(1,m.getMemberId());
			pstmt.setString(2, m.getMemberPassword());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getPhone());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	public int changeMember(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("changeMember");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getMemberPassword());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getAddress());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getMemberId());

			result = pstmt.executeUpdate();



		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}



		return result;
	}

	public ArrayList<Member> selectAll(Connection con) {
		ArrayList<Member> list = null;
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectAll");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<Member>();

			while(rset.next()) {
				Member m = new Member();

				m.setMemberNo(rset.getString("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberPassword(rset.getString("MEMBER_PASSWORD"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setEmail(rset.getString("EMAIL"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setPhone(rset.getString("PHONE"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				m.setRetireDate(rset.getDate("RETIRE_DATE"));
				m.setRetire(rset.getString("RETIRE"));
				m.setMemberDiv(rset.getString("MEMBER_DIV"));
				m.setAccountHolder(rset.getString("ACCOUNT_HOLDER"));
				m.setBankCode(rset.getString("BANK_CODE"));
				m.setAccountNo(rset.getString("ACCOUNT_NO"));
				m.setGradeCode(rset.getString("GRADE_CODE"));
				m.setSellCount(rset.getInt("SELL_COUNT"));

				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}

		return list;
	}
	public ArrayList<Member> searchId(Connection con, String searchValue) {
		ArrayList<Member> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("searchId");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, searchValue);

			rset = pstmt.executeQuery();
			list = new ArrayList<Member>();
			while(rset.next()) {
				Member m = new Member();

				m.setMemberNo(rset.getString("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberPassword(rset.getString("MEMBER_PASSWORD"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setEmail(rset.getString("EMAIL"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setPhone(rset.getString("PHONE"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				m.setRetireDate(rset.getDate("RETIRE_DATE"));
				m.setRetire(rset.getString("RETIRE"));
				m.setMemberDiv(rset.getString("MEMBER_DIV"));
				m.setAccountHolder(rset.getString("ACCOUNT_HOLDER"));
				m.setBankCode(rset.getString("BANK_CODE"));
				m.setAccountNo(rset.getString("ACCOUNT_NO"));
				m.setGradeCode(rset.getString("GRADE_CODE"));
				m.setSellCount(rset.getInt("SELL_COUNT"));

				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}


		return list;
	}
	public ArrayList<Member> searchName(Connection con, String searchValue) {
		ArrayList<Member> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("searchName");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, searchValue);

			rset = pstmt.executeQuery();
			list = new ArrayList<Member>();
			while(rset.next()) {
				Member m = new Member();

				m.setMemberNo(rset.getString("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberPassword(rset.getString("MEMBER_PASSWORD"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setEmail(rset.getString("EMAIL"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setPhone(rset.getString("PHONE"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				m.setRetireDate(rset.getDate("RETIRE_DATE"));
				m.setRetire(rset.getString("RETIRE"));
				m.setMemberDiv(rset.getString("MEMBER_DIV"));
				m.setAccountHolder(rset.getString("ACCOUNT_HOLDER"));
				m.setBankCode(rset.getString("BANK_CODE"));
				m.setAccountNo(rset.getString("ACCOUNT_NO"));
				m.setGradeCode(rset.getString("GRADE_CODE"));
				m.setSellCount(rset.getInt("SELL_COUNT"));

				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}


		return list;
	}
	public ArrayList<Member> searchLevel(Connection con, String searchValue) {
		ArrayList<Member> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("searchLevel");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, searchValue);

			rset = pstmt.executeQuery();
			list = new ArrayList<Member>();
			while(rset.next()) {
				Member m = new Member();

				m.setMemberNo(rset.getString("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberPassword(rset.getString("MEMBER_PASSWORD"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setEmail(rset.getString("EMAIL"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setPhone(rset.getString("PHONE"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				m.setRetireDate(rset.getDate("RETIRE_DATE"));
				m.setRetire(rset.getString("RETIRE"));
				m.setMemberDiv(rset.getString("MEMBER_DIV"));
				m.setAccountHolder(rset.getString("ACCOUNT_HOLDER"));
				m.setBankCode(rset.getString("BANK_CODE"));
				m.setAccountNo(rset.getString("ACCOUNT_NO"));
				m.setGradeCode(rset.getString("GRADE_CODE"));
				m.setSellCount(rset.getInt("SELL_COUNT"));

				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	public ArrayList<Member> selectList(Connection con) {
		ArrayList<Member> mlist = null;
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectList");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			mlist = new ArrayList<Member>();
			while(rset.next()) {
			Member m = new Member();

			m.setMemberNo(rset.getString("MEMBER_NO"));
			m.setMemberId(rset.getString("MEMBER_ID"));
			m.setMemberPassword(rset.getString("MEMBER_PASSWORD"));
			m.setMemberName(rset.getString("MEMBER_NAME"));
			m.setEmail(rset.getString("EMAIL"));
			m.setAddress(rset.getString("ADDRESS"));
			m.setPhone(rset.getString("PHONE"));
			m.setEnrollDate(rset.getDate("ENROLL_DATE"));
			m.setRetireDate(rset.getDate("RETIRE_DATE"));
			m.setRetire(rset.getString("RETIRE"));
			m.setMemberDiv(rset.getString("MEMBER_DIV"));
			m.setAccountHolder(rset.getString("ACCOUNT_HOLDER"));
			m.setBankCode(rset.getString("BANK_CODE"));
			m.setAccountNo(rset.getString("ACCOUNT_NO"));
			m.setGradeCode(rset.getString("GRADE_CODE"));
			m.setSellCount(rset.getInt("SELL_COUNT"));

			mlist.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return mlist;
	}
	public Member findUserId(Connection con, String memberName, String phone, String email) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("findUserId");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberName);
			pstmt.setString(2, phone);
			pstmt.setString(3, email);

			rset = pstmt.executeQuery();
			if(rset.next()) {
				m=new Member();
				m.setMemberNo(rset.getString("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setMemberPassword(rset.getString("MEMBER_PASSWORD"));
				m.setMemberName(rset.getString("MEMBER_NAME"));
				m.setEmail(rset.getString("EMAIL"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setPhone(rset.getString("PHONE"));
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));
				m.setRetireDate(rset.getDate("RETIRE_DATE"));
				m.setRetire(rset.getString("RETIRE"));
				m.setMemberDiv(rset.getString("MEMBER_DIV"));
				m.setAccountHolder(rset.getString("ACCOUNT_HOLDER"));
				m.setBankCode(rset.getString("BANK_CODE"));
				m.setAccountNo(rset.getString("ACCOUNT_NO"));
				m.setGradeCode(rset.getString("GRADE_CODE"));
				m.setSellCount(rset.getInt("SELL_COUNT"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}


		return m;
	}

}
