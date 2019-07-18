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
	width: 100%;
	float: center;
	align: left;
	position: relative;
	margin-top: 5%;
	margin-bottom : 5%;
	
}

#productList{
	text-align:center;
}

#title {
	text-align: left;
}

#sampleProduct:hover{
	cursor: pointer;
}

a{
	text-decoration: none;
}
</style>

</head>
<%@ include file="../hfl/header.jsp"%>
<body>
	<%@ include file="../hfl/list.jsp"%>
	
	<section id="sec1">
		<div class="productDiv">
			<h1 align="center">판매게시판</h1>
			<br />
			<table>
			<%
				int product = 5;
				for(int i = 0; i < product; i++){
			%>
			<%if(i%4 == 0){%>
				<tr id="sampleProduct" onclick="location.href='/sp/views/user/product/productDetails.jsp'">
			<% }%>
					<td width="25%">
				<table id="productList">
					<tr>
						<td><img src="/sp/images/face.png"
							class="img-rounded" alt="Cinque Terre" width="100%">&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<td>
							<h3><a name="title">진수의 분홍분홍 쿨러</a></h3>
							<br>
							<p>가격: 5000000 <br> 내용: 노트북쿨러</p>
						</td>
					</tr>
				</table>
				</td>
			<%if((i%4 == 0 && i != 0) || i == product){%>
				</tr>
			<% }%>
				
			<%} %>
			</table>
		</div>
	</section>
	<br />
	<%@ include file="../hfl/footer.jsp"%>
</body>
</html>