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
import com.kh.bvengers.board.model.vo.Board;
import com.kh.bvengers.board.model.vo.Attachment;


/**
 * Servlet implementation class SelectOneNotice
 */
@WebServlet("/son.no")
public class SelectOneNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneNotice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		HashMap<String, Object> hmap = new BoardService().selectOneNotice(num);

		Board b = (Board)hmap.get("board");
		ArrayList<Attachment> fileList = (ArrayList<Attachment>)hmap.get("attachment");

		String page = "";
		
		if(hmap != null) {
			page = "views/user/board/boardDetail.jsp";
			request.setAttribute("b", b);
			request.setAttribute("fileList", fileList);
		}else {
			page = "views/common/errorPagePrompt.jsp";
			request.setAttribute("msg", "사진 게시판 상세보기 실패!");
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















