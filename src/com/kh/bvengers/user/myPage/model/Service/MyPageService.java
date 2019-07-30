package com.kh.bvengers.user.myPage.model.Service;

import static com.kh.bvengers.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.bvengers.user.myPage.model.Dao.MyPageDao;
import com.kh.bvengers.user.myPage.model.vo.myPage;

public class MyPageService {

	public ArrayList<myPage> selectMyPageList(String memberNo, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<myPage> mplist = new MyPageDao().selectMyPageList(con, memberNo, currentPage, limit);
		
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


	public ArrayList<myPage> selectOrderLookList(String memberNo, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<myPage> olList = new MyPageDao().selectOrderLookList(con, memberNo, currentPage, limit);
		
		close(con);
				
		return olList;
	
	}


	public ArrayList<myPage> selectOrderDetailList(String memberNo, String ono) {
		Connection con = getConnection();
		ArrayList<myPage> odList = new MyPageDao().selectOrderDetailList(con, memberNo, ono);

		close(con);
		
		return odList;
	}


	public int getOrderLookListCount(String memberNo) {
		Connection con = getConnection();
		
		int listCount = new MyPageDao().getOrderLookListCount(con, memberNo);
		
		close(con);
		
		return listCount;
	}


	public int getOrderDateCount(String memberNo, String start, String end) {
		Connection con = getConnection();
		
		int listCount = new MyPageDao().getOrderDateCount(con, memberNo, start, end);
		
		close(con);
		
		return listCount;
	}


	public ArrayList<myPage> orderDateList(String memberNo, String start, String end, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<myPage> dateList = new MyPageDao().selectOrderDateList(con, memberNo, start, end, currentPage, limit);
		
		close(con);
		
		return dateList;
	}
		
	}


