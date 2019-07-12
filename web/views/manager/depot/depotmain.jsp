<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file ="/views/manager/hfl/managerHeader.jsp" %>
<style>
	#depotMain{
		width:80%;
		height: 80%;
		border: 1px solid black;		
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
	<br>
	<h2 align="center">창고 현황</h2>
	<form action="">
		<select name="searchDepot" id="">
			<option value="위치관리번호"></option>
			<option value=""></option>
			<option value=""></option>
			<option value=""></option>
		</select>
		<input type="text" />
		<button type="submit">검색</button>
	</form>
	<br>
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
				<td>1</td>
				<td>1</td>
				<td>p-1</td>
				<td>c-3</td>
				<td>p-123213</td>
				<td>2017/05/06</td>
				<td>null</td>
			</tr>
		</table>
	
	</div>
	
</body>
</html>