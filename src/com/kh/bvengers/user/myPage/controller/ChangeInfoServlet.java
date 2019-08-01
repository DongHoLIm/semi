package com.kh.bvengers.user.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bvengers.user.member.model.service.MemberService;
import com.kh.bvengers.user.member.model.vo.Member;

@WebServlet("/changeInfo.me")
public class ChangeInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ChangeInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String memberId = request.getParameter("memberId");
		String memberPassword = request.getParameter("memberpassword");
		String memberName = request.getParameter("memberName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String add1 = request.getParameter("address1");
		String add2 = request.getParameter("address2");
		String add3 = request.getParameter("address3");
		String address = add1 + " " + add2 + add3;

		Member loginUser = new Member();
		loginUser.setMemberId(memberId);
		loginUser.setMemberPassword(memberPassword);
		loginUser.setMemberName(memberName);
		loginUser.setEmail(email);
		loginUser.setAddress(address);
		loginUser.setPhone(phone);
		
		int result = new MemberService().changeMember(loginUser);
		if(result > 0) {

			request.setAttribute("loginUser", loginUser);
			response.sendRedirect("/sp/views/user/mypage/changeInfo.jsp");
			
			//page = "views/user/mypage/changeInfo.jsp";
			
		}else {
			request.setAttribute("msg","회원정보변경 실패!");
			request.getRequestDispatcher("/views/common/errorPagePrompt.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
