<%@page import="com.kh.bvengers.user.myPage.model.vo.myPagePageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kh.bvengers.user.myPage.model.vo.*"%>
<%

	ArrayList<myPage> olList = (ArrayList<myPage>) request.getAttribute("olList");
	ArrayList<String> ss = (ArrayList<String>) request.getAttribute("ss");
	myPagePageInfo pi = (myPagePageInfo) request.getAttribute("pi");
	String status = (String) request.getAttribute("status");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>

.pagingArea {
	margin-top:50px;
}

.pagingArea > button {
	background:#FFF;
	border: 1px solid black;
	
}
input[type=button]{
	border:1px solid black;
	background:#FFF;
}
#ip_status {
	border:none;
	text-align:center;
}

.th_orderLook {
	text-align:center;
}

#sec1 {
	width: 100%;
	height: 100%;
	padding-right: 20%;
	padding-left: 20%;
	margin: auto;
}

#area {
	width: 80%;
	height:70%;
	padding: 2%;
	margin: 0 auto;
	text-align: center;
	border:1px solid black;
}

#deliTable {
	align: center;
}

#deliTable tr {
	text-align:center;
}

#deliTable tr td {
	text-align:center;
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

tr > th, tr>td{
	width: 25%;
	margin: auto;
	text-align:center;
	border-spacing: 10px;
}
.page-control {
	margin-top:10%;
}


</style>
</head>
<body>
	<header><%@ include file="../hfl/header.jsp"%></header>
	<br><br>
	<header><%@ include file="../hfl/myPageList.jsp"%></header>

	<section id="sec1">
		<div id="area">
			<h3 style="font-weight: bold">주문조회</h3>

		<div class="date-select" align="center">
			<br> <span style="font-weight: bold">기간별조회</span> <span>&nbsp;&nbsp;&nbsp;<input
				type="button" value="1주일">&nbsp;
			</span> &nbsp;<input type="button" value="15일">&nbsp; &nbsp;<input
				type="button" value="1개월">&nbsp; <input type="date">
			- <input type="date"><br> <br>
		</div>
		</div>

		<div >
			<br />

			<table border="1" align = "center" class = "board">
				<tr>
					<th class="th_orderLook">주문일자</th>
					<th class="th_orderLook">상품정보</th>
					<th class="th_orderLook">주문상태</th>
				</tr>
				<% for(myPage p : olList){%>
				<tr class="">
					<td><%=p.getoDate() %><br><%=p.getOno() %><br><input type="button" onclick="<%=request.getContextPath()%>/orderDetails.jsp'" value="주문상세"></td>
					<td><%=p.getPname()%></td>
					<td><%=status%> <%= ss %></td>
				</tr>
				<%}%>
			</table>
		</div>
<%-- 페이징처리 --%>
		<div class="pagingArea" align="center">
			<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/orderLook.mp?currentPage=1'"><<</button>
			
			<% if(currentPage <= 1){ %>
			<button class="btn_paging" disabled><</button>
			<% }else { %>
			<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/orderLook.mp?currentPage=<%=currentPage - 1%>'"><</button>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
				if(currentPage == p){
			%>
					<button class="btn_paging" disabled><%= p %></button>
			<% } else { %>
					<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/orderLook.mp?currentPage=<%=p%>'"><%= p %></button>
			<% 
				}
			   } 
			%>
			
			<% if(currentPage >= maxPage){ %>
			<button class="btn_paging" disabled>></button>
			<% }else{ %>
			<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/orderLook.mp?currentPage=<%=currentPage + 1 %>'">></button>
			<% } %>

			<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/orderLook.mp?currentPage=<%=maxPage%>'">>></button>
		</div>
	</section>

	<br>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
</body>
</html>