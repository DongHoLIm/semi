package com.kh.bvengers.user.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bvengers.user.member.model.service.MemberService;
import com.kh.bvengers.user.member.model.vo.Member;

@WebServlet("/searchMember.me")
public class SearchMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selecthowsearch = request.getParameter("selecthowsearch");
		String searchValue = "";
		
		if(selecthowsearch.equals("findId")) {
			searchValue = request.getParameter("searchValue");
		}else if(selecthowsearch.equals("findName")) {
			searchValue = request.getParameter("searchValue");
		}else {
			searchValue = request.getParameter("searchValue");
		}
		
		System.out.println(selecthowsearch);
		System.out.println(searchValue);
		
		ArrayList<Member> list = new MemberService().searchMember(selecthowsearch,searchValue);
		System.out.println(list);
		
		String page = "";
		if(list!=null) {
			request.setAttribute("list", list);
			page = "views/manager/member/blackList.jsp";
		}else {
			request.setAttribute("msg", "목록조회실패!");
			page="/views/common/errorPagePrompt.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
