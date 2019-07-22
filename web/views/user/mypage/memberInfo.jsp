<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
body {
	font-family:'Nanum Gothic', sans-serif;
}
.checkInfo {
	margin: 0 auto;
	margin-top:10%;
	margin-bottom:10%;
	width:35%;
	border-radius:5px;
	border:2px solid black;
	background-color:#FFF;
}
.btn_info	{
	border: 1px solid black;
	font-size: 14px;
	width:30%;
	font-family:'Nanum Gothic', sans-serif;
	font-weight:550;
	border-radius: 5px;
	background-color:#FFF;
	color: black;
}
</style>
</head>
<header><%@ include file="../hfl/header.jsp" %></header>
<body>

	<header><%@ include file="../hfl/myPageList.jsp"%></header>
<div align="center" class="checkInfo">
<br><br>
	<form action="" method="post">
		<h4 align="center">회원님</h4><br>
		<input type="text" placeholder=" 비밀번호를 입력해주세요." name="password" id="password" size=20 style="border-radius:5px; height:32px;"><br><br>
		<button class="btn_info" onclick=checkPwd();>확인</button><br><br><br><br>
	</form>
</div>
<footer><%@ include file="../hfl/footer.jsp" %></footer>
<Script>
function checkPwd(){
    var memberPwd = document.getElementById("password");
	
	$(".btn_info").click(function(){
		if($("memberPwd").val() = $("loginUser.MemberPassword").val()){
			location.href="changeInfo.jsp";
			
		}else{
			alert("비밀번호를 다시 입력해주세요.");
	};
	});
};
</Script>
S

</body>
</html>