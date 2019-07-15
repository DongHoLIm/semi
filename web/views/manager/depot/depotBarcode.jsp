<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	#depotMain{
		width:80%;
		height: 80%;
		border:2px solid black;
	}
	#createBarcode{
		float:right;
		margin-right: 140px;
	}
</style>
</head>
<body>
<%@ include file ="/views/manager/hfl/managerHeader.jsp" %>
<br />
	<h2 align="center">바코드 생성</h2>
	<form action="">
	<div id ="barcodeMain">
		<div id="barCreate">
		<button onclick="window.open('barcodePrint.jsp','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');" id="createBarcode">
		바코드생성</button>
		</div>
		<br />
		<br />	
		<div>
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
				<td><input type="checkBox" /></td>
				<td><a href="">1</a></td>
				<td><a href="">p-1</a></td>
				<td><a href="">c-3</a></td>
				<td><a href="">p-123213</a></td>
				<td><a href="">2017/05/06</a></td>
				<td><a href="">null</a></td>
			</tr>
		</table>
		</div>
		</div>
	</form>
</body>
</html>