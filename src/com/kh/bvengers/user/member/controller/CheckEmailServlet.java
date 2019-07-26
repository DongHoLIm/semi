package com.kh.bvengers.user.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/checkmail.me")
public class CheckEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckEmailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key = (String) request.getParameter("key");
		String check = (String) request.getSession().getAttribute("mailkey");

		String status = request.getParameter("hiddenvalue");
			
			System.out.println("내가 입력한 값 : "+key);
			System.out.println("인증키 : "+check);
			
			String msg = "";
		/*if(status.equals("1")) {
			request.setAttribute("msg", "인증에 성공하셨습니다.");
		}else if(status.equals("2")){
			request.setAttribute("msg", "인증 실패!");
			request.getSession().invalidate();
			//response.sendRedirect("views/user/join/join.jsp");
		}else {
			
		}*/
			if(key.equals(check)) {
				request.setAttribute("msg", "인증에 성공하셨습니다.");

			}else if(!key.equals(check)) {
				request.setAttribute("msg", "인증 실패!");
				request.getSession().invalidate();
			}
			request.getRequestDispatcher("views/user/join/checkMail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
