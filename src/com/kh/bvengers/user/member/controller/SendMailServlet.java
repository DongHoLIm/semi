package com.kh.bvengers.user.member.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/send.me")
public class SendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SendMailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String receiver = request.getParameter("email");
		System.out.println(receiver);
		
		final String sender = "youngji0517@naver.com";//네이버아이디쓰삼(test@naver.com)
		final String password = "rkdehddnjs";//네이버비밀번호
		
		
		//인증 번호 생성기
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for(int i = 0; i < 10; i++) {
			int rIndex =rnd.nextInt(3);
			switch(rIndex) {
			case 0 : 
				//a-z
				temp.append((char) ((int)(rnd.nextInt(26))+97));break;
			case 1 : 
				//A-Z
				temp.append((char) ((int)(rnd.nextInt(26))+65));break;
			case 2 : 
				//0-9
				temp.append((rnd.nextInt(10)));break;
			}
			
		}
		String key = temp.toString();
		System.out.println(key);
		
		String title = "중고애민족 회원가입 인증 메일입니다.";
		String contents = "인증번호는 "+key;
		String host = "smtp.naver.com";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", 25);
		
		System.out.println(props.get("mail.smtp.port"));
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(sender));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));

			// sender Email Address
			message.setFrom(sender);

			// Subject
			message.setSubject("[TEST-Mail-Service] " + title);

			// Text
			message.setText(contents, "UTF-8", "html");

			// send the message
			Transport.send(message);
			System.out.println("전송 완료!!!!");
			
			HttpSession ss = request.getSession();
			ss.setAttribute("mailkey", key);
			request.getRequestDispatcher("views/user/join/checkMail.jsp").forward(request,response);
			
		} catch (MessagingException e) {
			System.out.println("전송 실패!! ㅠㅠ");
			e.printStackTrace();
		}
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
