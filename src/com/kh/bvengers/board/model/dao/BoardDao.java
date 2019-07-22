package com.kh.bvengers.board.model.dao;

import static com.kh.bvengers.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.bvengers.board.model.vo.Board;

public class BoardDao {
	private Properties prop = new Properties();

	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/user/product/product-board-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<HashMap<String, Object>> selectProductList(Connection con) {
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap< String, Object> hmap = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectThumbnail");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);
			list = new ArrayList<HashMap<String, Object>>();

			while(rset.next()) {
				hmap = new HashMap<String, Object>();

				hmap.put("fileNo", rset.getString("FILE_NO"));
				hmap.put("originFileName", rset.getString("ORIGIN_FILE_NAME"));
				hmap.put("newFileName", rset.getString("NEW_FILE_NAME"));
				hmap.put("fileSrc", rset.getString("FILE_SRC"));
				hmap.put("saveDate", rset.getDate("SAVE_DATE"));
				hmap.put("fileDiv", rset.getString("FILE_DIV"));
				hmap.put("postsId", rset.getString("POSTS_ID"));
				hmap.put("productCode", rset.getString("PRODUCT_CODE"));
				hmap.put("title", rset.getString("PRODUCT_NAME"));
				hmap.put("price", rset.getInt("PRODUCT_MONEY"));
				hmap.put("writer", rset.getString("MEMBER_NO"));
				hmap.put("contents", rset.getString("CONTENTS"));
				list.add(hmap);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}


		return list;
	}
	//공지사항 작성 삽입
	public int insertNoticeContent(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNoticeContent");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getPostsTitle());
			pstmt.setString(2, b.getContents());
			pstmt.setInt(3, b.getMemberNo());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			
		return 0;
	}



}



























