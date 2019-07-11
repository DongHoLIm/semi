<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	text-align:center;
	width: 50%;
}

table, th, td {
	border: 1px solid #bcbcbc;
	margin:0 auto;
}

th {
	text-align:left;
}
.th3 {
	width:20%;
}

</style>
</head>
<header><%@ include file="../hfl/header.jsp"%></header>
<body>
	<br>
	<br>
	<br>
	<br>
	<table>
		<caption>결제 정보</caption>
		<tbody>
			<tr>
				<th>주문금액</th>
				<td>30,500원</td>
				<td>상품금액 28,000원 + 배송비 2,500원</td>
			</tr>
			<tr>
				<th>총 결제금액</th>
				<td>30,500원</td>
				<td>신용카드 30,500원</td>
			</tr>
		</tbody>
	</table>

	<br>
	<br>
	<br>

	<table>
		<caption>주문 상품 정보</caption>
		<thead>
			<tr>
				<th></th>
				<th>상품정보</th>
				<th>수량</th>
				<th>상품금액</th>
				<th>배송비</th>
				<th>주문/배송상태</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>1</th>
				<td>진수의 핑크핑크한 쿨러</td>
				<td>1</td>
				<td>28,000원</td>
				<td>2,500원</td>
				<td><button>구매확정</button></td>
			</tr>
			<tr>
				<th>2</th>
				<td>진수의 핑크핑크한 노트북</td>
				<td>1</td>
				<td>390,000원</td>
				<td>2,500원</td>
				<td><button>구매확정</button></td>
			</tr>
			<tr>
				<th>3</th>
				<td>진수의 핑크핑크한 안경</td>
				<td>1</td>
				<td>60,000원</td>
				<td>2,500원</td>
				<td><button>구매확정</button></td>
			</tr>
		</tbody>
	</table>
	<br>
	<br>
	<br>

	<table>
		<caption>배송지 정보</caption>
		<tbody>
			<tr>
				<th class="th3">받는 사람</th>
				<td rowspan="5">김진수<br>
				서울 어쩌구<br>
				010-0000-0000<br></td>
			</tr>
		</tbody>
	</table>
	<br>
	<br>
	<br>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
</body>
</html>