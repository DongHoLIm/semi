<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
#sec1 {
	width: 100%;
	height: 100%;
	padding-right: 20%;
	padding-left: 20%;
	margin: auto;
	align:center;
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
.gumehaukjung{
align:center;
}
#numberBox{
	margin-left: 40%;
}
</style>
</head>
<header><%@ include file="../hfl/managerHeader.jsp" %></header>
<body>
<form>
	<section id="sec1">
			<br />
		
		
			<h3 align="center">구매내역 조회</h3>
			<table class="board">
					<tr class="row0">
						<th>번호</th>
						<th>판매자 아이디</th>
						<th>판매 상품</th>
						<th>구매자 아이디</th>
						<th>주문날짜</th>
						<th>확정날짜</th>
						<th>진행 상태</th>
						<th>선택</th>
					</tr>
				<tbody>
					<tr>
						
					</tr>
				</tbody>
			</table>
				<div id="numberBox"><%@ include file="../hfl/pagination.jsp" %></div>
		<div id="area">
			<h3 align="center">배송상태</h3>
			<table id="deliTable">
				<tr>
				   <td class="deliReady"><img src="/sp/images/gumsu.png" alt="" />
						<br />
						<p>
							검수중(<%
							int gumsu = 0;
						%><%=gumsu%>)
						</p></td>
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
			
			<h3 align="center">상품 조회</h3>
			<table class="board">
				<tr class="row0">
				<thead>
					<th>번호</th>
					<th>판매자 아이디</th>
					<th>판매 상품</th>
					<th>구매자 아이디</th>
					<th>검수 유무</th><!-- 체크박스로 넣으면 되삼. -->
					<th>주문날짜</th>
					<th>진행 상태</th>
				</thead>
				</tr>
				
			</table>
		</div>
		
				<div id="numberBox"><%@ include file="../hfl/pagination.jsp" %></div>
	</section>
		
</form>

	<br>
	<footer><%@ include file="../hfl/footer.jsp" %></footer>

</body>
</html>