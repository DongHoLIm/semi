package com.kh.bvengers.board.model.service;

import static com.kh.bvengers.common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.catalina.util.Introspection;

import com.kh.bvengers.board.model.dao.BoardDao;
import com.kh.bvengers.board.model.vo.Attachment;
import com.kh.bvengers.board.model.vo.Board;
import com.kh.bvengers.board.model.vo.Comment;
import com.kh.bvengers.board.model.vo.Posts;
import com.kh.bvengers.board.model.vo.PowerLink;
import com.sun.org.apache.bcel.internal.generic.ALOAD;

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
		//자주찾는 질문 작성
		public int insertNotice(Board b) {
			Connection con = getConnection();

			int result = new BoardDao().insertFrequentQuestion(con,b);

			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}

			close(con);

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

	public int[] getListCount(int num) {
		Connection con = getConnection();


		int listCount = new BoardDao().getListCount(con, num);


		int listCount2 = new BoardDao().getListCount2(con);

		int[] array = new int[2];

		array[0] = listCount;
		array[1] = listCount2;

		close(con);

		return array;

	}

	public int getListQandACount(int num) {

		Connection con = getConnection();

		int listCount = new BoardDao().getListCount(con,num);

		close(con);

		return listCount;
	}

	public ArrayList<Board> selectList(int currentPage, int limit){

		Connection con = getConnection();

		ArrayList<Board>list = new BoardDao().selectList(con,currentPage,limit);

		close(con);

		return list;
	}


	public ArrayList<Board> selectList1(int currentPage1, int limit1) {

		Connection con = getConnection();

		ArrayList<Board>list1 = new BoardDao().selectList1(con,currentPage1,limit1);

		close(con);

		return list1;
	}

	public ArrayList<Board> selectQandAList(int currentPage1, int limit, int num) {

		Connection con = getConnection();

		ArrayList<Board>list = new BoardDao().selectQandAList(con,currentPage1,limit,num);

		close(con);

		return list;
	}

	public ArrayList<Board> selectQuestionList(int limit) {

		Connection con = getConnection();

		ArrayList<Board>list = new BoardDao().selectQuestionList(con,limit);


		close(con);

		return list;
	}



	public HashMap<String, Object> selectOneNotice(int num) {
		Connection con = getConnection();

		HashMap<String, Object> hmap = null;

		int result = new BoardDao().updateCount(con,num);

		if(result > 0) {
			hmap = new BoardDao().selectOneNotice(con,num);
			System.out.println("zz" + hmap);
			commit(con);
		}else {
			rollback(con);
		}

		close(con);

		return hmap;
	}

	public ArrayList<HashMap<String, Object>> mainList(String value) {
	      Connection con = getConnection();
	      ArrayList<HashMap<String, Object>> list = new BoardDao().mainList(con, value);

	      close(con);
	      return list;

	}


	public ArrayList<Comment> insertComment(Comment b) {
		Connection con = getConnection();
		ArrayList<Comment> commentList = null;

		int result = new BoardDao().insertComment(con, b);

		if(result > 0) {
			commit(con);
			commentList = new BoardDao().selectCommentList(con, b.getPostsId());
		} else {
			rollback(con);
		}
		close(con);
		return commentList;
	}

	public ArrayList<Comment> selectComment(Comment b) {
		Connection con = getConnection();
		ArrayList<Comment> commentList = null;

		commentList = new BoardDao().selectCommentList(con, b.getPostsId());
		close(con);
		return commentList;
	}

}




















