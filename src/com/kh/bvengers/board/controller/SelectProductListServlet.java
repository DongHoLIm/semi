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

@WebServlet("/select.pd")
public class SelectProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectProductListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<HashMap<String, Object>> list = new BoardService().selectProductList();
		System.out.println("여기는 서블릿");
		System.out.println("이건 리스트" + list);
		String page = "";

		if(list != null) {
			page = "/views/user/product/test.jsp";
			request.setAttribute("list", list);
		} else {
			page = "views/common/errorPagePrompt.jsp";
			request.setAttribute("msg", "사진 게시판 조회 실패!!");
		}
		request.getRequestDispatcher(page).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}