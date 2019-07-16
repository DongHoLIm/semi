<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#sec1 {
		width:100%;
		height:100%;
		padding-right:20%;
		padding-left:20%;
		margin-top: 10px;
	}
.productDiv {
	margin:0 auto;
	height: 500px;
	width: 100%;
	float: center;
	text-align: center;
	position: relative;
	margin-top: 5%;
	margin-bottom : 5%;
}
#productList{
	display:inline;
}

#title {
	text-align: left;
}
</style>

</head>
<%@ include file="../hfl/header.jsp"%>
<body>
	<%@ include file="../hfl/list.jsp"%>
	
	<section id="sec1">
		<div class="productDiv">
			<h1 align="center">판매게시판</h1>
			
			<%
				for(int i = 0; i < 5; i++){
				
			%>
			
			<table id="productList">
				<tr>
					<td><a href="/sp/views/user/product/productDetails.jsp" id=""><img src="/sp/images/face.png"
						class="img-rounded" alt="Cinque Terre" width="255" height="236">&nbsp;&nbsp;</a></td>
				</tr>
				<tr>
					<td>
						<h3><a href="" name="title">진수의 분홍분홍 쿨러</a></h3>
						<br>
						<p>가격: 5000000 <br> 내용: 노트북쿨러</p>
					</td>
				</tr>
			</table>
			
			<%} %>
			
		</div>
	</section>
</body>
</html>