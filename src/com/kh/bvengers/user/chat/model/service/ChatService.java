package com.kh.bvengers.user.chat.model.service;

import java.sql.Connection;

import com.kh.bvengers.user.chat.model.dao.ChatDao;
import com.kh.bvengers.user.chat.model.vo.Chat;

import static com.kh.bvengers.common.JDBCTemplate.*;
public class ChatService {

	public int selectChat(String no) {
		Connection con = getConnection();

		int result = new ChatDao().selectChat(con, no);

		if(result == 0) {
			result = new ChatDao().createChat(con, no);
			commit(con);
		}

		close(con);
		return result;
	}

	public Chat joinChat(int no) {
		Connection con = getConnection();

		Chat ch = new ChatDao().joinChat(con, no);
		close(con);
		return ch;
	}



}
