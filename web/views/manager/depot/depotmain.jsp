<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<style>
	#depotMainDiv{
		width:80%;
		height: 80%;
		border: 1px solid black;
		margin:0 auto;
				
	}
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
	th{
		border:1px solid black;
		text-align:center;
	}
	form{
		float:right;
	}
</style>
<body>
	<div id="depotMainDiv">
	<%@ include file ="/views/manager/hfl/managerHeader.jsp" %>
	<br>
	<h2 align="center">창고현황</h2>
	<br />
	<div id="selectSearch">
	<form action="">
		<select name="" id="selectBox" onchange="changeSearchBox();">
			<option class="A" value="locationNum">위치관리번호</option>
			<option class="A" value="barCode">바코드넘버</option>
			<option class="A" value="searchDate">적치 일자</option>
		</select>
				
		<div id="location">
		<input type="text" />
		<button type="submit">검색</button>
		</div>
		<div id="date">
		<input type="date" />
		<button type="submit">검색</button>
		</div>
	</form> 
	<script>
	$(function (){
		$("#date").hide();
	});	
	function changeSearchBox(){
			    var langSelect = document.getElementById("selectBox");
		     
			    // select element에서 선택된 option의 value가 저장된다.
			    var selectValue = langSelect.options[langSelect.selectedIndex].value;
			 	
			  if(selectValue=="searchDate"){
				  $("#location").hide();
				  $("#date").show();
			  }else{
				  $("#location").show();
				  $("#date").hide();
			  }
		}
	</script>
	</div>
	<br>
	<br><br>
		<table id="depotMain" align="center">
			<tr>
				<th id=""></th>
				<th>번호</th>
				<th>상품코드</th>
				<th>위치관리번호</th>
				<th>바코드넘버</th>
				<th>적치 일자</th>
				<th>출고 일자</th>
			</tr>
			<tr>
				<td></td>
				<td><a href="">1</a></td>
				<td><a href="">p-1</a></td>
				<td><a href="">c-3</a></td>
				<td><a href="">p-123213</a></td>
				<td><a href="">2017/05/06</a></td>
				<td><a href="">null</a></td>
			</tr>
		</table>
	
	</div>
	
</body>
</html>