package com.kh.bvengers.manager.depot.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bvengers.manager.depot.model.servies.DepotService;
import com.kh.bvengers.manager.depot.model.vo.Depot;

@WebServlet("/requestCheck.dp")
public class RequestCheckStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RequestCheckStatusServlet() {
        super();
        
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productCode = request.getParameter("productCode");
		String location =  request.getParameter("location");
		String session = request.getParameter("session");
		String checkStatus=request.getParameter("request");
		String completStatus=request.getParameter("status");
		String checkPassContent=request.getParameter("checkPassContent");
		
		
		Depot d = new Depot();
		String locationCode = location+session;
		if(checkStatus.equals("requestCheck")) {
			checkStatus="1";
			completStatus="2";
		}else if(checkStatus.equals("checking")) {
			checkStatus="2";
			completStatus="2";
		}else {
			checkStatus="3";
			if(completStatus.equals("pass")) {
				completStatus="1";
			}else if(completStatus.equals("fail")) {
				completStatus="2";
			}else {
				completStatus="3";
			}
		}
		d.setCheckStatus(checkStatus);
		d.setCompletStatus(completStatus);
		d.setCheckPassContent(checkPassContent);
		d.setProductCode(productCode);
		d.setLocationCode(locationCode);
		d.setSession(session);
		d.setLocation(location);			
		int result = new DepotService().requsetCheck(d);
		
		
		String page = "";
		
		if(result>0) {
			page="views/common/errorPagePrompt.jsp";
			request.setAttribute("msg", "뭐하냐 병신아");
			request.getRequestDispatcher(page).forward(request, response);
		}else {
			page=request.getContextPath()+"/list.dp";
			response.sendRedirect(page);
		}
		
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}