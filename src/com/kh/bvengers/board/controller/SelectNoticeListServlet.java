package com.kh.bvengers.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bvengers.board.model.service.BoardService;
import com.kh.bvengers.board.model.vo.Board;
import com.kh.bvengers.user.member.model.vo.PageInfo;

/**
 * Servlet implementation class SelectNoticeListServlet
 */
@WebServlet("/selectNotice.no")
public class SelectNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectNoticeListServlet() {
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
		
		//1페이지부터 시작
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 5;
		
		//전체 목록 개수 리턴
		int listCount = new BoardService().getListCount();
		System.out.println("listCount :" + listCount);

		maxPage = (int)((double)listCount/ limit+0.9);
		
		startPage = (((int)((double)currentPage / limit + 0.9))-1) * 10 + 1;
		
		endPage = startPage + 10 -1 ;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Board> list = new BoardService().selectList(currentPage, limit);
		
		
		
		String page = "";
		System.out.println("list" + list);
		
		if(list != null) {
			page = "views/user/board/board.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			page = "views/user/board/board.jsp";
			request.setAttribute("msg", "게시판 조회 실패");
		}
		request.getRequestDispatcher(page).forward(request,response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}











