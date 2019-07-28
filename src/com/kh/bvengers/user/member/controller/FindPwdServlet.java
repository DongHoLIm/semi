package com.kh.bvengers.user.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bvengers.user.member.model.service.MemberService;

@WebServlet("/findPwd.me")
public class FindPwdServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public FindPwdServlet() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String newPwd = (String) request.getSession().getAttribute("mailkey");      
      String memberId = (String) request.getParameter("userId");
      System.out.println("findPwd");
      //int result = new MemberService().changePwd(newPwd, memberId);
      
      //String page = "";
      //if(result>0) {
         //page="views/user/join/searchPwdResult.jsp";
      //}
      request.setAttribute("memberId", memberId);
      request.getRequestDispatcher("views/user/join/searchPwdResult.jsp").forward(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}
