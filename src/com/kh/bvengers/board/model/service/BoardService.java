package com.kh.bvengers.board.model.service;

import static com.kh.bvengers.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.bvengers.board.model.dao.BoardDao;
import com.kh.bvengers.board.model.vo.Attachment;
import com.kh.bvengers.board.model.vo.Board;
import com.kh.bvengers.board.model.vo.PowerLink;

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

	//공지사항 게시판 작성용
		public int insertNotice(Board b, ArrayList<Attachment> fileList) {
			Connection con = getConnection();

			int result = new BoardDao().insertNoticeContent(con,b);

			if(result > 0) {
				String postId = new BoardDao().selectCurrval(con)+"";

				for(int i = 0; i < fileList.size(); i++) {
					fileList.get(i).setPostsId(postId);
				}
			}

			int result1= new BoardDao().insertAttachment(con, fileList);

			if(result > 0 && result1 >0) {
				commit(con);
				result = 1;
			}else {
				rollback(con);
			}

			return result;
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

	public ArrayList<PowerLink> powerLink() {
		Connection con = getConnection();
		ArrayList<PowerLink> list = new BoardDao().powerLink(con);
		return list;
	}

}

















