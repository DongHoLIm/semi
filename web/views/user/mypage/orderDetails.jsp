<%@page import="com.kh.bvengers.user.myPage.model.vo.myPage"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<myPage> odList = (ArrayList<myPage>) request.getAttribute("odList");
	String status = "";
%>

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


.t1 {
	margin-left:30%;
	border: 1px solid #bcbcbc;
	text-align:center;
	width: 50%;
}

td {
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
	border:1px solid #bcbcbc;
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
			<% for(myPage m : odList){ 
				/* int num = m.getDtPay()+2500;
				System.out.print(num); */%>
				<th class="th3">주문금액</th>
				<td><%=m.getDtPay()%>원</td>
				<td>상품금액 <%=m.getDtPay()%> + 배송비 2,500원</td>
			</tr>
			<tr>
				<th class="th3">총 결제금액</th>
				<td><%=m.getDtPay()%>원</td>
				<td>신용카드 <%=m.getDtPay()%>원</td>
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
				<th class="th3">주문번호</th>
				<th class="th3">상품명</th>
				<th class="th3">상품금액</th>
				<th class="th3">주문상태</th>
				<th class="th3">운송장번호</th>
				<th class="th3">환불신청</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th class="th3"><%=m.getOno()%></th>
				<td><%=m.getPname()%></td>
				<td><%=m.getDtPay()%>원</td>
				<% if(m.getRefundStatus() != "" && m.getRefundStatus() != "1" && m.getRefundStatus() != "2"){
				   	status = m.getRefundStatus();
					if(m.getDstatus() != "" && m.getDstatus() != "1" && m.getDstatus() != "2" && m.getDstatus() != "3"){
				 	status = m.getDstatus();
					if(m.getPayStatus() != "" && m.getPayStatus() != "1" && m.getPayStatus() != "2"){
				   	status = m.getPayStatus();
					}}}%>
				<td><%=status %></td>
				<td><%=m.getInNo()%>&nbsp;<button onclick="window.open('deliveryAPI.jsp','window_name','width=800,height=500,location=yes,status=no,scrollbars=yes');">배송조회</button></td>
				<td><button onclick="window.open('refundPopUp.jsp','window_name','width=600,height=400,location=yes,status=no,scrollbars=yes');" class="returnPopUp">환불신청</button></td>
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
				<td rowspan="5"><%=m.getrName() %><br>
				<%=m.getdSite() %><br>
				<%=m.getrPhone() %><br></td>
			</tr>
			<% } %>
		</tbody>
	</table>
	<br>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
	
	<script>

	/* $(function(){
  	$('#btn_confirm').click(function(){
   		 if($(this).html() == '구매확정' ) {
   	   		$(this).html('구매확정 완료');
   		 }
  	})
}); */
  	
</script>
	
	
</body>
</html>