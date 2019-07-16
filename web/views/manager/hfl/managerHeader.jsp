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
	padding-right: 0%;
	padding-left:10%;
	
}

.headerb{
   font-family: 'Nanum Gothic', sans-serif;
   text-align:right;
   margin-top:10px;
   margin-right: 10%;
}

.header {
    padding: 15px;
    text-align: center;
}

.navi {   
	list-style-type:none;
	height:40px;
	margin:0px auto;
	padding:10px;
	margin:0;
	color:#ff8d9;
	text-align: center;	
}

.navi li { 
	float:left;
	position: relative;
	padding: 0px;
	line-height:40px;
	background:#ffd8d9;
	width:15%;
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
	font-size:1vw;
} 

.navi li a { 
	display:block;
	font-family:'Nanum Gothic', sans-serif;
	font-weight:600;
	font-size:1vw;
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
	<div id="headerAll" >
		<div class = "headerb">
			<label for=""><% %>님 환영합니다.</label>
			<button class="btn btn-info" >logout</button>  
		</div>
		
		<div class = "header">
			<h1>중고애 민족</h1>
		</div>
		
		<ul class="navi">
		
			<li><a href="#"> 상품관리</a> 
				<ul>

					<li><a href="../manager/product/productmanagement.jsp">상품조회/수정/등록</a></li> 
					<li><a href="../manager/product/powerProductPage.jsp">파워 상품 관리</a></li>
					<li><a href="../manager/product/calculate.jsp">정산 내역</a></li>

				</ul>     
			</li>
			<li><a href="#">회원관리</a>
				<ul>
					<li><a href="#">배송현황 관리</a></li> 

					<li><a href="#">구매 확정 내역</a></li>
					<li><a href="#">창고 조회</a></li>
				</ul>     
			</li>  
			<li><a href="#">회원관리</a>
				<ul>
					<li><a href="../member/membermanagement.jsp">고객정보</a></li>
					<li><a href="#">고객등급</a></li> 
					<li><a href="../member/blackList.jsp">블랙리스트 관리</a></li>
				</ul>     
			</li> 
			<li><a href="#">통계</a>
				<ul>
					<li><a href="#">고객현황</a></li> 
					<li><a href="#">매출현황</a></li>
				</ul>
			</li>
			<li><a href="#">게시글 관리</a>
				<ul>
					<li><a href="../manager/board/boardmenegement.jsp">게시판 관리</a></li> 
					<li><a href="../manager/board/qnaboardmenegement.jsp">고객센터 관리</a></li>
				</ul>
			</li>
			<li><a href="../depot/depotmain.jsp">창고 관리</a>
				<ul>
					<li><a href="../depot/depotBarcode.jsp">바코드 출력</a></li>
					<li><a href="#">창고위치별현황</a></li>
				</ul>
			</li>    
		</ul>
	</div>
</body>
</html>