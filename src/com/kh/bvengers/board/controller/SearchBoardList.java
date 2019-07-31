package com.kh.bvengers.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bvengers.board.model.service.BoardService;
import com.kh.bvengers.board.model.vo.Board;
import com.kh.bvengers.board.model.vo.BoardPageInfo;

/**
 * Servlet implementation class SearchBoardList
 */
@WebServlet("/sbl.sh")
public class SearchBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBoardList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("selectid");
		String input = request.getParameter("input");
		
		int currentPage;
		int limit;
		int maxPage;
		int StartPage;
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
	
		int listCount = 0;	
		HashMap<String, Object> hmap = null;
		ArrayList <Board> list = null;
		
		BoardPageInfo pi =null;
		
		
		if(type!=null && input.equals("")&&type.equals("")) {
			//listCount = new BoardService().countlistSearch(type);
			
			maxPage = (int)((double)listCount/limit+0.9);
			
			StartPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
			
			endPage = StartPage + 10 - 1;
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}
		}
		
		
		
		
		
		
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}










