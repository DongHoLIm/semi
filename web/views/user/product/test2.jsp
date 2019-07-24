<%@page import="com.kh.bvengers.product.model.vo.Product"%>
<%@page import="com.kh.bvengers.board.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.bvengers.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Product p = (Product) request.getAttribute("p");
	Board b = (Board) request.getAttribute("b");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>) request.getAttribute("fileList");
	Attachment productImg = fileList.get(0);
%>
<!DOCTYPE html>
<html>
<head>
<style>
.outer {
	width: 50%;
	margin-left: auto;
	margin-right: auto;
	margin-top: auto;
}

.detail td, .detail th {
	text-align: center;
	border: 1px solid black;
}

.detail th {
	font-size: 1.2em;
	font-weight: bold;
	width : 100px;
	background: black;
	color:white;
	border: 1px solid white;
}

#titleImgArea {
	margin: 0 auto;
}
#titleImg {
	width: 300px;
	height: 300px;
}

#titleContentArea{
	height : 500px;
}
#titleContent{
	width: 600px;
}
#price{
	font-size:2em;
}
.detailBtn{
	background: black;
	color: white;
	border: none;
	width: 100px;
	height: 50px;

}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header><%@ include file="../hfl/header.jsp"%></header>
	<div class="outer">
		<form action="<%=request.getContextPath()%>" method="post" encType="multipart/form-data" id="productDetail">
			<table class="detail" align="center">
				<input type="hidden" value="<%= b.getPostsId() %>" />
				<tr>
					<th>판매자</th>
					<th colspan="6"><label><%= b.getWriter() %></label></th>
				</tr>
				<tr>
					<th rowspan="4">상품</th>
					<td rowspan="4">
						<div id="titleImgArea" align="center">
							<img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= productImg.getNewFileName() %>" id="titleImg" />
						</div>
					</td>
					<th width="100px" height="50px">상품명</th>
					<th colspan="3" id="titleContent"><label><%= b.getPostsTitle() %></label></th>
				</tr>
				<tr>
					<td colspan="4">

					</td>
				</tr>
				<tr>
					<td colspan="4">
						<label id="price"><%=p.getProductMoney() %>원</label></td>
					</tr>
				<tr>
					<td width="300px">
						<input type="button" value="장바구니" id="basketBtn" class="detailBtn"/>
					</td>
					<td width="300px">
						<input type="button" value="구매하기" id="orderBtn" class="detailBtn"/>
					</td>
				</tr>
				<tr>
					<th>상품 설명</th>
					<td colspan="5">
						<div id="titleContentArea">
							<p id="contents"><%= b.getContents() %></p>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
</body>
</html>