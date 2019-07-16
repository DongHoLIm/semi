<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>

nav {
	margin-top: 12.7%;
	margin-right: 5%;
	position: absolute;
}

#pc {
	background: none;

}
</style>
<title>Insert title here</title>
</head>
<body>
	<!-- header 영역 -->
<body>

	<nav
		class="w3-sidebar w3-bar-block w3-animate-left w3-collapse w3-top w3-center"
		style="width:15%; font-weight: bold; background-color:#ffe6e6 /* border-style: dotted; border-width: 2px; border-color:pink */">

		<br><br><br><br>
		<div class="w3-dropdown-hover" id="pc">
			&nbsp;&nbsp;&nbsp;&nbsp;<a>쇼핑내역</a>
			<div class="w3-dropdown-content w3-border">
				<ul href="#" class="w3-button">주문내역</ul><br>
				<a href="../mypage/orderLook.jsp">주문/배송조회</a><br>
				<a href="../mypage/cancleLook.jsp">취소/반품조회</a><br>
				<a href="../mypage/refund.jsp">환불/정산내역</a>
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
			&nbsp;&nbsp;&nbsp;&nbsp;<a>회원정보변경/탈퇴</a>
			<div class="w3-dropdown-content w3-bar-block w3-border">
				<a href="../mypage/changeInfo.jsp" class="w3-button">회원정보 변경</a><br> 
				<a href="../mypage/memberSignOut.jsp" class="w3-button">회원 탈퇴</a>
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

</html>









