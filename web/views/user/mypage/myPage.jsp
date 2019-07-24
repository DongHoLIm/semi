<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.* , com.kh.bvengers.user.myPage.model.vo.*"%>
<%
	ArrayList<myPage> mplist = (ArrayList<myPage>) request.getAttribute("mplist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#sec1 {
	width: 100%;
	height: 100%;
	padding-right: 20%;
	padding-left: 20%;
	margin: auto;
}

#area {
	width: 100%;
	padding: 2%;
	margin: 0 auto;
	text-align: center;
}

#deliTable {
	align: center;
}

#deliTable tr {
	align: center;
}

#deliTable tr td {
	align: center;
}

#deliTable tr td img {
	width: 30%;
	align: center;
}

.board {
	width: 80%;
	margin: auto;
	align: center;
	border-spacing: 10px;
}

.row0 {
	background: #eee;
	margin: auto;
}

.row1 {
	border-top: 2px solid #555;
}

.row2, .row3, .row4, .row, .row6, .row7, .row8, .row9, .row10 {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.pageNo {
	margin: auto;
}
</style>
</head>
<body>
	<header><%@ include file="../hfl/header.jsp"%></header>
	<br>
	<header><%@ include file="../hfl/myPageList.jsp"%></header>

	<section id="sec1">
		<div id="area">
			<h3 align="center">배송상태</h3>
			<table id="deliTable">
				<tr>
					<td class="deliReady"><img src="/sp/images/box.png" alt="" />
						<br />
						<p>
							배송 준비중(<%
							int ready = 0;
						%><%=ready%>)
						</p></td>
					<td class="deliStart"><img src="/sp/images/delivery-truck.png"
						alt="" /> <br />
						<p>
							배송 시작(<%
							int start = 0;
						%><%=start%>)
						</p></td>
					<td class="deliSuccess"><img src="/sp/images/order.png" alt="" />
						<br />
						<p>
							배송 완료(<%
							int success = 0;
						%><%=success%>)
						</p></td>
				</tr>
			</table>
		</div>
		
		
		
	<form action="" method="post">
		<div>
			<br />
			<h3 align="center">주문 현황</h3>
			<table class="board">
			<tbody></tbody>
				<tr class="row0">
					<th>주문번호</th>
					<th>상품명</th>
					<th>배송여부</th>
					<th>주문날짜</th>
				</tr>
				<% for(myPage m : mplist){%>
				<tr>
					<td><%=m.getOno() %></td>
					<td><%=m.getPname()%></td>
					<td><%=m.getDstatus()%></td>
					<td><%=m.getoDate()%></td>
				</tr>
				<%}%>
			</table>
		</div>
		</form>
		<div align="center">	
			<ul class="pagination" align="center">
			  <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
			  <li class="page-item"><a class="page-link" href="#">1</a></li>
			  <li class="page-item"><a class="page-link" href="#">2</a></li>
			  <li class="page-item"><a class="page-link" href="#">3</a></li>
			  <li class="page-item"><a class="page-link" href="#">다음</a></li>
			</ul>
		</div>

	</section>

	<br>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
<script>
<%-- 	$(function(){
		<% for(myPage m : mplist){%>
		
		 var $tableBody = $("table tbody");
		 
		 var $tr = $("<tr>");
		 var $onoTd = $("<td>").text('<%=m.getOno()%>');
		 var $pnameTd = $("<td>").text('<%=m.getPname()%>');
		 var $dstatusTd = $("<td>").text('<%=m.getDstatus()%>');
		 var $ddateTd = $("<td>").text('<%=m.getoDate()%>');
		 

		 $tr.append($onoTd);
		 $tr.append($pnameTd);
		 $tr.append($dstatusTd);
		 $tr.append($ddateTd);
		 
		 $tableBody.append($tr);
		<%}%>
	}); --%>
</script>
</body>
</html>