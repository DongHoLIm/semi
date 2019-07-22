<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* , com.kh.bvengers.user.member.model.vo.*"%>
    <%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
    Member loginUser = (Member) session.getAttribute("loginUser");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td{
text-align:center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
					<div style="display:none;"><%@ include file="../hfl/managerHeader.jsp"%></div>
				
				<% for(Member m : list){ %> 
				<tr>
					<td><%=m.getMemberId() %></td>
					<td><%=m.getMemberName() %></td>
					<td><%=m.getPhone() %></td>
					<td><%=m.getGradeCode() %></td>
					<td><%=m.getAddress() %></td>
					<td><%=m.getEnrollDate() %></td>
					<td><%=m.getSellCount() %></td>
					<td>시발이라고 욕을 하였읍니다...</td>
				</tr>
				<%} %>
</body>
</html>