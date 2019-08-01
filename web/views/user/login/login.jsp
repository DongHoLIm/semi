<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String msg = (String)request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.btn_login {
	height: 40px;
	width: 380px;
}

a {
	text-decoration: none;
	color: black;
	font-weight: bold;
}
</style>
</head>
<body>
	<header><%@ include file="../hfl/header.jsp"%></header>
	<div class="header" align="center">
		<h1>
			<a href="../index.jsp">중고 愛 민족</a>
		</h1>
		<br>
		<br>
	</div>
	<form action="<%=request.getContextPath()%>/login.me" method="post"
		id="loginForm">
		<div align="center">
			<div class="box_login">
				<div class="inp_text">
					<input type="text" id="loginId" name="loginId" placeholder="Id"
						style="height: 40px; width: 380px; box-sizing: border-box; padding: 0 30px;"><br>
					<br>
				</div>
				<div class="inp_text">
					<input type="password" id="loginPw" name="password"
						placeholder="Password"
						style="height: 40px; width: 380px; box-sizing: border-box; padding: 0 30px;"><br>
					<br>
				</div>
			</div>
			<button id="loginBtn" class="btn_login" onclick="login();"
				value="로그인">로그인</button>
		</div>
	</form>
	<div class="login_append" align="center">
		<span class="txt_find"> <a
			href="/sp/views/user/join/searchIdPage.jsp" class="link_find">아이디</a>
			/ <a href="/sp/views/user/join/searchPwdPage.jsp" class="link_find">비밀번호
				찾기</a> / <a href="/sp/views/user/join/join.jsp" class="link_join">회원가입</a>
		</span>

		<h4 class="tit">소셜 간편 가입</h4>
		<a id="kakao-login-btn"></a> <a
			href="http://developers.kakao.com/logout"></a>
		<script type='text/javascript'>
			
			Kakao.init('f96020a12441dbfb7b9174b8e19d971c');
			
			Kakao.Auth.createLoginButton({
				container : '#kakao-login-btn',
				success : function(authObj) {
					Kakao.API.request({
					url:'/v1/user/me',
				success:function(res){				
					var nickname = res.properties['nickname'];
					var id = res.id;
					var token = authObj.access_token;
					var array = id+","+nickname+"/"+token;					
					location.href="<%=request.getContextPath()%>/kakaojoin.me?array="+array;
				}
					});
				},
				fail : function(err) {
					alert(JSON.stringify(err));
				}
			});

			//]]>
		</script>
	</div>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
	<script>
		function login() {
			$("#loginForm").submit();

			$("#loginForm").submit(function(){
				if(msg != null){
					alert("떙~!");

				}
			});


		}


	</script>
</body>
</html>