package com.kh.bvengers.user.chat.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.bvengers.common.JDBCTemplate.*;
import com.kh.bvengers.board.model.vo.Board;
import com.kh.bvengers.user.chat.model.vo.Chat;

public class ChatDao {
	private Properties prop = new Properties();

	public ChatDao() {
		String fileName = Board.class.getResource("/sql/member/member-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int selectChat(Connection con, String no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("selectChat");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, no);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = Integer.parseInt(rset.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int createChat(Connection con, String no) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("createChat");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, no);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con);
		}
		return result;
	}

	public Chat joinChat(Connection con, int no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Chat ch = null;

		String query = prop.getProperty("joinChat");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, String.valueOf(no));

			rset = pstmt.executeQuery();
			if (rset.next()) {
				ch = new Chat();
				ch.setMemberNo(rset.getString("MEMBER_NO"));
				ch.setChat(rset.getString("CHAT"));
				ch.setChatDate(rset.getDate("CHAT_DATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return ch;
	}

}
