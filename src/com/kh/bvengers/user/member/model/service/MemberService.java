package com.kh.bvengers.user.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.bvengers.user.member.model.dao.MemberDao;
import com.kh.bvengers.user.member.model.vo.Member;
import static com.kh.bvengers.common.JDBCTemplate.*;
public class MemberService {

	public Member loginCheck(String memberId, String memberPwd) {
		Connection con = getConnection();
		Member loginUser = new MemberDao().loginCheck(con,memberId,memberPwd);
		close(con);
		return loginUser;
	}

	public int insertMember(Member m) {
		Connection con = getConnection();
		int result = new MemberDao().insertMember(con,m);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}


	public int changeMember(Member m) {
		Connection con = getConnection();

		int result = new MemberDao().changeMember(con, m);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Member> selectAll() {
		Connection con = getConnection();
		ArrayList<Member> list = new MemberDao().selectAll(con);

		close(con);
		return list;
	}

	public ArrayList<Member> searchMember(String selecthowsearch, String searchValue) {
		Connection con = getConnection();
		ArrayList<Member> list = null;
		if(selecthowsearch.equals("findId")) {
			list = new MemberDao().searchId(con,searchValue);
		}else if(selecthowsearch.equals("findName")) {
			list = new MemberDao().searchName(con,searchValue);
		}else {
			list = new MemberDao().searchLevel(con,searchValue);
		}

		close(con);
		return list;
	}

	public ArrayList<Member> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Member> mlist = new MemberDao().selectList(con,currentPage,limit);
		close(con);
		return mlist;
	}

	public Member findUserId(String memberName, String phone, String email) {
		Connection con = getConnection();
		Member m = new MemberDao().findUserId(con,memberName,phone,email);
		close(con);
		return m;

	}
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new MemberDao().getListCount(con);

		close(con);
		return listCount;
	}

	public Member showDetail(String memberId) {
		Connection con = getConnection();
		Member m = new MemberDao().showDetail(con,memberId);
		close(con);
		return m;
	}

	public Member checkPwd(String memberPwd) {
		 Connection con = getConnection();
		 Member checkPwd = new MemberDao().checkPwd(con, memberPwd);
		 close(con);


		return checkPwd;
	}

	public int deleteMember(String memberId) {
		Connection con = getConnection();
		int result = new MemberDao().deleteMember(con, memberId);

		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public Member getblackmember(String memberId) {
		Connection con = getConnection();
		Member m = new MemberDao().getblackmember(con,memberId);
		if(m!=null) {
			int result = new MemberDao().upblack(con,m);
		}
		close(con);
		return m;
	}

	public Member searchInfo(String userId) {
		Connection con = getConnection();
		Member m = new MemberDao().searchInfo(con, userId);
		close(con);
		return m;
	}

}
