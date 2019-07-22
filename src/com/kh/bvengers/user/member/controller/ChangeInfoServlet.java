package com.kh.bvengers.user.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bvengers.user.member.model.service.MemberService;
import com.kh.bvengers.user.member.model.vo.Member;

@WebServlet("/changeInfo.mp")
public class ChangeInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangeInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String memberPassword = request.getParameter("memberPassword");
		String memberName = request.getParameter("memberName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String zip = request.getParameter("zipCode");
		String add1 = request.getParameter("address1");
		String add2 = request.getParameter("address2");
		String address = zip + add1 + add2;
		
		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberPassword(memberPassword);
		m.setMemberName(memberName);
		m.setEmail(email);
		m.setAddress(address);
		m.setPhone(phone);
		
		int result = new MemberService().changeMember(m);
		
		if(result > 0) {
			response.sendRedirect("/sp/index.jsp");
		}else {
			request.setAttribute("msg","회원정보변경 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
