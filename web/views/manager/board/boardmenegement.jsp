<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#select-area{
	width:80%;
	border:2px solid #ffd8d9;
	margin:0 auto;
	border-radius: 5px;
}
#select{
width:100%;
border-radius:1px;
}
table{
width:80%;
border:1px solid black;
}
</style>
</head>
<header><%@ include file="../hfl/managerHeader.jsp" %></header>
<body>
<br><br><br>
<div align="center" id="select-area">
<h1>게시물 관리</h1>
<form>
	<div id="select">
		<select name="select" style="width:10%">
			<option value="notebook">노트북</option>
			<option value="">가전제품</option>
			<option value=""></option>
		</select>
	<span>
		<select name="select" style="width:20%;">
			<option value="findId">아이디로 조회</option>
			<option value="findName">이름으로 조회</option>
			<option value="findLevel">등급으로 조회</option>
		</select>
		<input type="search" name="searchValue">
		<button type="submit">조회</button>
	</span>
	</div>
	<br><br>
</form>
	<table align="center">
	<tr>
		<th>No.</th>
		<th>ID</th>
		<th>게시글 제목</th>
		<th>판매여부</th>
		<th>분류</th>
		<th>수정</th>
	</tr>
	</table><br><br>
</div>
</body>
</html>