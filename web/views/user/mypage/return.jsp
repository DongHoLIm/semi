<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap"
	rel="stylesheet">
<style>
.btn_return {
	margin-right: auto;
	margin-left: auto;
	margin-top: 50px;
	width : 75px;
	height: 25px;
	border: 1px solid #ffd8d9;
	font-size: 14px;
	font-family: 'Sunflower', sans-serif;
	border-radius: 5px;
	background-color: #ffd8d9;
	color: black;
	width: 75px;
}

.r1 {
	width: 50%;
	margin-right: auto;
	margin-left: auto;
	margin-top: 50px;
}

.r2 {
	width: 75%;
	text-align: right;
	margin-top: 50px;
}

.return1 {
	margin-right: auto;
	margin-left: auto;
	margin-top: 100px;
}

button {
	width: 75px;
	height: 25px;
	border: 1px solid #ffd8d9;
	font-size: 12px;
	font-family: 'Sunflower', sans-serif;
	border-radius: 5px;
	background-color: #ffd8d9;
	color: black;
}

table {
	text-align: center;
	width: 50%;
}

table, td {
	border: 1px solid #bcbcbc;
	margin: 0 auto;
}

.th3 {
	border: 1px solid #bcbcbc;
	text-align: center;
}

.th4 {
	text-align: center;
	width: 20%;
}
</style>
</head>
<header><%@ include file="../hfl/header.jsp"%></header>
<body>

	<header><%@ include file="../hfl/myPageList.jsp"%></header>
	<br>
	<br>
	<br>
	<br>
	<div class="big_return">
		<div class="r1">
			<h3>반품/환불 신청</h3>
			<br>
			<p>
				반품/환불 신청은 배송완료 후 7일 이내에만 가능합니다.<br> 단순변심 반품은 불가능하며 상품 파손의 경우에만
				반품이 가능합니다.<br> 단, 택배비 관련 문의는 고객센터에 직접 연락해주시길 바랍니다.
			</p>
		</div>
		<div class="r2">
			안내 사항을 모두 확인하였으며, 이에 동의합니다.&nbsp;<input type="checkbox" name="return_check"
				class="return_check">
		</div>
	</div>
	<table class="return1">
		<caption>환불 상품 정보</caption>
		<thead>
			<tr>
				<th></th>
				<th class="th3">주문번호</th>
				<th class="th3">수량</th>
				<th class="th3">상품금액</th>
				<th class="th3">배송비</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th class="th3">1</th>
				<td>진수의 핑크핑크한 쿨러</td>
				<td>1</td>
				<td>28,000원</td>
				<td>2,500원</td>
			</tr>
		</tbody>
	</table>

	<div class="btn_return">
		<button
			onclick="location.href = '/sp/views/user/mypage/returnAddress.jsp'">
			신청</button>
	</div>
	<br>
	<br>
	<br>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
</body>
</html>