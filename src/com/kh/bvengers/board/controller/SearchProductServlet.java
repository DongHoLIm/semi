package com.kh.bvengers.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bvengers.board.model.service.BoardService;

/**
 * Servlet implementation class SearchProductServlet
 */
@WebServlet("/search.pd")
public class SearchProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchProductServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String search = request.getParameter("search");
		String value = request.getParameter("searchProduct");
		System.out.println(search);
		ArrayList<HashMap<String, Object>> list = null;
		if (search.equals("title")) {
			list = new BoardService().searchProductByTitle(value);
		} else if (search.equals("category")) {

		} else if (search.equals("content")) {

		} else {

		}
		String page = "";
		if (list != null) {
			System.out.println(list);
			page = "/views/user/product/test.jsp";
			request.setAttribute("list", list);
		} else {
			page = "/views/common/errorPagePrompt.jsp";
			request.setAttribute("msg", "사진 게시판 조회 실패!!");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
