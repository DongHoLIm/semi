<%@page import="com.kh.bvengers.user.member.model.vo.Seller"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Seller s = (Seller) request.getAttribute("s");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#sellerInfoTable {
	height: 420px;
	width: 90%;
	text-align:center;
	margin : 0 auto;
}

#sellerInfoTable .tableCells {
	border: 1px solid red;
}

#sellerInfoTable th {
	width: 30%;
	background: black;
	color: white;
	border : 1px solid white;
}
#closeBtn{
	background: black;
	color: white;
	width: 20%;
	height: 50px;
}
</style>
</head>
<body>
	<header><%@ include file="../hfl/header.jsp"%></header>
	<div>
		<table id="sellerInfoTable">
			<tr>
				<th>판매자 아이디 :</th>
				<td class="tableCells"><%=s.getId()%></td>
			</tr>
			<tr>
				<th>판매자 이름 :</th>
				<td class="tableCells"><%=s.getName()%></td>
			</tr>
			<tr>
				<th>가입일 :</th>
				<td class="tableCells"><%=s.getEnrollDate()%></td>
			</tr>
			<tr>
				<th>판매 횟수 :</th>
				<td class="tableCells"><%=s.getSellCount()%></td>
			</tr>
			<tr>
				<th>판매 등급 :</th>
				<td class="tableCells"><%=s.getGrade()%></td>
			</tr>
			<tr>
				<td colspan="2" id="closeTd"><input type="button" value="닫기"
					onclick="window.close();" id="closeBtn" /></td>
			</tr>
		</table>

	</div>
</body>
</html>