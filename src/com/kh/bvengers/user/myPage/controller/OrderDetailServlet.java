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

@WebServlet("/orderDetail.mp")
public class OrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String memberNo = loginUser.getMemberNo();
		String ono = request.getParameter("ono");
		System.out.println("ono : " + ono);
		System.out.println("ld : " + memberNo);
		
		
		ArrayList<myPage> odList = new MyPageService().selectOrderDetailList(memberNo, ono);
		//myPage orderCheck = new MyPageService().orderCheck(ono);
		String page = "";
		
		if(odList != null) {
			for(myPage m : odList) {
				if(m.getRefundStatus() == null){
					if(m.getDstatus() != null) {
						if(m.getDstatus().equals("1")) {
							m.setDstatus("배송 준비중");
							m.setPayStatus("");
						}else if(m.getDstatus().equals("2")) {
							m.setDstatus("배송 중");
							m.setPayStatus("");
						}else if(m.getDstatus().equals("3")){
							m.setDstatus("배송 완료");
							m.setPayStatus("");
						}
					}else if(m.getDstatus() == null) {
						if(m.getPayStatus().equals("1")) {
							m.setPayStatus("결제 완료");
						}else if(m.getPayStatus().equals("2")) {
							m.setPayStatus("결제 취소");
						}
					}
					
				}else {
					
					if(m.getRefundStatus().equals("1")) {
						m.setRefundStatus("환불 대기");
						m.setPayStatus("");
						m.setDstatus("");
					}else if(m.getRefundStatus().equals("2")) {
						m.setRefundStatus("환불 완료");
						m.setDstatus("");
					}
				}
			}

			//response.sendRedirect("views/user/mypage/orderDetails.jsp");
			page = "view/user/mypage/orderDetails.jsp";
			request.setAttribute("odList", odList);
			
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
