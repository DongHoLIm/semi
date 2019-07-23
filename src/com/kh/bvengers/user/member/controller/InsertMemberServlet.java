package com.kh.bvengers.user.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bvengers.user.member.model.service.MemberService;
import com.kh.bvengers.user.member.model.vo.Member;


@WebServlet("/insertMember.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPassword");
		String memberPwd2 = request.getParameter("memberPassword2");
		String memberName = request.getParameter("memberName");
		String email = request.getParameter("email");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		String address4 = request.getParameter("address4");
		String address = address1 + address2 + address3+address4;
		String phone = request.getParameter("phone");
		
		Member m = new Member();
		
		if(memberPwd.equals(memberPwd2)) {
			String memberPassword = memberPwd2;
			
			m.setMemberId(memberId);
			m.setMemberPassword(memberPassword);
			m.setMemberName(memberName);
			m.setEmail(email);
			m.setAddress(address);
			m.setPhone(phone);
			int result = new MemberService().insertMember(m);
			
			if(result>0) {
				response.sendRedirect("/sp/index.jsp");
			}else {
				request.setAttribute("msg","실패하셨습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}else {
			request.setAttribute("msg", "비밀번호를 확인하세요");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
