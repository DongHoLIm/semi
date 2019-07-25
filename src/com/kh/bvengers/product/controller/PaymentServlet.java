package com.kh.bvengers.product.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.bvengers.product.model.service.ProductService;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/payment.pa")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postsId = request.getParameter("postsId");
		
		HashMap<String, Object> productPay = new ProductService().productPay(postsId);
		
		
		String page = "";
		
		if(productPay != null) {
			page = "/views/user/product/payment.jsp";
			request.setAttribute("productPay", productPay);
		}else {
			page="/views/common/errorPage.jsp";
			request.setAttribute("msg", "상품 등록 실패!");
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






















