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

/**
 * Servlet implementation class InDepotServlet
 */
@WebServlet("/inDepot.dp")
public class InDepotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InDepotServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList <Depot> list = new DepotService().selectInList();
		
		String page = "";
		
		if(list!=null) {
			page = "views/manager/depot/depotIn.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/common/errorPagePrompt.jsp";
			request.setAttribute("msg", "nolist");
			
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
