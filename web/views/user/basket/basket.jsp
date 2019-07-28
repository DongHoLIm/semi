<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kh.bvengers.user.basket.model.vo.*"%>
	<%
		ArrayList<Basket> list = (ArrayList<Basket>) request.getAttribute("list");
		int count = list.size();
		int totalPrice = 0;
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#sec1 {
	width: 100%;
	height: 100%;
	padding-right: 20%;
	padding-left: 20%;
	margin: auto;
}

#area {
	width: 100%;
	background-color: #eef;
	padding: 2%;
}

#total {
	vertical-align: bottom;
	border-left: 1px solid #aaa;
	padding: 1%;
}

#pt {
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bord;
}

#productImg {
	border: 2px solid black;
}

#title {
	font-size: 2vw;
	padding: 1%;
}

#Detail {
	font-size: 1vw;
	vertical-align: top;
	padding: 1%;
}

#price {
	font-size: 2vw;
}

#quantity {
	font-size: 2vw;
}

#priceAll {
	font-size: 2vw;
}
</style>

</head>
<body>
	<!-- header 영역 -->
	<header><%@ include file="../hfl/header.jsp"%></header>


	<div><%@ include file="../hfl/list.jsp"%></div>

	<section id="sec1">
		<div id="area">
			<header id="hd1">
				<h2>장바구니</h2>
			</header>

			<!-- count는 아래 테이블에서 장바구니에 등록된 상품을 카운트 하여 표시 기능 필요 -->
			<h3>
				전체 (<%=count%>) 건
			</h3>

			<form action="/sp/views/user/product/payment.jsp">
				<table>
					<tr>
						<td width="70%">
							<%
								for (Basket bk :list) {
							%>
							<table id="pt" width="100%" max-height="200px">
								<tr>
									<!-- 장바구니에 등록한 상품 사진, 품명, 상세설명 -->
									<td id="productImg" rowspan="2">
									<img src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=bk.getFileName() %>" width=100% hright=100%></td>
									<!--  -->
									<td id="title" colspan="2" width="70%" height="30%"><%=bk.getProductName() %></td>
								</tr>
								<tr>
									<td id="Detail" colspan="2"><%=bk.getContent() %></td>
								</tr>
								<tr>									
									<td id="quantity" width="20%">수량 : 1
									</td>
									<td id="priceAll" width="50%">상품 금액 : <%=	bk.getPrice()%>
									</td>
									<td hidden><%=totalPrice+=bk.getPrice()%></td>
								</tr>
							</table> 
							<%}%>

						</td>

						<td id="total" width="30%">
							<p>전체 합계</p> <!-- 상품테이블 갯수 --> <%=count%>개 상품
							<hr>
							<p>전체 주문금액</p> <!-- 상품테이블들의 상품 총금액의 합 --> 
							<input type="text" value="<%=totalPrice %>" readonly />원 
							<br>						
							<br>
							<button type="button" id="deleteProduct">장바구니빼기</button>
							<button type="submit" id="buy" style="width: 100%;">주문하기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>




	<!-- footer 영역 -->
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
</body>
</html>



















