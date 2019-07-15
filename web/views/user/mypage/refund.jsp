<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.refund {
	text-align: center;
}

#subScreen {
	margin-top: 5%;
	margin-bottom: 3%;
	width: 67%;
	margin-left: 16.6%;
	height: 100%;
	text-align: left;
}

table {
	width: 100%;
	height: 100%;
	border: 1px solid pink;
	text-align: center;
}

#menubar {
	width: 15.6%;
	height: 100%;
	border: 3px solid #ffd8d9;
	text-align: center;
	padding: 1%;
	float: left;
}

#menuUl {
	margin-right: 20%;
	padding-left: 0px;
	margin: 0px auto;
}

#menubar ul li {
	list-style-type: none;
}

.date-select {
	background: pink;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body>
	<header><%@ include file="../hfl/header.jsp"%></header>
	<br>
	<header><%@ include file="../hfl/myPageList.jsp"%></header>
	<div id="subScreen">
		<h3 style="font-weight: bold">환불 내역</h3>

		<div class="date-select" align="center">
			<br> <span style="font-weight: bold">기간별조회</span> <span>&nbsp;&nbsp;&nbsp;<input
				type="button" value="1주일">&nbsp;
			</span> &nbsp;<input type="button" value="15일">&nbsp; &nbsp;<input
				type="button" value="1개월">&nbsp; <input type="date">
			- <input type="date"><br> <br>
		</div>
		<br>
		<div align=center>
			<table border="1">
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
	<h3 style="font-weight: bold">정산내역</h3>

	<div class="date-select" align="center">
		<br> <span style="font-weight: bold">기간별조회</span> <span>&nbsp;&nbsp;&nbsp;<input
			type="button" value="1주일">&nbsp;
		</span> &nbsp;<input type="button" value="15일">&nbsp; &nbsp;<input
			type="button" value="1개월">&nbsp; <input type="date">
		- <input type="date"><br> <br>
	</div>
	<br>
	<div align=center>
		<table border="1">
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
	</div>
	<br>


	<br>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>

</body>
</html>