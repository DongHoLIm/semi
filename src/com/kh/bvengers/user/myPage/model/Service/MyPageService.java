package com.kh.bvengers.user.myPage.model.Service;

import static com.kh.bvengers.common.JDBCTemplate.close;
import static com.kh.bvengers.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.bvengers.user.myPage.model.Dao.MyPageDao;
import com.kh.bvengers.user.myPage.model.vo.myPage;

public class MyPageService {

	public ArrayList<myPage> selectMyPageList(String memberId) {
		Connection con = getConnection();
		ArrayList<myPage> mplist = new MyPageDao().selectMyPageList(con, memberId);
		
		close(con);
		
		return mplist;
	}

}
