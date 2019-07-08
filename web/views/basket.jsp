<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#sec1 {
		width:100%;
		height:100%;
		padding-right:20%;
		padding-left:20%;
		
		margin:auto;
	}
	#area {
		
		width:100%;
		background-color:#eef;
		padding:2%;
	}
	
	#total{
		vertical-align: bottom;
		border-left: 1px solid #aaa;
		padding : 1%;
	}
</style>
		
</head>
<body>
	<!-- header 영역 -->
	<header><%@ include file="header.jsp" %></header>
	
	
	
	<section id="sec1">
	<div id="area">
	<header id = "hd1"><h2>장바구니</h2></header>
	
	<!-- count는 아래 테이블에서 장바구니에 등록된 상품을 카운트 하여 표시 기능 필요 -->
	<h3>전체 (<%int count = 0;%><%=count %>) 건</h3>
	
	<table>
	<tr>
	<td width="70%">
	<!-- 장바구니 목록(상품테이블) -->
	<!-- 장바구니 목록을 반복문으로 읽어서 해당하는 상품 정보를 테이블에 넣어서 인클루드 하면 될꺼같은데 난 못할꺼같음ㅋ  -->
	<% 	
		for(int i = 0; i < 3; i++){
	%>
	 		<%@ include file="productTable.jsp" %>
	<%		
		}
	%>
	
	</td>
	
	<td id="total" width="30%">
	<p>전체 합계</p>
	<form action="">
	<!-- 상품테이블 갯수 -->
	<% int countTable = 0; %><%=countTable %>개 상품
	<hr>
	<p>전체 주문금액</p>
	<!-- 상품테이블들의 상품 총금액의 합 -->
	<input type="text" value="<% int priceAll = 0; %><%=priceAll %>" readonly/>원
	<br><br>
	
	<input type="submit" id="buy" value="주문하기" style="width:100%;">
	</form>
	</td>
	</tr>
	</table>
	
	</div>
	</section>
	
	
	
	
	<!-- footer 영역 -->
	<footer><%@ include file="footer.jsp" %></footer>
</body>
</html>



















