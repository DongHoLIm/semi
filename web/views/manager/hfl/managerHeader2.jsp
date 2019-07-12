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


</style>

</head>
<body>
	<div id="headerAll">
		<div class = "headerb">
			<label for=""><% %>님 환영합니다.</label>
			<button class="btn btn-info" >logout</button>  
		</div>
		
		<div class = "header">
			<h1>중고애 민족</h1>
		</div>	
	</div>
	<nav class="w3-sidebar w3-bar-block w3-animate-left w3-collapse w3-top w3-center"
		style="width:15%; font-weight: bold" id="mySidebar">


		<div class="w3-dropdown-hover" id="pc">
			&nbsp;&nbsp;&nbsp;&nbsp;<a>PC</a>
			<div class="w3-dropdown-content w3-border">
				<a href="#" class="w3-button">본체</a><br> 
				<a href="#" class="w3-button">모니터</a><br> <a href="#" class="w3-button">주변기기</a>
			</div>
		</div>
	</nav>
</body>
</html>