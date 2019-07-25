package com.kh.bvengers.user.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.bvengers.user.member.model.vo.Member;
import com.kh.bvengers.user.myPage.model.Service.MyPageService;
import com.kh.bvengers.user.myPage.model.vo.myPage;

@WebServlet("/deliReady.mp")
public class DelivetyReadyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DelivetyReadyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dr1 = request.getParameter("dr1");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String memberNo = loginUser.getMemberNo();
		
		ArrayList<myPage> drlist = new MyPageService().selectDeliReadyList(memberNo);
		ArrayList<myPage> mplist = new ArrayList<myPage>();
		
		
		String page = "";
		
		
    	
		if(drlist != null) {
			
			for(myPage m : drlist) {
				if(m.getDstatus().equals(dr1)) {
					
					mplist.add(m);
				}
				
			}
			page = "views/user/mypage/myPage.jsp";
			request.setAttribute("mplist", mplist);
		}else {
			page="views/common/errorPagePrompt.jsp";
			request.setAttribute("msg", "실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
		

	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
