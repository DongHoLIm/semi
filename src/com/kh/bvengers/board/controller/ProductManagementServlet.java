package com.kh.bvengers.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bvengers.board.model.service.BoardService;
import com.kh.bvengers.board.model.vo.Calculate;

/**
 * Servlet implementation class ProductManagementServlet
 */
@WebServlet("/productManagement")
public class ProductManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductManagementServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Calculate> list = new BoardService().paymentManagement();
		
		
		String page = "";
		
		if(list != null) {
			page = "views/manager/product/delivery.jsp";
			request.setAttribute("list", list);
			
		}else {
			page = "views/common/errorPagePrompt.jsp";
			request.setAttribute("msg", "조회 실패!");
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
