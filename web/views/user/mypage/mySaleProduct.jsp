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
</style>
</head>
<body>
	<!-- header 영역 -->
	<header><%@ include file="../hfl/header.jsp" %></header>
	<header><%@ include file="../hfl/myPageList.jsp"%></header>
	<section id="sec1">
		<div id="outer">
			<div>
				<h2>나의 판매상품 현황</h2>
				<table class="board">
				<tr class="row0">
				<thead>
					<th>번호</th>
					<th>상품명</th>
					<th>판매/정산여부</th>
					<th>작성날짜</th>
				</thead>
				</tr>
				<tr class="row1">
					<td id="Notd">0005</td>
					<td>진수의 핑크핑크한 노트북쿨러</td>
					<td>검수단계</td>
					<td>19/07/26</td>
				</tr>
				<tr class="row2">
					<td id="Notd">0004</td>
					<td>영지의 오른쪽 에어팟</td>
					<td>판매중</td>
					<td>19/07/19</td>
				</tr>
				<tr class="row3">
					<td id="Notd">0003</td>
					<td>찬민이의 C타입 케이블</td>
					<td>판매완료</td>
					<td>19/07/17</td>
				</tr>
				<tr class="row4">
					<td id="Notd">0002</td>
					<td>동호의 왼쪽 에어팟</td>
					<td>판매완료</td>
					<td>19/07/16</td>
				</tr>
				<tr class="row5">
					<td id="Notd">0001</td>
					<td>강사님의 모니터 케이블</td>
					<td>정산완료</td>
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
			</div>
			
			
			
			
		</div>
	</section>
		
	<!-- footer 영역 -->
	<footer><%@ include file="../hfl/footer.jsp" %></footer>
</body>
</html>























