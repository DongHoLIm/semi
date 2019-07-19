<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#depotMain {
	width: 95%;
	height: 80%;
	border :2px solid black;
}

tr {
	border: 1px solid black;
}

#th {
	border: 1px solid white;
	background: black;
	color: white;
	text-align: center;
}

#inOutButton {
	padding-left:8%;
}
#inOutMain {
	border :2px solid black;
	width:80%;
	margin:0 auto;
}
#table Area{
align:center;
width:90%;
}
.th{
background:black;
color:white;
text-align:center;
border:1px solid white;
}
</style>
<body>
	<%@ include file="../hfl/managerHeader.jsp"%>
	<br />
	<h2 align="center">파워상품 관리</h2>
	<div id="inOutMain"><br><br>
		<div id="inOutButton" align="center">
			
		<select name="category" style="width:10%;">
			<option value="findPC">PC</option>
			<option value="findNotebook">노트북</option>
			<option value="findetc">가전제품</option>
		</select>
		<span>
		<select name="select" style="width:20%;">
			<option value="findId">아이디로 조회</option>
			<option value="findName">이름으로 조회</option>
			<option value="findLevel">등급으로 조회</option>
		</select>
		<input type="search" name="searchValue">
		<button type="submit" style="border-radius: 5px; background-color: black; color:white;">조회</button>
		전체선택
		<input type="checkbox">
	</span></div><br><br>
		<div id="table Area">
			<table id="depotMain" align="center">
				<tr>
		<th class="th">No.</th>
		<th class="th">아이디</th>
		<th class="th">게시글제목</th>
		<th class="th">요청일수</th>
		<th class="th">분류</th>
		<th class="th">파워등록여부</th>
	</tr>
			</table><br><br>
		</div>
	</div>


</body>
</html>