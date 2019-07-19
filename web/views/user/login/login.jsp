<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btn_login{ height: 40px; width:380px;} 
a{text-decoration:none; color:black; font-weight:bold;}
</style>
</head>
    <header><%@ include file="../hfl/header.jsp" %></header>
<body>
	<div class = "header" align="center">
		<h1><a href="../index.jsp">중고 愛 민족</a></h1><br><br>
	</div>
	<form action="<%= request.getContextPath() %>/login.me" method="post" id="loginForm">
		<div align="center">
			<div class="box_login">
				<div class="inp_text">
					<input type="text" id="loginId" name="loginId" placeholder="Id" style="height:40px; width:380px; box-sizing: border-box; padding: 0 30px;"><br><br>
				</div>
				<div class="inp_text">
					<input type="password" id="loginPw" name="password" placeholder="Password" style="height:40px; width:380px; box-sizing: border-box; padding: 0 30px;"><br><br>
				</div>
			</div>
			<button id="loginBtn" class="btn_login" onclick="login();" value="로그인">로그인</button>
			</div>
	</form>
			<div class="login_append" align="center">
				<span class="txt_find">
					<a href="/sp/views/user/join/searchIdPage.jsp" class="link_find">아이디</a>
					/
					<a href="/sp/views/user/join/searchPwdPage.jsp" class="link_find">비밀번호 찾기</a>
					/
					<a href="/sp/views/user/join/join.jsp" class="link_join">회원가입</a>
					</span>
					
					       <h4 class="tit">소셜 간편 구입</h4>
            <ul class="login_sns_list">
                <li>
                	<!-- 카카오api연결 -->
                   <a href="#" onclick="oAuthLogin('kakao', null)"><img src="../images/kakaoicon.PNG" id="kakao"></a>
                </li>
            </ul>
					
			</div>
	<script>
	function login(){
		$("#loginForm").submit();
	}
	</script>
	<footer><%@ include file="../hfl/footer.jsp" %></footer>
	
</body>
</html>