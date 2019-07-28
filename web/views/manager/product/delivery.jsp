<%@page import="com.kh.bvengers.board.model.vo.Calculate"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Calculate> list = (ArrayList<Calculate>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
#sec1 {
	width: 100%;
	height: 100%;
	padding-right: 20%;
	padding-left: 20%;
	margin: auto;
	align:center;
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
	width: 100%;
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
.gumehaukjung{
align:center;
}
#numberBox{
	margin-left: 40%;
}
</style>
</head>
<header><%@ include file="../hfl/managerHeader.jsp" %></header>
<body>
<form>
	<section id="sec1">
			<br />
		
		
			<h3 align="center">구매내역 조회</h3>
			<table class="board">
					<tr class="row0">
						<th>번호</th>
						<th>판매자ID</th>
						<th>판매 상품</th>
						<th>구매자ID</th>
						<th>주문날짜</th>
						<th>발생일자</th>
						<th>진행상태</th>
						<th>선택</th>
					</tr>
				<tbody>
					<% for(Calculate c : list){ %>
				<tr>
					<input type="hidden" value="<%= c.getDeliveryNo() %>">
					<td><%= c.getOrderNo() %></td>
					<td><%= c.getSellerId() %></td>
					<td><%= c.getPostsTitle() %></td>
					<td><%= c.getBuyerId() %></td>
					<td><%= c.getOrderDate() %></td>
					<td><%= c.getCalculateDate() %></td>
					<td>
						<!-- 검수테이블 id를 검색 후 검색결과가 있을 경우 정산완료, null일 경우 아래 if문 실행하도록 이후에 보수 -->
						<% if(c.getDeliveryStatus().equals("1")){%>
							주문완료
						<%}else if(c.getDeliveryStatus().equals("2")){ %>
							배송중
						<%}else if(c.getDeliveryStatus().equals("3")){ %>
							구매확정
						<%} %>
					</td>
					<td><input type="checkbox" name="selectTr"/></td>
				</tr>
				<% } %>
				</tbody>
			</table>
				<div id="numberBox"><%@ include file="../hfl/pagination.jsp" %></div>
		<div id="area">
			<h3 align="center">배송상태</h3>
			<table id="deliTable">
				<tr>
				   <td class="deliReady"><img src="/sp/images/gumsu.png" alt="" />
						<br />
						<p>
							검수중(<%
							int gumsu = 0;
						%><%=gumsu%>)
						</p></td>
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

		<div>
			<br />
			
			<h3 align="center">상품 조회</h3>
			<table class="board">
				<tr class="row0">
				<thead>
					<th>번호</th>
					<th>판매자 아이디</th>
					<th>판매 상품</th>
					<th>구매자 아이디</th>
					<th>검수 유무</th><!-- 체크박스로 넣으면 되삼. -->
					<th>주문날짜</th>
					<th>진행 상태</th>
				</thead>
				</tr>
				
			</table>
		</div>
		
				<div id="numberBox"><%@ include file="../hfl/pagination.jsp" %></div>
	</section>
		
</form>

	<br>
	<footer><%@ include file="../hfl/footer.jsp" %></footer>

</body>
</html>