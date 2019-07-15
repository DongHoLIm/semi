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
width:90%;
border:1px solid black;
}
table > th{
align:center;
}
#set-status{
text-align:left;
width:90%;
}
</style>
</head>
<header><%@ include file="../hfl/managerHeader.jsp" %></header>
<body>
<br><br><br>
<div align="center" id="select-area">
<h1>블랙리스트 관리</h1>
<form>
	<div id="select">
		<select name="select" style="width:30%;">
			<option value="findId">아이디로 조회</option>
			<option value="findName">이름으로 조회</option>
			<option value="findLevel">등급으로 조회</option>
		</select>
		<input type="search" name="searchValue">
		<button type="submit" style="border-radius: 5px; background-color: #ffd8d9;">조회</button>
	</div>
	<br>
</form>
	<table align="center">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>등급</th>
		<th>주민등록번호</th>
		<th>방문수</th>
		<th>게시글 수</th>
		<th>최종방문일</th>
		<th>주소</th>
		<th>가입일</th>
		<th>판매횟수</th>
		<th>블랙리스트 사유</th><!-- 해당 게시물로 연결 -->
	</tr>
	</table><br><br>
				<%@ include file="../hfl/pagination.jsp" %>
</div>
</body>
</html>