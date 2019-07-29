package com.kh.bvengers.manager.member.model.service;

import static com.kh.bvengers.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.bvengers.manager.member.model.dao.ManagerMemberDao;
import com.kh.bvengers.manager.member.model.vo.Report;

public class ManagerMemberService {

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new ManagerMemberDao().getListCount(con);
		close(con);
		return listCount;
	}

	public ArrayList<Report> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Report> mlist = new ManagerMemberDao().selectList(con,currentPage,limit);
		close(con);
		return mlist;
	}

	public int memberban(String memberId, int term, String reason) {
		Connection con = getConnection();
		int result = new ManagerMemberDao().memberban(con,memberId,term,reason);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int blackmember(String memberId, String reason) {
		Connection con = getConnection();
		int result = new ManagerMemberDao().blackmember(con,memberId,reason);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

}
