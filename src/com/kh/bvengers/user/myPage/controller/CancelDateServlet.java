package com.kh.bvengers.user.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.bvengers.user.member.model.vo.Member;
import com.kh.bvengers.user.myPage.model.Service.MyPageService;

@WebServlet("/cancelDate.mp")
public class CancelDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CancelDateServlet() {
        super();
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int currentPage;
    	int limit;
    	int maxPage;
    	int startPage;
    	int endPage;
    	
    	HttpSession session = request.getSession();
    	Member loginUser = (Member)session.getAttribute("loginUser");
    	String memberNo = loginUser.getMemberNo();
    	String start = request.getParameter("start");
    	String end = request.getParameter("end");
    	String currentPage1 = request.getParameter("currentPage");
    	
    	currentPage = 1;
    	
    	if(currentPage1 == null) {
    		currentPage = 1;
    	}else {
    		currentPage = Integer.parseInt(currentPage1);
    	}
    	
    	limit = 10;
    	
    	int listCount = new MyPageService().getCancelDateLookCount(memberNo, start, end);
    	
    
    
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
