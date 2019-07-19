<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#depotMain{
		width:80%;
		height: 80%;"web/views/manager/board/boardmenegement.jsp"
		border:2px solid black;
	}
	tr{
		border:1px solid black;
	}
	#th{
		border:1px solid white;
		background:black;
		color:white;
		text-align:center;
	}
	#inOutButton{
		padding-left:73%;
	}
</style>
<body>
<%@ include file = "../hfl/managerHeader.jsp" %>
	<br />
	<h3 align="center">출고 관리</h3>
	<div id="inOutMain">
		<div id="inOutButton">
			<select name="search" id="search">
				<option value="userId">회원 아이디</option>
				<option value="location">위치관리번호</option>
			</select>
			<input type="text" />
			<input type="submit" value="검색" style="color:white;background:black;"/>
		</div>
		<div id="table Area">
			<table id="depotMain" align="center">
			<tr>
				<th id="th">번호</th>
				<th id="th">상품코드</th>
				<th id="th">회원아이디</th>
				<th id="th">위치관리번호</th>
				<th id="th">바코드넘버</th>
				<th id="th">적치 일자</th>
				<th id="th">출고 일자</th>
			</tr>
			</table>
		</div>
	</div>


</body>
</html>