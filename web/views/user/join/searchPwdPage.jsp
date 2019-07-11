<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap"
	rel="stylesheet">
<title>비밀번호 찾기</title>
<style>
	form {
		width:40%;
		background:#E7E7E7;
		border-radius: 5px;
		font-family: 'Sunflower', sans-serif;
		border-radius: 5px;
	}
	.btn1 {
		background:#ffd8d9;	
		border-radius: 5px;
	}
	
	.btn_search {
	width:49%;
	height: 50px;
	border: 1px solid #ffd8d9;
	font-size: 16px;
	font-family: 'Sunflower', sans-serif;
	background-color: #ffd8d9;
	border-radius: 5px;
	color: black;
	}
	
	.btn_searchPwd {
	width:64px;
	height: 25px;
	border: 1px solid #ffd8d9;
	font-size: 13px;
	font-family: 'Sunflower', sans-serif;
	background-color: #ffd8d9;
	color: black;
	}
	
	.btn_pwd {
	margin:0 auto;
	width: 10%;
	height: 30px;
	border: 1px solid #ffd8d9;
	font-size: 13px;
	font-family: 'Sunflower', sans-serif;
	border-radius: 5px;
	background-color: #ffd8d9;
	color: black;
	}
	
	.btn_pwd:hover {color:white;}
	
</style>
</head>
<header><%@ include file="../hfl/header.jsp" %></header>
<body>
	<div align="center">

		<br><br><br><br><br><br><br>
		<form action="" method="post">
			<div align="center" class="btn1">
  			<a href="searchIdPage.jsp"> <button type="button" class="btn_search" float="left">아이디 찾기</button></a>
  			<a href="#"> <button type="button" class="btn_search" float="left">비밀번호 찾기</button></a>
			</div>
			<br><br>
			<input type="checkbox" name="searchPhone" id="searchPhone" value="휴대폰으로 찾기">
			<label for="searchPhone">휴대폰으로 찾기</label>
			
			<br>
			
			<input type="text" placeholder="아이디" name="userId" id="userId" size=30><br>
			
			<input type="text" placeholder="이름" name="userName" id="userName" size=30><br>
			
			<input type="tel" placeholder="휴대폰번호(숫자만 입력)" name="phone" id="phone" size=20>
			<button type="button" class="btn_searchPwd" style="">인증번호</button><br>
			
			<input type="text" placeholder="인증번호 입력" name="checkNumber" id="checkNumber" size=30><br>
			
			<br><br>
			
			<input type="checkbox" name="searchEmail" id="searchEmail" value="이메일로 찾기">
			<label for="searchPhone">이메일로 찾기</label>
			
			<br>
			
			<input type="text" placeholder="아이디" name="userId" id="userId" size=30><br>
			
			<input type="text" placeholder="이름" name="userName" id="userName" size=30><br>
			
			<input type="tel" placeholder="이메일" name="phone" id="phone" size=20>
			<button type="button" class="btn_searchPwd">인증번호</button><br>
			
			<input type="text" placeholder="인증번호 입력" name="checkNumber" id="checkNumber" size=30><br>
			
			<br><br>
			
			<input type="submit" value="확인" class="btn_pwd"> &nbsp; &nbsp;
			<input type="reset" value="취소" class="btn_pwd">
			<br><br>
		</form>
	</div>
	<br><br><br><br><br><br><br>
<footer><%@ include file="../hfl/footer.jsp" %></footer>
</body>
</html>