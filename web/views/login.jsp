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
<body>
	<div class = "header" align="center">
		<h1><a href="/web/index.html">중고 愛 민족</a></h1><br><br>
	</div>
	<form action="" method="post" action="loginResult.jsp">
		<div align="center">
			<div class="box_login">
				<div class="inp_text">
					<input type="text" id="loginId" name="loginId" placeholder="Id" style="height:40px; width:380px; box-sizing: border-box; padding: 0 30px;"><br><br>
				</div>			
				<div class="inp_text">
					<input type="password" id="loginPw" name="password" placeholder="Password" style="height:40px; width:380px; box-sizing: border-box; padding: 0 30px;"><br><br>
				</div>
			</div>
			<input type="submit" class="btn_login" value="로그인">
			<div class="login_append">
				<div class="inp_chk">
					<input type="checkbox" id="keepLogin" class="inp_radio" name="KeepLogin">
					<label for="keepLogin" class="lab_g">
						<span class="img_top ico_check"></span>	
						<span class="txt_lab">로그인 상태 유지</span><br><br>
					</label>
				</div>
				<span class="txt_find">
					<a href="" class="link_find">아이디</a>
					/
					<a href="" class="link_find">비밀번호 찾기</a>
					/
					<a href="" class="link_join">회원가입</a>
					</span>
			</div>
		</div>
	</form>
</body>
</html>