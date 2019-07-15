<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
/* aside{
		width:10%; 
		text-align: center;
		border-style: solid;
  		border-width: 2px;
  		border-color: pink;
  
	} */
nav {
	margin-top: 5%;
	margin-right: 5%;
	/* padding-right:5%;
		padding-left:5%; */
}

#pc {
	background: none;
	
}
</style>
<title>Insert title here</title>
</head>
	<header><%@ include file="../user/hfl/header.jsp"%></header>
<body>
	<!-- header 영역 -->
<body>

	<nav
		class="w3-sidebar w3-bar-block w3-animate-left w3-collapse w3-top w3-center"
		style="width:15%; font-weight: bold" id="mySidebar">


		<div class="w3-dropdown-hover" id="pc">
			&nbsp;&nbsp;&nbsp;&nbsp;<a>상품관리</a>
			<div class="w3-dropdown-content w3-border">
				<a href="../manager/product/productmanagement.jsp" class="w3-button">상품조회</a><br> 
				<a href="../manager/product/powerProductPage.jsp" class="w3-button">파워상품 관리</a><br> 
				<a href="../manager/product/calculate.jsp" class="w3-button">정산 내역</a>
			</div>
		</div>

		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div class="w3-dropdown-hover" id="nettop">
			&nbsp;&nbsp;&nbsp;&nbsp;<a>창고관리</a>
			<div class="w3-dropdown-content w3-bar-block w3-border">
				<a href="#" class="w3-button">주문조회</a><br> 
				<a href="#" class="w3-button">배송현황 관리</a><br> 
				<a href="#" class="w3-button">구매확정 내역</a>
				<a href="#" class="w3-button">창고조회</a>
			</div>
		</div>

		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div class="w3-dropdown-hover" id="ect">
			&nbsp;&nbsp;&nbsp;&nbsp;<a>회원관리</a>
			<div class="w3-dropdown-content w3-bar-block w3-border">
				<a href="../manager/member/membermanagement.jsp" class="w3-button">고객정보</a><br> 
				<a href="#" class="w3-button">고객등급</a><br>
				<a href="../manager/member/blackList.jsp" class="w3-button">블랙리스트관리</a>
			</div>
		</div>

		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div class="w3-dropdown-hover" id="ect">
			&nbsp;&nbsp;&nbsp;&nbsp;<a>통계</a>
			<div class="w3-dropdown-content w3-bar-block w3-border">
				<a href="#" class="w3-button">고객현황</a><br> 
				<a href="#" class="w3-button">매출현황</a><br>
			</div>
		</div>

		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div class="w3-dropdown-hover" id="ect">
			&nbsp;&nbsp;&nbsp;&nbsp;<a>게시글 관리</a>
			<div class="w3-dropdown-content w3-bar-block w3-border">
				<a href="../manager/board/boardmenegement.jsp" class="w3-button">게시판</a><br> 
				<a href="../manager/board/qnaboardmenegement.jsp" class="w3-button">고객센터 관리</a><br>
			</div>
		</div>
	</nav>


	


	<a style="display: scroll; position: fixed; bottom: 10px; right: 20px;"
		href="#" title="Top">
		<p style="padding: 20px; background: #F66; color: #fff;">맨위로</p>
	</a>


	</aside>

</body>
<!-- footer 영역 -->
<footer><%@ include file="../user/hfl/footer.jsp"%></footer>

</html>










