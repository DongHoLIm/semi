<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Nanum Gothic', sans-serif;
	}
	#sec1 {
		width:100%;
		height:100%;
		padding-right:20%;
		padding-left:20%;
		
		margin:auto;
	}
	#area {
		align:center;
		width:100%;
		height:100%;
		background-color:#ddf;
		padding:2%, 20%, 2%, 20%;
	}
	#payForm{
		align:center;
		font-size: 150%;
	}
	
	#paymentPrice{
		text-align: right;
	}
	
	#message{
		width:100%;
		resize:none; 
	}
	
	#buy{
		
	}
	
</style>


</head>
<body>
	<!-- header 영역 -->
	<header><%@ include file="header.jsp" %></header>
	
	
	<section id="sec1">
	<div id="area">
	
	<!-- 장바구니 목록(상품테이블) -->
	<%@ include file="productTable.jsp" %>
	
	<br><br>
	
	
	<form id="payForm" action="" method="post">
		<table align="center">
		<tr><td>
			<label>총 결제금액 : </label>
		</td><td>
			<input type="text" name="paymentPrice" id="paymentPrice" value="<%int i = 0; %><%=i %>원" readonly>
		</td></tr>
		<tr><td>
			<label>택배 수령자 명 : </label>
		</td><td>
			<input type="text" placeholder="수령자 이름을 입력하세요" name="name" id="name">
		</td></tr>
		<tr><td>
			<label>우편번호 : </label>
		</td><td>
			<input type="text" placeholder="우편번호" name="age" id="age"  readonly> &nbsp; &nbsp;
			<input type="button" name="addressNum" id="addressNum" value="우편번호찾기">
		</td></tr>
		<tr><td>
			<label>주소 : </label>
		</td><td>
			<input type="text" placeholder="주소" name="address" id="address" readonly> &nbsp; &nbsp;
			<input type="text" name="subAddress" id="subAddress"><br>
		</td></tr>
		<tr><td>
			<label>연락처 : </label>
		</td><td>
			<input type="text" placeholder="연락처" name="phone" id="phone">
		</td></tr>
		<tr><td colspan="2">
			<label>배송시 요구사항 : </label>
			<br>
			<textarea placeholder="요구사항을 입력해주세요" width=100% name="message" id="message"></textarea>
		</td></tr>
		<tr><td colspan="2" align="center">
			
			
			<input type="submit" id="buy" value="구매" style="width:50%;">
		</td></tr>
		
		</table>
		
	</form>
	
	</div>
	</section>
	
	
	
	
	<!-- footer 영역 -->
	<footer><%@ include file="footer.jsp" %></footer>
	
</body>
</html>