<%@page import="com.kh.bvengers.product.model.vo.Category"%>
<%@page import="com.kh.bvengers.board.model.vo.Attachment"%>
<%@page import="com.kh.bvengers.board.model.vo.Posts"%>
<%@page import="com.kh.bvengers.product.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Product product = (Product) request.getAttribute("product");
	Posts posts = (Posts) request.getAttribute("posts");
	Attachment attachment = (Attachment) request.getAttribute("attachment");
	Category category = (Category) request.getAttribute("category");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Nanum Gothic', sans-serif;
}

#sec1 {
	width: 100%;
	height: 100%;
	padding-right: 20%;
	padding-left: 20%;
	margin-top: 10px;
}

#area {
	align: center;
	width: 100%;
	height: 100%;
	margin-top: 30px;
	padding-top: 2%;
	border:3px solid #ddf;
}

#payForm {
	align: center;
	font-size: 1.2vw;
}

#paymentPrice {
	text-align: right;
}

#message {
	width: 100%;
	resize: none;
}

.pt {
	margin: 0 auto;
	width: 80%;
	max-height: 200px;
	padding-top: 5%;
	border:1px solid #aabfde;
	border-radius:5px;
	font-family: 'Nanum Gothic', sans-serif;
}

#payForm table td {
	padding: 4px;
}

#productImg {
	text-align:center;
	border: 2px solid #aabfde;
}

.postsTitle {

	font-family: 'Nanum Gothic', sans-serif;
	font-size: 1.8vw;
	padding: 1%;
}

#Detail {
	font-size: 1vw;
	vertical-align: top;
	padding: 1%;
	border:1px solid #aabfde;
}

#price {
	font-size: 1.5vw;
	text-align:right;
	padding:1%;
}

#quantity {
	font-size: 1.5vw;
}

#priceAll {
	font-size: 1.5vw;
}

.payInfo{
	width:80%;
	border:1px solid #aabfde;
}

.addressNum{
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: 1vw;
	line-height: normal;
	vertical-align: middle;
	background-color: #7799dd;
	cursor: pointer;
	border: 1px solid #7090d0;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.buy{
	width:50%;
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #7799dd;
	cursor: pointer;
	border: 1px solid #7090d0;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}
.buy:hover{
	width:50%;
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #ff5500;
	cursor: pointer;
	border: 1px solid #7090d0;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}
</style>


</head>
<body>
	<!-- header 영역 -->
	<header><%@ include file="../hfl/header.jsp"%></header>


	<div><%@ include file="../hfl/list.jsp"%></div>
	<section id="sec1">


		<div id="area">

			

			<!-- 장바구니 목록(상품테이블) -->
			<table class="pt">
				<tr>
					<!-- 장바구니에 등록한 상품 사진, 제목, 카테고리, 품명, 가격,  -->
					<td id="productImg" rowspan="3" width="20%"><img src="/sp/images/flower2.PNG" width=95% hright=100%></td>
					<!--  -->
					<td class="postsTitle" colspan="3" width="70%" height="30%"><label>게시글제목<%/* posts.getPostsTitle() */ %></label></td> <!-- 게시글 -제목: 제거 -->
				</tr>
				<tr>
					<td id="Detail"><label>제품명 | <%/* product.getProductName() */ %></label></td>	
					<td id="Detail"><label>카테고리 | <% /* category.getCategoryDiv() */ %></label></td>	
					<td id="Detail"><label>판매자 | <% /* posts.getMemberNo() */%></label></td>	
				</tr>
				<tr>
					<td colspan="3" id="price" ><label><% /* product.getProductMoney() */%>원</label></td>
				</tr>
			</table>

			<hr width="80%"/>
			<!-- 정보 입력창 -->
			<form id="payForm" action="">
				<table align="center" class="payInfo">
					<tr>
						<td><label>총 결제금액</label></td>
						<td><input type="text" name="paymentPrice" id="paymentPrice"
							value="<% /* product.getProductMoney() */ %>원" readonly></td>
					</tr>
					<tr>
						<td><label>택배 수령자 </label></td>
						<td><input type="text" placeholder="수령자 이름을 입력하세요"
							name="name" id="name"></td>
					</tr>
					<tr>
						<td><label>우편번호 </label></td>
						<td><input type="text" placeholder="우편번호" name="age" id="age" readonly> &nbsp; &nbsp;
							<input type="button" name="addressNum" class="addressNum" value="우편번호찾기"></td>
					</tr>
					<tr>
						<td><label>주소 </label></td>
						<td><input type="text" placeholder="주소" name="address"
							id="address" readonly> &nbsp; &nbsp; <input type="text"
							name="subAddress" id="subAddress"><br></td>
					</tr>
					<tr>
						<td><label>연락처 </label></td>
						<td><input type="text" placeholder="연락처" name="phone"
							id="phone"></td>
					</tr>
					<tr>
						<td colspan="2"><label>배송시 요구사항 </label> <br>
						<textarea placeholder="요구사항을 입력해주세요" width=100% name="message" rows="5" id="message"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit" class="buy" value="결제하기" onclick="paymentApi();"></td>
					</tr>
				</table>
			</form>
			<br />
		</div>
	</section>
	<script type="text/javascript">
		function paymentApi(){
			var popUrl = "paymentApi.jsp";	//팝업창에 출력될 페이지 URL

			var popOption = "width=700px, resizable=no, scrollbars=no, status=no";    //팝업창 옵션(optoin)

			window.open(popUrl,"",popOption);
		}
	</script>



	<!-- footer 영역 -->
	<footer><%@ include file="../hfl/footer.jsp"%></footer>

</body>
</html>