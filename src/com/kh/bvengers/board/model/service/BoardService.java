package com.kh.bvengers.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.bvengers.board.model.dao.BoardDao;
import com.kh.bvengers.board.model.vo.Attachment;
import com.kh.bvengers.board.model.vo.Board;

import static com.kh.bvengers.common.JDBCTemplate.*;
public class BoardService {

	public ArrayList<HashMap<String, Object>> selectProductList() {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new BoardDao().selectProductList(con);
		
		close(con);
		return list;
	}
	//공지사항 게시판 작성용
	public int insertNotice(Board b, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertNoticeContent(con,b);
		
		
		return result;
	}

}
