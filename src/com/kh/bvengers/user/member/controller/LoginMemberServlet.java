package com.kh.bvengers.user.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.bvengers.user.member.model.service.MemberService;
import com.kh.bvengers.user.member.model.vo.Member;

@WebServlet("/login.me")
public class LoginMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("loginId");
		String memberPwd = request.getParameter("password");
		Member loginUser = new MemberService().loginCheck(memberId,memberPwd);
		
		
		if(loginUser!=null && !loginUser.getMemberId().equals("admin")) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			response.sendRedirect("index.jsp");
		}else if(loginUser!= null && loginUser.getMemberId().equals("admin")){
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			response.sendRedirect("/sp/smnl.mm");
		}else if(loginUser == null){
			request.setAttribute("msg", "로그인실패");
			request.getRequestDispatcher("views/user/login/login.jsp").forward(request, response);
		}
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
