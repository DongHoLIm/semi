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
		margin-top: 10px;
	}
	#area {
		align:center;
		width:100%;
		height:100%;
		background-color:#ddf;
		margin-top: 30px;
		padding-top: 2%;
		
	}
	#payForm{
		align:center;
		font-size: 1.5vw;
	}
	
	#paymentPrice{
		text-align: right;
	}
	
	#message{
		width:100%;
		resize:none; 
	}
	
	
	#pt{
		font-family: 'Nanum Gothic', sans-serif;
		font-weight:bord;
		margin:0 auto;
		width:80%;
		max-height:200px;
		padding-top: 5%;
	}
	
	#payForm table td{
		padding:4px;
	}
		
	#productImg{
		border:2px solid black;
		
	}
	
	#title{
		font-size:2vw;
		padding:1%;
	}
	
	#Detail{
		font-size:1vw;
		vertical-align: top;
		padding:1%;
	}
	
	#price{
		font-size:1.5vw;
	}
	
	#quantity{
		font-size:1.5vw;
	}
	
	#priceAll{
		font-size:1.5vw;
	}
	
	
</style>


</head>
<body>
	<!-- header 영역 -->
	<header><%@ include file="../hfl/header.jsp" %></header>
	
	
	<div><%@ include file="../hfl/list.jsp" %></div>
	<section id="sec1">
	
	
	<div id="area">
	
	<!-- 장바구니 목록(상품테이블) -->
	<table id="pt">
							<tr>
								<!-- 장바구니에 등록한 상품 사진, 품명, 상세설명 -->
								<td id="productImg" rowspan="2"><img
									src="/sp/images/flower2.PNG" width=100% hright=100%></td>
								<!--  -->
								<td id="title" colspan="2" width="70%" height="30%">상품명</td>
							</tr>
							<tr>
								<td id="Detail" colspan="2">상세설명상세설명상세설명상세설명상세설명상세설명상세설명상세설명상세설명상세설명상세설명상세설명상세설명상세설명
									상세설명상세설명상세설명상세설명상세설명상세설명상세설명 상세설명상세설명상세설명상세설명상세설명상세설명상세설명</td>
							</tr>
							<tr>
								<td id="price" width="30%">금액 :<%
									
								%>
								</td>
								<td id="quantity" width="20%">수량 : <%
									
								%>
								</td>
								<td id="priceAll" width="50%">상품 총 금액 : <%
									
								%>
								</td>
							</tr>
						</table>
	
	
	<br><br>
	
	<!-- 정보 입력창 -->
	<form id="payForm" action="" method="post">
		<table align="center">
		<tr><td>
			<label>총 결제금액 : </label>
		</td><td>
			<input type="text" name="paymentPrice" id="paymentPrice" value="<%int i = 0; %><%=i %>원" readonly>
		</td></tr>
		<tr><td>
			<label>택배 수령자 : </label>
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
	<br />
	</div>
	</section>
	
	
	
	
	<!-- footer 영역 -->
	<footer><%@ include file="../hfl/footer.jsp" %></footer>
	
</body>
</html>