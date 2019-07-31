<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#refundMain {
	width: 95%;
	height: 80%;
	border :2px solid black;
}

tr {
	border: 1px solid black;
}

#th {
	border: 1px solid white;
	background: black;
	color: white;
	text-align: center;
}

#inOutButton {
	padding-left:8%;
}
#inOutMain {
	border :2px solid black;
	width:80%;
	margin:0 auto;
}
#table Area{
align:center;
width:90%;
}
.th{
background:black;
color:white;
text-align:center;
border:1px solid white;
}
.od {
	text-align:center;
}
</style>
<body>
	<%@ include file="../hfl/managerHeader.jsp"%>
	<br />
	<h2 align="center">환불내역 관리</h2>
	<div id="inOutMain"><br><br>
		<!-- <div id="inOutButton" align="center">
			
		<select name="refundStatus" style="width:10%;">
			<option value="findPC">환불 대기</option>
			<option value="findNotebook">환불 완료</option>
		</select></div>< --><br>
		<div id="table Area">
			<table id="refundMain" align="center">
				<tr>
		<th class="th">No.</th>
		<th class="th">신청날짜</th>
		<th class="th">회원번호</th>
		<th class="th">검수여부</th>
		<th class="th">환불상태</th>
	</tr>
			<tr class="od">
					<td>주문번호</td>
					<td>신청날짜</td>
					<td>회원번호</td>
					<td>검수여부</td>
					<td>환불상태</td>
				</tr>
	
			</table><br><br>
		</div>
	</div>

		
</body>
</html>