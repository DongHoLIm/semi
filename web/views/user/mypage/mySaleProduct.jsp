<%@page import="com.kh.bvengers.user.myPage.model.vo.MyPagePageInfo"%>
<%@page import="com.kh.bvengers.user.myPage.model.vo.myPage"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<myPage> sList = (ArrayList<myPage>) request.getAttribute("sList");
	MyPagePageInfo pi = (MyPagePageInfo) request.getAttribute("pi");
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
<style>

input[type=button] {
   border:1px solid #ccc;
   background:#FFF;
}

.t_div {
	width:60%;
	height:100%;
	margin-left:auto;
	margin-right:auto;

}
#pagingArea {
	width:60%;
	margin-top:50px;
	margin-left:auto;
	margin-right:auto;
}

.pagingArea > button {
	background:#FFF;
	border: 1px solid black;

}


#sec1 {
	width: 100%;
	height: 100%;
	padding-right: 20%;
	padding-left: 20%;
	margin:0 auto;
}



.board {
	width: 80%;
	margin: auto;
	align: center;
	
	border-radius:5px;
	border-collapse: collapse;
    line-height: 1.5;
}

.board th {

    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #FFF;
}

.board td {

    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

.board thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #036;/* #369; */
    border-bottom: 3px solid #036;
}


.th1 {
	text-align:center;
	
}
.od {
	text-align:center;
}
</style>
</head>
<body>
	<!-- header 영역 -->
	<header><%@ include file="../hfl/header.jsp" %></header>
	<header><%@ include file="../hfl/myPageList.jsp"%></header>
	
	
		<div class="t_div">
			<br />
			<h2 align="center">나의 판매현황</h2><br><br>
			<table class="board">
				<thead>
				<tr>
					<th class="th1">게시글 번호</th>
					<th class="th1">상품명</th>
					<th class="th1">판매여부</th>
					<th class="th1">정산여부</th>
					<th class="th1">남은 보관일</th>
				</tr>
				</thead>
				<tbody>
				<% for(myPage m : sList){%>
				<tr class="od">
					<td><%=m.getPid() %></td>
					<td><%=m.getPname() %></td>
					<td><%=m.getPayStatus()%></td>
					<td><%=m.getaStatus() %></td>
					<td><%=m.getkDate() %>일</td>
				</tr>
				<%}%>
				</tbody>
			</table>
		</div>
<%-- 페이징처리 --%>
<div id="pagingArea">
		<div class="pagingArea" align="center">
			<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/mySaleProduct.mp?currentPage=1'"><<</button>

			<% if(currentPage <= 1){ %>
			<button disabled><</button>
			<% }else { %>
			<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/mySaleProduct.mp?currentPage=<%=currentPage - 1%>'"><</button>
			<% } %>

			<% for(int p = startPage; p <= endPage; p++){
				if(currentPage == p){ %>
					<button class="btn_paging" disabled><%= p %></button>
			<% } else { %>
					<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/mySaleProduct.mp?currentPage=<%=p%>'"><%= p %></button>
			<%
				}
			   }
			%>

			<% if(currentPage >= maxPage){ %>
			<button class="btn_paging" disabled>></button>
			<% }else{ %>
			<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/mySaleProduct.mp?currentPage=<%=currentPage + 1 %>'">></button>
			<% } %>
			<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/mySaleProduct.mp?currentPage=<%=maxPage%>'">>></button>
		</div>
		</div>
		
	<footer><%@ include file="../hfl/footer.jsp" %></footer>
</body>
</html>























