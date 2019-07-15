<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 이새끼 th가운데정렬해야하삼 -->
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
text-align:center;
}
.td{
text-align:center;
}
.selectAll{
align:right;
}
</style>
</head>
<header><%@ include file="../hfl/managerHeader.jsp" %></header>
<body>
<br><br><br>
<div align="center" id="select-area">
<h1>파워상품 관리</h1>
<form>
	<div id="select">
		<select name="category" style="width:10%;">
			<option value="findPC">PC</option>
			<option value="findNotebook">노트북</option>
			<option value="findetc">가전제품</option>
		</select>
		<select name="term" style="width:10%;">
			<option value="aweek">일주일</option>
			<option value="2week">이주일</option>
			<option value="3week">삼주일</option>
			<option value="amonth">한달</option>
		</select>
		<input type="search" name="searchValue">
		<button type="submit" style="border-radius: 5px; background-color: #ffd8d9;">조회</button>
		
		전체선택<input type="checkbox" class="selectAll" value="selectAll">
	</div>
	<br>
</form>
	<table border="1">
	<tr>
		<th class="th">No.</th>
		<th class="th">아이디</th>
		<th class="th">게시글제목</th>
		<th class="th">요청일수</th>
		<th class="th">분류</th>
		<th class="th">파워등록여부</th><!-- 체크박스로 주면 되삼 -->
	</tr>
	
	</table><br><br>
	<%@ include file="../hfl/pagination.jsp" %>
</div>
</body>
</html>