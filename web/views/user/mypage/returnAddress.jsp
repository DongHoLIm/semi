<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>

.box_return1 {
	margin-top: 100px;
	margin-left: 3%;
	width:55%;
	border:2px solid #ffd8d9;
	margin:0 auto;
	border-radius: 5px;
}

.box_return2 {
	width:100%;
	margin-right: auto;
	margin-left: auto;
	margin-top: 20px;
}

.btn_return1{
	margin-left:10px;
	height:30px; 
	width:30%;
	border: 1px solid #ffd8d9;
	font-size: 15px;
	font-family:'Nanum Gothic', sans-serif;
	font-weight:550;
	border-radius: 5px;
	background-color: #ffd8d9;
	color: black;
	}
	
.btn_return2{
	margin:0 auto;
	height:35px; 
	width:30%;
	border: 1px solid #ffd8d9;
	font-size: 15px;
	font-family:'Nanum Gothic', sans-serif;
	font-weight:550;
	border-radius: 5px;
	background-color: #ffd8d9;
	color: black;
	}
	
.btn_return:hover {color:white;}
</style>
</head>
<header><%@ include file="../hfl/header.jsp" %></header>
<body>
	<br><br><br>
	<div class="box_return1">
		<h3>&nbsp;반품수거 정보입력</h3>
		<p>&nbsp;3영업일내에 방문 수거가 진행됩니다<br>
		&nbsp;수거지 정보를 정확하게 입력 후, 다음 단계를 진행해주세요.</p>
	<div class="box_return2" align="center">
		<table>
			<br><br><tr><td width=80px;><label>신청자명</label></td>
			<td><input type="text" id="userName" name="userName"><br><br></td></tr>
			<tr><td><label>연락처</label></td><td>
			<input type="tel" id="phone" name="phone"><br><br></td></tr>
			<tr><td><label>주소</label></td><td>
			<input type="text" id="address" name="address"><button type="button" class="btn_return1" style="width:80px;">우편번호</button><br><br>
			</td></tr>
		</table>
		<br><br>
		<input type="submit" value="수거정보 입력" class="btn_return2" onclick="finish();"><br><br>
		<input type="reset" value="나중에 입력" class="btn_return2">
		<br><br>
	</div>
	</div>
		<br><br><br>
		<footer><%@ include file="../hfl/footer.jsp" %></footer>
	<script>
		function()({
			
		});
	
	</script>
		
		
</body>
</html>