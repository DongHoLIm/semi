<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.bvengers.manager.depot.model.vo.*"%>
    <%
    	ArrayList <Depot> list = (ArrayList <Depot>) request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#depotMain{
		width:80%;
		height: 80%;
		border:2px solid black;
	}
	tr{
		border:1px solid black;
	}
	#th{
		border:1px solid white;
		background:black;
		text-align:center;
		color:white;
	}
	td{
		text-align:center;
	}
	#inOutButton{
		padding-left:73%;
	}
</style>
<body>
<%@ include file = "../hfl/managerHeader.jsp" %>
	<br />
	<h3 align="center">입고 관리</h3>
	<div id="inOutMain">
		<div id="inOutButton">
			<select name="search" id="search">
				<option value="userId">회원 아이디</option>
				<option value="location">위치관리번호</option>
			</select>
			<input type="text" />
			<input type="submit" style="color:white;background:black;" value="검색"/>
		</div>
		<div id="table Area">
			<table id="depotMain" align="center">
			<tr>
				<th id="th">번호</th>
				<th id="th">상품코드</th>
				<th id="th">회원아이디</th>
				<th id="th">위치관리번호</th>
				<th id="th">검수상태</th>
				<th id="th">적치 일자</th>
				<th id="th">출고여부</th>
			</tr>
			<%for(Depot d :list){ %>
				<tr>
					<td><%=d.getProductNumber() %></td>
					<td><%=d.getProductCode() %></td>
					<td><%=d.getSelerId() %></td>
					<td><%=d.getLocationCode() %></td>
					<td><%=d.getCompletStatus() %></td>
					<td><%=d.getCheckDate() %></td>
					<td><%if(d.getReleaseDate()==null){ %>
							<button id="relesDate">출고 요청</button>
						<%}else{ %>
							<label for=""><%=d.getReleaseDate() %></label>
						<%} %>
					</td>
				</tr>
			<%} %>
			</table>

		</div>
	</div>

	<script>
		$(function() {
			// 1번
			$("#nameBtn").click(function() {
				var name = $("#myName").val();

				$.ajax({
					url : "<%=request.getContextPath()%>/test.do",
					data : {
						name : name
					},
					type : "get",
					success : function(data) {
						console.log("서버 전송 성공!");
					},
					error : function(err) {
						console.log("서버 전송 실패!");
					},
					complete : function(data) {
						console.log("난.. 무조건 호출되는 노예야..");
					}
				});
			});
		});
	</script>
	<h1 align="center">JQuery를 이용한 Ajax 테스트</h1>
	<h3>1. 버튼 선택시 전송 값 서버에 출력</h3>
	<label>1. 이름 : </label>
	<input type="text" id="myName" />
	<button id="nameBtn">이름 보내기</button>
</body>
</html>