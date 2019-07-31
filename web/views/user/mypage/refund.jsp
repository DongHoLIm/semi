<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type=button]{
	border:1px solid black;
	background:#FFF;
}


.th_refund {
	text-align:center;
}
tr {
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
	margin-top:5%;
	margin-left:auto;
	margin-right:auto;
	width: 80%;
	height:70%;
	padding: 2%;
	margin: 0 auto;
	text-align: center;
	background-color:#FFF;
	border:1px solid black;
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

.board2 {
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

.page-control {
	margin-top:5%;
}
</style>
</head>
<body>
	<header><%@ include file="../hfl/header.jsp"%></header>
	<br>
	<header><%@ include file="../hfl/myPageList.jsp"%></header>

	<section id="sec1">
		<div id="area">
			<h3 style="font-weight: bold">환불 내역</h3>

		<div class="date-select" align="center">
			<br> <span style="font-weight: bold">기간별조회</span> <span>&nbsp;&nbsp;&nbsp;<input
				type="button" value="1주일">&nbsp;
			</span> &nbsp;<input type="button" value="15일">&nbsp; &nbsp;<input
				type="button" value="1개월">&nbsp; <input type="date">
			- <input type="date"><br>
		</div>
		</div>
	<br>
		<div align=center>
			<table border="1" class = "board">
				<tr>
					<th class="th_refund">주문번호</th>
					<th class="th_refund">신청날짜</th>
					<th class="th_refund">상품명</th>
					<th class="th_refund">환불금액</th>
					<th class="th_refund">상태</th>
				</tr>
				<tr>
				<td>안</td>
				<td>녕</td>
				<td>하</td>
				<td>신</td>
			</tr>
			</table>
			
			
			<div class = "pagingArea" align ="center" >
      <button onclick = "location.href = '<%=request.getContextPath()%>/selectNotice.no?currentPage=1'"><</button>
      <%if(currentPage <= 1) {%>
      <button disabled><</button>
      <%} else{%>
   <button onclick = "location.href='<%=request.getContextPath()%>/selectNotice.no?currentPage=<%=currentPage-1%>'"><</button>
      <%}

      %>
         <%for (int p = startPage; p <= endPage; p++) {
            if(currentPage == p){
         %>
            <button disabled><%= p %></button>
         <%} else{ %>
               <button onclick = "location.href='<%=request.getContextPath()%>/selectNotice.no?currentPage=<%=p%>'"><%= p %></button>
         <% }
         }
         %>


         <%if(currentPage >= maxPage){ %>
         <button disabled>></button>
         <%}else{ %>
         <button onclick ="location.hreh='<%=request.getContextPath()%>/selectNotice.no?currentPage=<%=currentPage + 1%>'">></button>
         <%} %>
         <button onclick = "location.href='<%=request.getContextPath()%>/selectNotice.no?currentPage=<%=maxPage%>'">>></button>

      </div>
      
      
		</div>
		<br><br><br><br>
		
		
		<div id="area">
			<h3 style="font-weight: bold">정산 내역</h3>

		<div class="date-select" align="center">
		<br> <span style="font-weight: bold">기간별조회</span> <span>&nbsp;&nbsp;&nbsp;<input
			type="button" value="1주일">&nbsp;
		</span> &nbsp;<input type="button" value="15일">&nbsp; &nbsp;<input
			type="button" value="1개월">&nbsp; <input type="date">
		- <input type="date"><br> <br>
	</div>
		</div>
		<br>
		<div align=center>
				<table border="1" class = "board2"> 
			<tr>
				<th class="th_refund">정산완료일</th>
				<th class="th_refund">정산금액</th>
				<th class="th_refund">입금은행</th>
				<th class="th_refund">계좌번호</th>
				<th class="th_refund">예금주</th>
			</tr>
			<tr>
				<td>안</td>
				<td>녕</td>
				<td>하</td>
				<td>신</td>
				<td>가</td>
			</tr>
		</table>
		</div>
	</section>


	<br>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
</body>
</html>