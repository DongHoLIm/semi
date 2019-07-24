package com.kh.bvengers.user.myPage.controller;

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


@WebServlet("/listMyPage.mp")
public class listMyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public listMyPageServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("ggg");
    	
    	String page ="";


		HttpSession session = request.getSession();

		Member loginUser = (Member)session.getAttribute("loginUser");
		String memberId = loginUser.getMemberId();
		ArrayList<myPage> mplist = new MyPageService().selectMyPageList(memberId);
    	
		if(mplist != null) {
			page = "views/user/mypage/myPage.jsp";//회원리스트나올페이지
			request.setAttribute("mplist", mplist);
			
			for(myPage m : mplist) {
				if(m.getDstatus().equals("1")) {
					m.setDstatus("배송 전");
				}else if(m.getDstatus().equals("2")) {
					m.setDstatus("배송 중");
				}else {
					m.setDstatus("배송완료");
				}
			}
			
			
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
