package com.kh.bvengers.manager.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bvengers.user.member.model.service.MemberService;

@WebServlet("/kakaojoin.me")
public class KakaoJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KakaoJoinServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = (String) request.getParameter("id");
		String nickname = (String) request.getParameter("nickname");
		int result = new MemberService().kakaojoin(id,nickname);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
