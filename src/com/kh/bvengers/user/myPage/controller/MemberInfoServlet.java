package com.kh.bvengers.user.myPage.controller;

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

@WebServlet("/memberInfo.mp")
public class MemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	PrintWriter out = response.getWriter();
	
	String memberPwd = request.getParameter("password");
	
	Member checkPwd = new MemberService().checkPwd(memberPwd);
	
	if(checkPwd != null) {
		HttpSession session = request.getSession();
		session.setAttribute("checkPwd", checkPwd);
		
		response.sendRedirect("/sp/views/user/mypage/changeInfo.jsp");
	}else {
		out.println("<script>");
		out.println("alert('비밀번호가 맞지 않습니다.');");
		out.println("history.back();");
		out.println("</script>");
		/*request.setAttribute("msg", "비밀번호가 맞지 않습니다");
		request.getRequestDispatcher("/views/common/errorPagePrompt.jsp").forward(request, response);*/
	}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
