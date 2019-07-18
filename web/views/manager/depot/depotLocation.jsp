<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	#depotMain{
		width:80%;
		height: 80%;
		border:2px solid black;
	}
	tr{
		border:1px solid black;		
	}
	td{
		border:1px solid black;
		text-align:center;
		
	}
	#th1{
		border:1px solid black;
		text-align:center;
	}
	form{
		float:right;
	}
	#location{
		padding-right: 190px;	
	}
	#date{
		padding-right: 190px;
	}
</style>
<body>
	<%@ include file ="/views/manager/hfl/managerHeader.jsp" %>
	<br>
	<h2 align="center">창고위치현황</h2>
	<br />
	<div id="selectSearch">		
		<form action="">
			<select name="" id="selectBox">
				<option class="A" value="A">A</option>
				<option class="A" value="B">B</option>
				<option class="A" value="C">C</option>
			</select>
			섹션
			<select name="" id="">
				<option value="1">1</option>
				<option value="1">2</option>
				<option value="1">3</option>
			</select>
			층
			<div id="location">
			<input type="text" />
			<button type="submit">검색</button>
			</div>
		</form> 
	</div>
	<script>
	
	</script>	
	<br>
	<br><br>
		<table id="depotMain" align="center">
			<tr>
				<th id="th1">번호</th>
				<th id="th1">상품코드</th>
				<th id="th1">위치관리번호</th>
				<th id="th1">적치 일자</th>
				<th id="th1">출고 일자</th>
			
			</tr>
			<tr>
				<td><a href="">1</a></td>
				<td><a href="">p-1</a></td>
				<td><a href="">c-3</a></td>
				<td><a href="">2017/05/06</a></td>
				<td><a href="">null</a></td>
			
			</tr>
		</table>
	
</body>
</html>