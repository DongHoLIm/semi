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
	margin: auto;
}

#area {
	width: 100%;
	padding: 2%;
	margin: 0 auto;
	text-align: center;
}

#deliTable {
	align: center;
}

#deliTable tr {
	align: center;
}

#deliTable tr td {
	align: center;
}

#deliTable tr td img {
	width: 30%;
	align: center;
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
</style>
</head>
<body>
	<header><%@ include file="../hfl/header.jsp"%></header>
	<br>
	<header><%@ include file="../hfl/myPageList.jsp"%></header>

	<section id="sec1">
		<div id="area">
			<h3 align="center">배송상태</h3>
			<table id="deliTable">
				<tr>
					<td class="deliReady"><img src="/sp/images/box.png" alt="" />
						<br />
						<p>
							배송 준비중(<%
							int ready = 0;
						%><%=ready%>)
						</p></td>
					<td class="deliStart"><img src="/sp/images/delivery-truck.png"
						alt="" /> <br />
						<p>
							배송 시작(<%
							int start = 0;
						%><%=start%>)
						</p></td>
					<td class="deliSuccess"><img src="/sp/images/order.png" alt="" />
						<br />
						<p>
							배송 완료(<%
							int success = 0;
						%><%=success%>)
						</p></td>
				</tr>
			</table>
		</div>

		<div>
			<br />
			
			<h3 align="center">주문 현황</h3>
			<table class="board">
				<tr class="row0">
				<thead>
					<th>번호</th>
					<th>상품명</th>
					<th>배송여부</th>
					<th>작성날짜</th>
				</thead>
				</tr>
				<tr class="row1">
					<td id="Notd">0005</td>
					<td>진수의 핑크핑크한 노트북쿨러</td>
					<td>배송준비중</td>
					<td>19/07/26</td>
				</tr>
				<tr class="row2">
					<td id="Notd">0004</td>
					<td>영지의 오른쪽 에어팟</td>
					<td>배송준비중</td>
					<td>19/07/19</td>
				</tr>
				<tr class="row3">
					<td id="Notd">0003</td>
					<td>찬민이의 C타입 케이블</td>
					<td>배송중</td>
					<td>19/07/17</td>
				</tr>
				<tr class="row4">
					<td id="Notd">0002</td>
					<td>동호의 왼쪽 에어팟</td>
					<td>배송완료</td>
					<td>19/07/16</td>
				</tr>
				<tr class="row5">
					<td id="Notd">0001</td>
					<td>강사님의 모니터 케이블</td>
					<td>배송완료</td>
					<td>19/07/13</td>
				</tr>
			</table>
		</div>
		<footer align="center">	
			<ul class="pagination" align="center">
			  <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
			  <li class="page-item"><a class="page-link" href="#">1</a></li>
			  <li class="page-item"><a class="page-link" href="#">2</a></li>
			  <li class="page-item"><a class="page-link" href="#">3</a></li>
			  <li class="page-item"><a class="page-link" href="#">다음</a></li>
			</ul>
		</footer>

	</section>

	<br>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
</body>
</html>