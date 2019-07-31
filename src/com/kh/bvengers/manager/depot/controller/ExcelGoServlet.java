package com.kh.bvengers.manager.depot.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bvengers.manager.depot.model.servies.DepotService;
import com.kh.bvengers.manager.depot.model.vo.Depot;
import com.kh.bvengers.manager.depot.model.vo.DepotPageInfo;

/**
 * Servlet implementation class ExcelGoServlet
 */
@WebServlet("/excelGo.dp")
public class ExcelGoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExcelGoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
		
		int listCount = new DepotService().getAllListCount();
		
		maxPage = (int)((double)listCount/limit+0.9);
		
		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		DepotPageInfo pi = new DepotPageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		ArrayList <Depot> list = new DepotService().selectAllList(currentPage,limit);
		
		String page ="";
		if(list!=null) {
			page ="views/manager/depot/DepotExcel.jsp";
			request.setAttribute("list",list);
			
		}else {
			page ="views/common/errorPagePrompt.jsp";
			request.setAttribute("msg", "excel출력 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
