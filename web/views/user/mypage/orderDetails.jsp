<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<style>
button{
	border:1px solid black;
	background:#FFF;
}

table {
	text-align:center;
	width: 50%;
}
.t1 {
	margin-left:30%;
}

table, td {
	border: 1px solid #bcbcbc;
	margin:0 auto;
}

.th3 {
	border:1px solid #bcbcbc;
	text-align: center;
}
.th4{
	text-align: center;
	width:20%;
}
</style>
</head>

<body>
	<%@ include file="../hfl/header.jsp"%>
	<%@ include file="../hfl/myPageList.jsp"%>
	<table class="t1">
		<caption>결제 정보</caption>
		<tbody>
			<tr>
				<th class="th3">주문금액</th>
				<td>30,500원</td>
				<td>상품금액 28,000원 + 배송비 2,500원</td>
			</tr>
			<tr>
				<th class="th3">총 결제금액</th>
				<td>30,500원</td>
				<td>신용카드 30,500원</td>
			</tr>
		</tbody>
	</table>

	<br>
	<br>
	<br>

	<table class="t1">
		<caption>주문 상품 정보</caption>
		<thead>
			<tr>
				<th></th>
				<th class="th3">상품정보</th>
				<th class="th3">수량</th>
				<th class="th3">상품금액</th>
				<th class="th3">주문상태</th>
				<th class="th3">운송장번호</th>
				<th class="th3">환불신청</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th class="th3">1</th>
				<td>진수의 핑크핑크한 쿨러</td>
				<td>1</td>
				<td>28,000원</td>
				<td><button id="btn_confirm">구매확정</button></td>
				<td>123456789&nbsp;<button onclick="window.open('deliveryAPI.jsp','window_name','width=800,height=500,location=yes,status=no,scrollbars=yes');">배송조회</button></td>
				<td><button onclick="window.open('refundPopUp.jsp','window_name','width=600,height=400,location=yes,status=no,scrollbars=yes');" class="returnPopUp">환불신청</button></td>
			</tr>
			<tr>
				<th class="th3">2</th>
				<td>진수의 핑크핑크한 노트북</td>
				<td>1</td>
				<td>390,000원</td>
				<td><button>구매확정</button></td>
				<td>123456789&nbsp;<button>배송조회</button></td>
				<td><button>환불신청</button></td>
			</tr>
			<tr>
				<th class="th3">3</th>
				<td>진수의 핑크핑크한 안경</td>
				<td>1</td>
				<td>60,000원</td>
				<td><button>구매확정</button></td>
				<td>123456789&nbsp;<button>배송조회</button></td>
				<td><button>환불신청</button></td>
			</tr>
		</tbody>
	</table>
	<br>
	<br>
	<br>

	<table class="t1">
		<caption>배송지 정보</caption>
		<tbody>
			<tr>
				<th class="th4">받는 사람</th>
				<td rowspan="5">김진수<br>
				서울 어쩌구<br>
				010-0000-0000<br></td>
			</tr>
		</tbody>
	</table>
	<%@ include file="../hfl/footer.jsp"%>
	<script>

	$(function(){
  	$('#btn_confirm').click(function(){
   		 if($(this).html() == '구매확정' ) {
   	   		$(this).html('구매확정 완료');
   		 }
  	})
});
  	
</script>
	
	
</body>
</html>