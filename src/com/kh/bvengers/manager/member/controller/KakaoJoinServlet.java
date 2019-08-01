package com.kh.bvengers.manager.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.bvengers.user.member.model.service.MemberService;
import com.kh.bvengers.user.member.model.vo.Member;

@WebServlet("/kakaojoin.me")
public class KakaoJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KakaoJoinServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String array =(String)request.getParameter("array");
		int idx = array.indexOf(",");
		int idx1 = array.indexOf("/");
		
		String id = array.substring(0, idx);
		String nickname = array.substring(idx+1,idx1);
		String token = array.substring(idx1+1);
		
		System.out.println(id);
		System.out.println(nickname);
		System.out.println(token);
		int result = new MemberService().kakaojoin(id,nickname,token);
		PrintWriter out = response.getWriter();
		if(result>0) {
			Member loginUser = new MemberService().kakaologin(id);
			if(loginUser!=null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				response.sendRedirect(request.getContextPath()+"/index.jsp");
			}
		}else {
			out.append("fail");
			request.setAttribute("msg", "로그인실패!");
			request.getRequestDispatcher("views/common/errorPagePrompt.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
