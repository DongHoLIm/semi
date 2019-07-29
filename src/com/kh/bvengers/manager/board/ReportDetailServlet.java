package com.kh.bvengers.manager.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bvengers.board.model.service.BoardService;
import com.kh.bvengers.board.model.vo.Board;

@WebServlet("/reportDetail.mb")
public class ReportDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReportDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postId = request.getParameter("postId");
		Board b = new BoardService().showDetail(postId);
		String page = "";
		if(b!=null) {
			page = "views/manager/board/reportDetail.jsp";
			request.setAttribute("b", b);
		}
		request.getRequestDispatcher(page).forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
