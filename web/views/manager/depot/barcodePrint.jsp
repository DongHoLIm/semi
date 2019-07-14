<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	#print-button{
		width:100%;
		
	}
</style>
</head>
<body>
	<form action="">
	<table id="depotMain" align="center">
		<caption>출력 내용 </caption>
		<tr>
		<td><br /></td>
		<td colspan="5"><button id="print-button" onclick="javaScript:window.print();">인쇄하기</button></td>
		</tr>	
			<tr>
				<th>번호</th>
				<th>상품코드</th>
				<th>위치관리번호</th>
				<th>바코드넘버</th>
				<th>적치 일자</th>
				<th>출고 일자</th>
			</tr>			
	</table>	
	</form>
</body>
</html>