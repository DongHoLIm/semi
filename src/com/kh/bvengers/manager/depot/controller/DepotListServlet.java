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


@WebServlet("/list.dp")
public class DepotListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DepotListServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList <Depot> list = new DepotService().selectCheckAll();
		
		String page ="";
		
		if(list!=null) {
			page = "views/manager/depot/depotCheckList.jsp";
			request.setAttribute("list",list);
			request.getRequestDispatcher(page).forward(request, response);
		}else {
			page="views/common/errorPagePrompt.jsp";
			request.setAttribute("msg", "fucking list");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
