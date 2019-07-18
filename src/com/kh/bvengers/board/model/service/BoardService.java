package com.kh.bvengers.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.bvengers.board.model.dao.BoardDao;

import static com.kh.bvengers.common.JDBCTemplate.*;
public class BoardService {

	public ArrayList<HashMap<String, Object>> selectProductList() {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new BoardDao().selectProductList(con);
		
		close(con);
		return list;
	}

}
