<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.productDiv {
	margin-left: 18%;
	height: 500px;
	width: 100%;
	float: center;
	text-align: center;
	position: relative;
	margin-top: 5%;
	margin-bottom : 5%;
}

#title {
	text-align: left;
}
</style>

</head>
<%@ include file="../hfl/header.jsp"%>
<body>
	<%@ include file="../hfl/list.jsp"%>
	<div class="productDiv">

		<table id="productList">
			<tr>
				<td colspan=4 id=title><label><h1>판매게시판</h1></label></td>
			</tr>
			<tr>
				<td><a href="<%=request.getContextPath()%>/views/user/product/productDetails.jsp"><img src="<%=request.getContextPath()%>/images/face.png"
					class="img-rounded" alt="Cinque Terre" width="304" height="236">&nbsp;&nbsp;</a></td>
				<td><img src="<%=request.getContextPath()%>/images/flower4.PNG"
					class="img-rounded" alt="Cinque Terre" width="304" height="236">&nbsp;&nbsp;</td>
				<td><img src="<%=request.getContextPath()%>/images/flower5.PNG"
					class="img-rounded" alt="Cinque Terre" width="304" height="236">&nbsp;&nbsp;</td>
				<td><img src="<%=request.getContextPath()%>/images/galxy.PNG"
					class="img-rounded" alt="Cinque Terre" width="304" height="236">&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td><h3>
						<a href="" name="title">진수의 분홍분홍 쿨러</a>
					</h3> <br>
					<p>
						가격: 5000000 <br> 내용: 노트북쿨러
					</p></td>
				<td><h3>
						<a href="" name="title">진수의 분홍분홍 쿨러</a>
					</h3> <br>
					<p>
						가격: 5000000 <br> 내용: 노트북쿨러
					</p></td>
				<td><h3>
						<a href="" name="title">진수의 분홍분홍 쿨러</a>
					</h3> <br>
					<p>
						가격: 5000000 <br> 내용: 노트북쿨러
					</p></td>
				<td><h3>
						<a href="" name="title">진수의 분홍분홍 쿨러</a>
					</h3> <br>
					<p>
						가격: 5000000 <br> 내용: 노트북쿨러
					</p></td>
			</tr>
		</table>
	</div>
</body>
</html>