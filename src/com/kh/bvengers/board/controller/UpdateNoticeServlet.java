package com.kh.bvengers.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.bvengers.board.model.service.BoardService;
import com.kh.bvengers.board.model.vo.Attachment;
import com.kh.bvengers.board.model.vo.Board;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UpdateNotice
 */
@WebServlet("/update.no")
public class UpdateNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(title);
		System.out.println(content);
		String hapche = (String) request.getParameter("hapche");
		System.out.println(hapche);
		int num = Integer.parseInt(request.getParameter("no"));
		System.out.println("시발넘버:"+num);*/
		/*b.setPostsTitle(title);
		b.setContents(content);
		b.setPostsId(num);
		*/
		/*int result = new BoardService().updateNotice(b);*/
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10;
			
			
			
			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println(root);
			
			String saveSrc = root + "thumbnail_uploadFiles/";
			
			MultipartRequest multiRequest = new MultipartRequest(request,saveSrc,maxSize,"UTF-8",new com.kh.bvengers.common.MyFileRenamePolicy());
			
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			int no = Integer.parseInt(multiRequest.getParameter("no"));

			
			Board b = new Board();
			b.setPostsTitle(title);
			b.setContents(content);
			b.setPostsId(no);
			
			int result = new BoardService().updateNotice(b);
			
			ArrayList<String> saveFiles = new ArrayList<String>();
		
			ArrayList<String> originFiles = new ArrayList<String>();
		
		
			Enumeration<String> files = multiRequest.getFileNames();
			
			

			while(files.hasMoreElements()) {
				
				
				String name = files.nextElement();

				if((!name.equals("files"))&& name!=null) {
										
				while(files.hasMoreElements()) {
					if(multiRequest.getFilesystemName(name) != null) {
						saveFiles.add(multiRequest.getFilesystemName(name));
						originFiles.add(multiRequest.getOriginalFileName(name));
					}else {
						break;
					}
					System.out.println("fileSystem name : " + multiRequest.getFilesystemName(name));
					System.out.println("originFile name : " + multiRequest.getOriginalFileName(name));
					System.out.println("어디서");
				}
				System.out.println("돌아");
				}
			}
				
				ArrayList<Attachment> fileList = new ArrayList<Attachment>();
				for(int i = originFiles.size() - 1; i >= 0 ; i--) {
					Attachment at = new Attachment();
					at.setFileSrc(saveSrc);
					at.setOrginFileName(originFiles.get(i));
					at.setNewFileName(saveFiles.get(i));
					
					fileList.add(at);
				}
				
				int resultpicture = new com.kh.bvengers.board.model.service.BoardService().insertpicture(b,fileList);

				String page = "";
				
				if(result > 0 && resultpicture >0) {
					
					response.sendRedirect("/jsp/selectOne.no?num=" + no);
					
				}else {
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "공지사항 수정 실패!!");
					request.getRequestDispatcher(page).forward(request, response);
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
