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
	width: 80%;
	height:70%
	padding: 2%;
	margin: 0 auto;
	text-align: center;
	background-color:lightgrey;
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

.board2 {
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
			<h3 style="font-weight: bold">환불 내역</h3>

		<div class="date-select" align="center">
			<br> <span style="font-weight: bold">기간별조회</span> <span>&nbsp;&nbsp;&nbsp;<input
				type="button" value="1주일">&nbsp;
			</span> &nbsp;<input type="button" value="15일">&nbsp; &nbsp;<input
				type="button" value="1개월">&nbsp; <input type="date">
			- <input type="date"><br> <br>
		</div>
		</div>
	<br>
		<div align=center>
			<table border="1" class = "board">
				<tr>
					<th class="refund">주문정보</th>
					<th class="refund">주문 상품 정보</th>
					<th class="refund">환불정보</th>
					<th class="refund">환불금액</th>
					<th class="refund">입금일</th>
					<th class="refund">상태</th>
				</tr>
				<tr>
				<td>안</td>
				<td>녕</td>
				<td>하</td>
				<td>신</td>
				<td>가</td>
				<td>요</td>
			</tr>
			<tr>
				<td>안</td>
				<td>녕</td>
				<td>하</td>
				<td>신</td>
				<td>가</td>
				<td>요</td>
			</tr>
			<tr>
				<td>안</td>
				<td>녕</td>
				<td>하</td>
				<td>신</td>
				<td>가</td>
				<td>요</td>
			</tr>
			</table>
		</div>
		<br>
		<div id="area">
			<h3 style="font-weight: bold">정산 내역</h3>

		<div class="date-select" align="center">
		<br> <span style="font-weight: bold">기간별조회</span> <span>&nbsp;&nbsp;&nbsp;<input
			type="button" value="1주일">&nbsp;
		</span> &nbsp;<input type="button" value="15일">&nbsp; &nbsp;<input
			type="button" value="1개월">&nbsp; <input type="date">
		- <input type="date"><br> <br>
	</div>
		</div>
		
		<div align=center>
				<table border="1" class = "board2"> 
			<tr>
				<th class="refund">정산완료일</th>
				<th class="refund">정산금액</th>
				<th class="refund">입금은행</th>
				<th class="refund">계좌번호</th>
				<th class="refund">예금주</th>
			</tr>
			<tr>
				<td>안</td>
				<td>녕</td>
				<td>하</td>
				<td>신</td>
				<td>가</td>
			</tr>
			<tr>
				<td>안</td>
				<td>녕</td>
				<td>하</td>
				<td>신</td>
				<td>가</td>
			</tr>
			<tr>
				<td>안</td>
				<td>녕</td>
				<td>하</td>
				<td>신</td>
				<td>가</td>
			</tr>
		</table>
		</div>
	</section>

	<br>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
</body>
</html>