<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
#headerAll {
	padding-right: 15%;
	padding-left: 15%;
}

.headerb {
	font-family: 'Nanum Gothic', sans-serif;
	text-align: right;
	padding-right: 15%;
}

.header {
	padding: 15px;
	text-align: center;
}

.box {
	text-align: right;
	padding-right: 15%;
}

.container-fluid {
	text-align: center;
}


.menu{
   padding :10px;
}

.navi {
	list-style-type: none;
	height: 40px;
	margin: center;
	padding: 10px;
	margin: 0;
	color: #ff8d9;
}

.navi li {
	float: left;
	position: relative;
	padding: 0;
	line-height: 40px;
	background: #ffd8d9;
	width: 16.66666666666667%;
}

.navi li ul {
	opacity: 0;
	position: absolute;
	left: 0;
	width: 100%;
	background: #ff99b3;
	list-style-type: none;
	padding: 0;
	margin: 0;
	font-size: 15px;
}

.navi li a {
	display: block;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 600;
	font-size: 14px;
	padding: 5px 25px;
	color: black;
	text-decoration: none;
}

.navi li a:hover {
	color: white;
} /* 마우스 클릭시 글자 색 */
.navi li:hover ul {
	opacity: 1;
}

.navi li ul li {
	float: none;
	position: static;
	height: 0;
	line-height: 0;
	background: none;
	width: 100%
}

.navi li:hover  ul li {
	height: 30px;
	line-height: 20px;
	padding: 5px0;
}

.btn-info {
	background: #ffd8d9;
	border: 1px solid #ffd8d9;
	text-align:right;
}

.btn-info:hover {
	background: #fdb5b7;
	border: 1px solid #fdb5b7;
}

#search {
	border-radius: 5px;
}
</style>

</head>
<body>

<div id="headerAll">
   <div class = "headerb">
    <a href="../login/login.jsp"><button class="btn btn-info" >login</button></a>
    <a href="../join/selectjoin.jsp"><button class="btn btn-info">회원가입</button></a>   

   </div>
   <div class = "header">
      <!-- <h1>중고 愛 민족</h1> -->
      <a href="/sp/index.jsp"><img src="/sp/images/logo3.png" alt="" width="20%"/></a>
   </div>
	<div class="box">
  		<div class="container-1" align="right">
     		<input type="search" id="search" placeholder="검색" />
      		<button type="button" class="btn btn-info">검색</button>
  		</div>
 	</div>
	<ul class="navi">

 <li><a href="#"> 카테고리</a> 
 
 <ul>

  <li><a href="/sp/views/payment.jsp"> 구매 </a></li> 

    </ul>     
     </li> <li><a href="/sp/views/user/product/productEnroll.jsp"> 상품등록 </a>  
     <li><a href="/sp/views/user/basket/basket.jsp"> 장바구니 </a></li> 
     <li><a href="/sp/views/board.jsp"> 게시판</a></li>
     <li><a href="/sp/views/user/mypage/myPage.jsp"> 마이페이지</a></li>
    <li><a href="#"> 고객센터</a></li>    
 </ul>
 </div>

</body>
</html>