package com.kh.bvengers.user.chat.model.service;

import java.sql.Connection;

import static com.kh.bvengers.common.JDBCTemplate.*;

public class TargetService {

	public TargetService() {
		// TODO Auto-generated constructor stub
	}

	public int selectTarget(String id) {
		Connection con = getConnection();
		int target = new TargetDao().selectTarget(id, con);
		close(con);
		return target;
	}

}
