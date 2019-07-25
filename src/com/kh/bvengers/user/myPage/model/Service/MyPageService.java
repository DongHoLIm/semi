package com.kh.bvengers.user.myPage.model.Service;

import static com.kh.bvengers.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.bvengers.user.myPage.model.Dao.MyPageDao;
import com.kh.bvengers.user.myPage.model.vo.myPage;

public class MyPageService {

	public ArrayList<myPage> selectMyPageList(String memberNo, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<myPage> mplist = new MyPageDao().selectMyPageList(con, memberNo, currentPage, limit, limit);
		
		close(con);
		
		return mplist;
	}

	
	//전체 게시물 수 조회용 메소드
	public int getListCount(String memberNo) {
		Connection con = getConnection();
		
		int listCount = new MyPageDao().getListCount(con, memberNo);
		
		close(con);
		
		return listCount;
	}


	public ArrayList<myPage> selectDeliReadyList(String memberNo) {
		Connection con = getConnection();
		
		ArrayList<myPage> drlist = new MyPageDao().selectDeliReadyList(con, memberNo);
		
		close(con);
		
		return drlist;
	}

}
