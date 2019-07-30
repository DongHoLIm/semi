package com.kh.bvengers.manager.member.controller;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bvengers.manager.member.model.service.ManagerMemberService;
import com.kh.bvengers.manager.member.model.vo.SANCTION;
@WebServlet("/badsearch.me")
public class BadMemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BadMemberSearchServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String howsearch[] = request.getParameterValues("selecthowsearch");
		String select = howsearch[0];
		System.out.println(select);
		String searchValue = (String) request.getParameter("searchValue");
		
		ArrayList<SANCTION> list = null;
		if(select.equals("stopbadman")) {
			list = new ManagerMemberService().searchstopbadman(searchValue);
		}else if(select.equals("badblackman")){
			list = new ManagerMemberService().searchbadblackman(searchValue);
		}
		String page = "";
		if(list!=null) {
			request.setAttribute("list", list);
			page = "views/manager/member/blackList.jsp";
		}else {
			request.setAttribute("msg", "실패");
			page="/views/common/errorPagePrompt.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
