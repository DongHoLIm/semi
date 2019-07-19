package com.kh.bvengers.user.member.model.service;

import java.sql.Connection;

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

}
