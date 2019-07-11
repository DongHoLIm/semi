<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <header><%@ include file="../hfl/header.jsp" %></header>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap"
	rel="stylesheet">
<title>이용약관</title>
<style>
	.t1 {
		width:70%;
	}
	
	.t2 {
		width:55%;
	}

	.btn_terms {
	margin:0 auto;
	width: 80px;
	height: 30px;
	border: 1px solid pink;
	font-size: 13px;
	font-family: 'Sunflower', sans-serif;
	border-radius: 5px;
	background-color: pink;
	color: black;
	}
	.btn_terms:hover {color:white;}
	
</style>
</head>
<body> 
		<table class="t1" align=center>
		<tr><td>
			<h2>회원가입</h2>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중고愛민족은 이용약관과 개인정보 수집 및 이용에 동의를 하셔야 회원가입이 가능합니다.</p>
		</td></tr>
			<br>
			<table class="t2" align=center>
				<tr><td>
				<div><font color="pink" size=4>01</font> <font size=3>이용약관</font></div>
				</td></tr>
				
				<tr><td align=center>
					<textarea name="tos" rows=15 cols=100>약관 1111</textarea>
				</td></tr>
				
				<tr><td><input type="checkbox">이용약관에 동의합니다.<br><br><br><br></td></tr>
					
				<tr><td>
	            <div><font color="pink" size=4>02</font> <font size=3>개인정보 수집 및 이용에 대한 안내</font></div>
	            </td></tr>
	            			
			    <tr><td align=center>
				<textarea name="tos" rows=15 cols=100>약관222</textarea>
				</td></tr>
            	
            	<tr><td><input type="checkbox">개인정보 수집 및 이용에 대한 안내에 동의합니다.</td></tr>
          </table>
		</table>
<br><br>
<div align="center">
  <a href="#"> <button type="button" class="btn_terms">회 원 가 입</button></a>
  <a href="#"> <button type="button" class="btn_terms">취 소 하 기</button></a>
</div>
<br><br>
<br><br>

	<footer><%@ include file="../hfl/footer.jsp" %></footer>

</body>
</html>