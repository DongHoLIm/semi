package com.kh.bvengers.board.model.service;

import static com.kh.bvengers.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.bvengers.board.model.dao.BoardDao;

public class BoardService {

	public ArrayList<HashMap<String, Object>> selectProductList() {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new BoardDao().selectProductList(con);

		close(con);
		return list;
	}

	public HashMap<String, Object> selectOneProduct(int num) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = null;

		int result = new BoardDao().updateCount(con, num);

		if (result > 0) {
			hmap = new BoardDao().selectOneProduct(con, num);
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return hmap;
	}

	public ArrayList<HashMap<String, Object>> searchProductByTitle(String value) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new BoardDao().searchProductByTitle(con, value);
		close(con);
		return list;
	}

	public ArrayList<HashMap<String, Object>> searchProductByCategory(String value) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new BoardDao().searchProductByCategory(con, value);
		close(con);
		return list;
	}

	public ArrayList<HashMap<String, Object>> searchProductByContent(String value) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new BoardDao().searchProductByContents(con, value);
		close(con);
		return list;
	}

}
