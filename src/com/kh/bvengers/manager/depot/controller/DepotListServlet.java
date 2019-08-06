package com.kh.bvengers.manager.depot.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.bvengers.manager.depot.model.servies.DepotService;
import com.kh.bvengers.manager.depot.model.vo.Depot;
import com.kh.bvengers.manager.depot.model.vo.DepotPageInfo;


@WebServlet("/list.dp")
public class DepotListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DepotListServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;		
		int limit;				
		int maxPage;			
		int startPage;			
		int endPage;			
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int listCount = new DepotService().getCheckListCount();
		
		maxPage = (int)((double)listCount/limit+0.9);
		
		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		DepotPageInfo pi = new DepotPageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		ArrayList <Depot> list = new DepotService().selectCheckAll(currentPage,limit);
		
		String page ="";
		
		if(list!=null) {			
			page = "views/manager/depot/depotCheckList.jsp";
			request.setAttribute("list",list);			
			request.setAttribute("pi", pi);			
		}else {
			page="views/common/errorPagePrompt.jsp";
			request.setAttribute("msg", "리스트출력실패");			
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
