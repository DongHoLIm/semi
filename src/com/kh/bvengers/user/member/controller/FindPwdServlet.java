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

@WebServlet("/findPwd.me")
public class FindPwdServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

    public FindPwdServlet() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String memberId = (String) request.getParameter("userId");
     String newPwd = (String) request.getParameter("password");
     
      
      int result = new MemberService().temporaryPwd(memberId,newPwd);
      String page = "";
      
      PrintWriter out = response.getWriter();
      if(result>0) {
    	  
      request.getSession().invalidate();
      HttpSession ss = request.getSession();
      ss.setAttribute("sessionId", memberId);
      page = "views/user/login/login.jsp";
      request.getRequestDispatcher(page).forward(request, response);
      }else {
    	 out.append("fail");
      }
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}
