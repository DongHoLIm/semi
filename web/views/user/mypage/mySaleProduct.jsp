<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#sec1 {
	width: 100%;
	height: 100%;
	padding-right: 20%;
	padding-left: 20%;
	margin:0 auto;
}

#outer{
	width: 100%;
	padding: 2%;
	margin: 0 auto;
	text-align: center;
}


.board {
	width: 80%;
	margin: auto;
	align: center;
	border-spacing: 10px;
}

.row0 {
	background: #eee;
	margin: auto;
}

.row1 {
	border-top: 2px solid #555;
}

.row2, .row3, .row4, .row, .row6, .row7, .row8, .row9, .row10 {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.pageNo {
	margin: auto;
}

.th1 {
	text-align:center;
}
</style>
</head>
<body>
	<!-- header 영역 -->
	<header><%@ include file="../hfl/header.jsp" %></header>
	<header><%@ include file="../hfl/myPageList.jsp"%></header>
	<section id="sec1">
		<div id="outer">
			<div>
				<h2>판매상품 현황</h2>
				<table class="board">
				<tr class="row0">
				<thead>
					<th class="th1">주문번호</th>
					<th class="th1">상품명</th>
					<th class="th1">판매여부</th>
					<th class="th1">정산여부</th>
					<th class="th1">보관일자</th>
				</thead>
				</tr>
				<tr class="row1">
					<td id="Notd">0005</td>
					<td>진수의 핑크핑크한 노트북쿨러</td>
					<td>검수단계</td>
					<td>19/07/26</td>
					<td></td>
				</tr>
			</table>
		</div>
			</div>
			
		
	</section>
		
	<footer><%@ include file="../hfl/footer.jsp" %></footer>
</body>
</html>























