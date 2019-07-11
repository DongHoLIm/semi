<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
.box_join {
	width:55%;
	border:2px solid #ffd8d9;
	margin:0 auto;
	border-radius: 5px;
}
.input_join {
	width:40%;
	margin:0 auto;
	border-radius: 5px;
	height:32px;
}
.input_join1 {
	margin:0 auto;
	border-radius: 5px;
	height:32px;
}
.input_join2 {
	margin:0 auto;
	border-radius: 5px;
	height:32px;
}
.btn_join{
	height:40px; 
	width:40%;
	margin:0 auto;
	border: 1px solid #ffd8d9;
	font-size: 15px;
	font-family:'Nanum Gothic', sans-serif;
	font-weight:550;
	border-radius: 5px;
	background-color: #ffd8d9;
	color: black;
	}
.btn_overlap {
	margin:0 auto;
	border: 1px solid #ffd8d9;
	font-size: 14px;
	font-family:'Nanum Gothic', sans-serif;
	font-weight:550;
	border-radius: 5px;
	background-color: #ffd8d9;
	color: black;
	}
	
.btn_join:hover {color:white;}
</style>
</head>
<header><%@ include file="../hfl/header.jsp" %></header>
<body>
		<form action="02_memberJoinResult.jsp" method="post">
		<div class = "header" align="center">
		<br><br>
		
		<br>
	</div>
	
	<div class="box_join" align="center">
		<h2>중고愛민족 회원가입</h2>
	<div class="box_login" align="center">
			<br><br>
			<input type="text" id="loginId" name="loginId" placeholder="  ID" style="width:30%;">
			<button type="button" class="btn_overlap" style="width:10%;">중복확인</button><br><br>
			<input type="password" id="loginPw" name="password" placeholder="  Password" style="width:40%;"><br><br>
			<input type="password" id="loginPw" name="password" placeholder="  Password 확인" style="width:40%;"><br><br>
			<input type="text" id="userName" name="userName" placeholder="  이름" style="width:40%;"><br><br>
			<input type="text" id="age" name="age" placeholder="  나이" style="width:40%;"><br><br>
			<input type="email" id="email" name="email" placeholder="  이메일" style="width:30%;">
			<button type="button" class="btn_overlap" style="width:10%;">중복확인</button><br><br>
			<input type="tel" id="phone" name="phone" placeholder="  phone" style="width:40%;"><br><br>
			<input type="text" id="address" name="address" placeholder="  주소" style="width:30%;">
			<button type="button" class="btn_overlap" style="width:10%;">우편번호</button><br><br>
		<select class="input_join">
			<option id="female" value="여자">여자
			<option id="male" value="남자">남자
		</select>
		<br><br>
		<input type="submit" value="가입" class="btn_join"><br><br>
		<input type="reset" value="취소" class="btn_join">
		<br><br>
	</div>
	</div>
		</form>
		<br><br>
		<footer><%@ include file="../hfl/footer.jsp" %></footer>

</body>
</html>