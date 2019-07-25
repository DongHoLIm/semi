<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type=button]{
	border:1px solid black;
	background:#FFF;
}

.th_cancel {
	text-align:center;
}
tr {
	text-align:center;
}

#sec1 {
	width: 100%;
	height: 100%;
	padding-right: 20%;
	padding-left: 20%;
	margin: auto;
}

#area {

	border:1px solid black;
	background:#FFF;
	width: 80%;
	height:70%;'
	padding: 2%;
	margin: 0 auto;
	text-align: center;
}

#deliTable {
	align: center;
}

#deliTable tr {
	text-align:center;
}

#deliTable tr td {
	text-align:center;
}

#deliTable tr td img {
	width: 30%;
	text-align:center;
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

.page-control {
	margin-top:10%;
}
</style>
</head>
<body>
	<header><%@ include file="../hfl/header.jsp"%></header>
	<br>
	<header><%@ include file="../hfl/myPageList.jsp"%></header>

	<section id="sec1">
		<div id="area">
			<h3 style="font-weight: bold">주문취소 조회</h3>

			<div class="date-select" align="center">
				<br> <span style="font-weight: bold">기간별조회</span> <span>&nbsp;&nbsp;&nbsp;
				<input type="button" value="1주일">&nbsp;
				</span> &nbsp;<input type="button" value="15일">&nbsp; &nbsp;<input
					type="button" value="1개월">&nbsp; <input type="date">
				- <input type="date"><br> <br>
			</div>
		</div>

		<div>
			<br />

			<table border="1" class = "board">
          <tr>
					<th class="th_cancel">주문일자</th>
					<th class="th_cancel">상품정보</th>
					<th class="th_cancel">주문상태</th>
				</tr>
				<tr>
					<td>주문일자<br>주문번호<br><input type="button" onclick="<%=request.getContextPath()%>/orderDetails.jsp'" value="주문상세"></td>
					<td>상품명</td>
					<td><%= %><input type="text" value="주문상태" id="ip_status"readonly></td>
				</tr>
 
         </table>
		</div>
		<div class="page-control">
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
	</section>

	<br>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
</body>
</html>