<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
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
	#th3{
		border:1px solid black;
		text-align:center;
		background: black;
		color:white;
	}
	td{
		border: 1px solid black;
		text-align:center;
	}
	#searchButton{
		padding-left:73%;
	}
</style>
<body>
<%@ include file = "../hfl/managerHeader.jsp" %>
	<br />
	<h3 align="center">검수요청 관리</h3>
		<br />
		<div id="searchButton">
			<form action="">
				<select name="check" id="check" onchange="changeSearchBox();">
					<option value="location">위치관리번호</option>
					<option value="date">검수요청일자</option>
					<option value="status">검수진행상태</option>
				</select>
				<div id="locationNum">
					<input type="text" name="searchCheck" id="searchCheck"/>
					<button type="submit">검색</button>
				</div>
				<div id="checkDate">
					<input type="date" />
					<button type="submit">검색</button>
				</div>
				<div id="checkStatus">
					<select name="" id="">
						<option value="">검수요청</option>
						<option value="">검수중</option>
						<option value="">검수완료</option>
					</select>
					<button type="submit">검색</button>
				</div>
			</form>	
			<script>
				$(function(){
					$("#checkDate").hide();
					$("#checkStatus").hide();
				});
				function changeSearchBox(){
					var langSelect = document.getElementById("check");
					
					var selectVal = langSelect.options[langSelect.selectedIndex].value;
					
					if(selectVal=="location"){
						$("#locationNum").show();
						$("#checkDate").hide();
						$("#checkStatus").hide();
					}else if(selectVal=="date"){
						$("#locationNum").hide();
						$("#checkDate").show();
						$("#checkStatus").hide();
					}else{
						$("#locationNum").hide();
						$("#checkDate").hide();
						$("#checkStatus").show();
					}
						
				}
			</script>
		</div>
		<br />
	<div id="checkMain">
		<div id="table Area">
			<table id="depotMain" align="center">
			<tr>
				<th id="th3">번호</th>
				<th id="th3">상품코드</th>
				<th id="th3">카테고리</th>
				<th id="th3">상품명</th>
				<th id="th3">수량</th>				 
				<th id="th3">검수 요청일자</th>
				<th id="th3">검수진행상태</th>
			</tr>
			<tr>
				<td>1</td>
				<td>PC0120</td>
				<td>PC-본체</td>
				<td>매직스테이션</td>
				<td>1</td>
				<td>2019-07-17</td>
				<td><button onclick="location.href='depotCheck.jsp'">검수요청</button></td>
			</tr>
			</table>
		</div>
	</div>


</body>
</html>