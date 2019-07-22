package com.kh.bvengers.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.bvengers.board.model.vo.Attachment;
import com.kh.bvengers.board.model.vo.Posts;
import com.kh.bvengers.board.model.vo.PostsContents;
import com.kh.bvengers.common.MyFileRenamePolicy;
import com.kh.bvengers.product.model.service.ProductService;
import com.kh.bvengers.product.model.vo.Product;
import com.kh.bvengers.product.model.vo.ProductCheck;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertProductPostServlet
 */
@WebServlet("/insert.po")
public class InsertProductPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProductPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 20;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			System.out.println(root);
			String savePath = root + "thumbnail_uploadFiles/";
			
			
			MultipartRequest multiRequest = 
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				
				System.out.println("fileSystem name : " + multiRequest.getFilesystemName(name));
				System.out.println("originFile name : " + multiRequest.getOriginalFileName(name));
			}
			
			//int memberNo = ((Member) (request.getSession().getAttribute("loginUser"))).getMemberNo();
			//로그인 기능 추가 시 위 주석 해제(현재 로그인한 유저 번호)
			String postsTitle = multiRequest.getParameter("postsTitle");				//posts 제목
			String productName = multiRequest.getParameter("productName");				//product 상품명
			int productMoney = Integer.parseInt(multiRequest.getParameter("productMoney"));//product 가격
			String contents = multiRequest.getParameter("contents");					//posts_contents 내용
			String keepDate = multiRequest.getParameter("keepDate");					//product 보관일자
			String subCate = multiRequest.getParameter("subCate");					//product 카테고리

			String productCode = "";												//product 상품코드
			String productCate = "";												//product 카테고리 코드

			if(subCate.equals("desktop")) {
				productCode = "PD";
				productCate = "DESKTOP";
			}else if(subCate.equals("pcEtc")) {
				productCode = "PE";
				productCate = "PC_ETC";
			}else if(subCate.equals("case")) {
				productCode = "NC";
				productCate = "CASE";
			}else if(subCate.equals("notebook")) {
				productCode = "NN";
				productCate = "NOTEBOOK";		
			}else if(subCate.equals("notebookEtc")) {
				productCode = "NE";
				productCate = "NOTE_ETC";
			}else if(subCate.equals("ha")) {
				productCode = "AH";
				productCate = "HA";
			}else if(subCate.equals("ka")) {
				productCode = "AK";
				productCate = "KA";
			}else{
				productCode = "AC";
				productCate = "CAMERA";
			}
			
			//posts테이블 객체 생성
			Posts posts = new Posts();
			posts.setPostsTitle(postsTitle);
			//p.setMemberNo(memberNo);
			
			//postsContents 객체 생성
			PostsContents postsContents = new PostsContents();
			postsContents.setContents(contents);
			
			//product 객체 생성
			Product product = new Product();
			product.setProductCode(productCode);
			product.setProductName(productName);
			product.setProductMoney(productMoney);
			product.setProductCate(productCate);
			//product.setMemberNo(memberNo);
			product.setKeepDate(keepDate);
			
			//attachment 객체는 ArrayList 형태로 생성
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			for(int i = originFiles.size()-1; i >= 0; i--) {
				Attachment at = new Attachment();
				at.setFileSrc(savePath);
				at.setOrginFileName(originFiles.get(i));
				at.setNewFileName(saveFiles.get(i));
				
				fileList.add(at);
			}
			
			System.out.println("controller board : " + posts);
			System.out.println("controller attachment list : " + fileList);
			
			int result = new ProductService().insertProductPost(posts, postsContents, product, fileList);
			
			if(result >0) {
				//response.sendRedirect(request.getContextPath() + "/select.pd");
				response.sendRedirect("index.jsp");
			}else {
				//실패 시 저장된 사진 삭제
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				
				request.setAttribute("msg", "상품 등록 실패!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				
				
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}




























