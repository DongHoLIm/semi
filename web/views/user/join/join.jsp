<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<header><%@ include file="../hfl/header.jsp"%></header>
<body>
	<form action="02_memberJoinResult.jsp" method="post">
		<div class="header" align="center">
			<h1>중고愛 민족</h1>
		</div>



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
				<div class="inp_text">
					<input type="password" id="loginPw" name="password"
						placeholder="Password 확인"
						style="height: 40px; width: 380px; box-sizing: border-box; padding: 0 30px;"><br>
					<br>
				</div>
				<div class="inp_text">
					<input type="text" id="userName" name="userName" placeholder="이름"
						style="height: 40px; width: 380px; box-sizing: border-box; padding: 0 30px;"><br>
					<br>
				</div>
				<div class="inp_text">
					<input type="text" id="age" name="age" placeholder="나이"
						style="height: 40px; width: 380px; box-sizing: border-box; padding: 0 30px;"><br>
					<br>
				</div>
				<div class="inp_text">
					<input type="email" id="email" name="email" placeholder="이메일"
						style="height: 40px; width: 380px; box-sizing: border-box; padding: 0 30px;"><br>
					<br>
				</div>
				<div class="inp_text">
					<input type="tel" id="phone" name="phone" placeholder="phone"
						style="height: 40px; width: 380px; box-sizing: border-box; padding: 0 30px;"><br>
					<br>
				</div>
				<div class="inp_text">
					<input type="text" id="address" name="address" placeholder="주소"
						style="height: 40px; width: 380px; box-sizing: border-box; padding: 0 30px;"><br>
					<br>
				</div>
				<div class="inp_text">
					<select
						style="height: 40px; width: 380px; box-sizing: border-box; padding: 0 30px;"><br>
						<option id="female" value="여자">여자
						<option id="male" value="남자">남자</select>
				</div>
			</div>
			<br> <input type="submit" value="가입"
				style="height: 40px; width: 380px; box-sizing: border-box; padding: 0 30px;"><br>
			<br> <input type="reset" value="취소"
				style="height: 40px; width: 380px; box-sizing: border-box; padding: 0 30px;">
		</div>
	</form>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>

</body>
</html>