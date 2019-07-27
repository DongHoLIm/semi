package com.kh.bvengers.manager.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bvengers.board.model.service.BoardService;
import com.kh.bvengers.board.model.vo.Board;
import com.kh.bvengers.board.model.vo.BoardPageInfo;

/**
 * Servlet implementation class SelectManagerQnAServlet
 */
@WebServlet("/smqs.mq")
public class SelectManagerQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectManagerQnAServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = "";
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		int num =5;
		
		currentPage = 1;
		
		int listCount = new BoardService().getListQandACount(num);
		
		if(request.getParameter("currnetPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit =  10;
		
		maxPage = (int)((double)listCount/limit+0.9);
		
		startPage = (((int)((double)currentPage / limit + 0.9))-1) * 10 + 1;
		
		endPage = startPage + 10 -1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		BoardPageInfo pi = new BoardPageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		 ArrayList<Board> list = new BoardService().selectManagerList(currentPage, limit, num);

	      if (list != null) {
	         request.setAttribute("list", list);
	         request.setAttribute("pi", pi);
	     	page = "views/manager/board/qnaboardmenagement.jsp";
	     	
	      } else {
	         page= "views/common/errorPage.jsp";
	         request.setAttribute("msg", "게시판 조회 실패!");
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
