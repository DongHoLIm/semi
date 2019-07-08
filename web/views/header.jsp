<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>

#headerAll{
	padding-right: 15%;
	padding-left:15%;
}
.headerb{
font-family: 'Nanum Gothic', sans-serif;
   text-align:right;
}

.header {
    padding: 15px;
    text-align: center;
}

.box{
   text-align: right;
   padding-right:20px;
}

.container-fluid{
   text-align : center;
}

.menu{
   padding :10px;
   text-align: 
}

.navi {   
	list-style-type:none;
	height:40px;
	margin:center;
	padding:10px;
	margin:0;
	color:#ff8d9;
}

.navi li { 
	float:left;
	position: relative;
	padding: 0;
	line-height:40px;
	background:#ffd8d9;
	width:16.66666666666667%;
}

.navi li ul {
	opacity:0;
	position:absolute;
	left:0;
	width:100%; 
	background:#ff99b3;
	list-style-type:none;
	padding:0;
	margin:0;
	font-size:15px;
} 

.navi li a { 
	display:block;
	font-family:'Nanum Gothic', sans-serif;
	font-weight:600;
	font-size:14px;
	padding:5px 25px;
	color:black;
	text-decoration:none; 
}

.navi li a:hover {color:white;} /* 마우스 클릭시 글자 색 */

.navi li:hover ul {opacity:1;} 

.navi li ul li {
	float:none;
	position:static;
	height:0;
	line-height:0;
	background:none;
	width:100%
}

.navi li:hover  ul li { 
	height:30px; 
	line-height:20px; 
	padding:5px0;
}

</style>

</head>
<body>
<div id="headerAll">
   <div class = "headerb">
   <button class="btn btn-info" >login</button>
   <button class="btn btn-info">회원가입</button>   
   </div>
   <div class = "header">
      <h1>중고의 민족</h1>
   </div>
	<div class="box">
  		<div class="container-1">
     		<input type="search" id="search" placeholder="검색" />
      		<button type="button" class="btn btn-info">검색</button>
  		</div>
 	</div>
	<ul class="navi">

 <li><a href="#"> 카테고리</a> 
 
 <ul>
  <li><a href="/sp/views/payment.jsp"> 구매 </a></li> 
  <li><a href="#"> 렌탈</a></li>
    </ul>     
     </li> <li><a href="#"> 상품등록 </a>  
     <li><a href="/sp/views/basket.jsp"> 장바구니 </a></li> 
     <li><a href="#"> 게시판</a></li>
     <li><a href="#"> 마이페이지</a></li>
    <li><a href="#"> 고객센터</a></li>    
 </ul>
 </div>
</body>
</html>