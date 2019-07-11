<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
body {
	font-family:'Nanum Gothic', sans-serif;
}
.checkInfo {
	margin:0 auto;
	width:35%;
	border-radius:5px;
	background-color:#E7E7E7;
}
.btn_info	{
	border: 1px solid #ffd8d9;
	font-size: 14px;
	width:30%;
	font-family:'Nanum Gothic', sans-serif;
	font-weight:550;
	border-radius: 5px;
	background-color: #ffd8d9;
	color: black;
}
</style>
</head>
<header><%@ include file="../hfl/header.jsp" %></header>
<body>
<br><br>
<div align="center" class="checkInfo">
	<form action="" method="">
		<br><br><br>
		<h4 align="center">아이디 <%--  <%= loginUser.getUserId() %> --%>님</h4><br>
		<input type="text" placeholder=" 비밀번호를 입력해주세요." name="password" size=20 style="border-radius:5px; height:32px;"><br><br>
		<input type="submit" value="확인" class="btn_info"><br><br><br><br>
	</form>
</div>
<br><br>
<footer><%@ include file="../hfl/footer.jsp" %></footer>
</body>
</html>