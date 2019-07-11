<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
/* aside{
		width:10%; 
		text-align: center;
		border-style: solid;
  		border-width: 2px;
  		border-color: pink;
	} */
nav {
	margin-top: 15%;
	margin-right: 5%;
	/* padding-right:5%;
		padding-left:5%; */
}

.pwdchange{
   background:pink;
   margin-right:30%;
    margin-left:30%;
   height:60%;
}

.subpwd{
	background:white;
   border:2px solid black;
   	width:100%;
   	height:50%
   }
</style>
<title>Insert title here</title>
</head>
<body>
	<!-- header 영역 -->
	<header><%@ include file="../hfl/header.jsp"%></header>
<body>


	<h1 style = "text-align:center">회원정보 변경</h1>
	
	<br>>
	<div class="pwdchange">
		<h2 style = "text-align:center">비밀번호 변경</h3>
	<div class = "subpwd">	
	<br>
	<h4  style = "text-align:center">띄어쓰기 없는 영문 소문자,숫자포함 6~20자 사용가능</h4>
	<h4  style = "text-align:center">(아이디,생년월일,동일한 연속문자 숫자 사용 불가능)</h4>
	
	</div>
         </div>

	
	
	


	</aside>

</body>
<!-- footer 영역 -->
<footer><%@ include file="../hfl/footer.jsp"%></footer>

</html>










