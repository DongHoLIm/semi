<%@page import="com.kh.bvengers.product.model.vo.CalculPageInfo"%>
<%@page import="com.kh.bvengers.product.model.vo.Calcul"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Calcul> list = (ArrayList<Calcul>) request.getAttribute("list");
	CalculPageInfo ci = (CalculPageInfo) request.getAttribute("ci");
	int listCount = ci.getListCount();
	int currentPage = ci.getCurrentPage();
	int maxPage = ci.getMaxPage();
	int startPage = ci.getStartPage();
	int endPage = ci.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#depotMain {
	width: 95%;
	height: 80%;
	border: 2px solid black;
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
	padding-left: 8%;
}

#inOutMain {
	border: 2px solid black;
	width: 80%;
	margin: 0 auto;
}

#table Area {
	align: center;
	width: 90%;
}

.th {
	background: black;
	color: white;
	text-align: center;
	border: 1px solid white;
}
</style>
<body>
	<%@ include file="../hfl/managerHeader.jsp"%>
	<br />
	<h2 align="center">정산내역 관리</h2>
	<div id="inOutMain">
		<br>
		<br>
		<div id="inOutButton" align="center">
		<form action="search.cal">
			<select name="category" style="width: 10%;">
				<option value="select">선택</option>
				<option value="wait">정산대기</option>
				<option value="success">정산완료</option>
				<option value="sellfail">환불처리</option>
			</select>
			<span> <input type="date" name="selectDate"/>
				<button type="submit"
					style="border-radius: 5px; background-color: black; color: white;">조회</button>
			</span>
		</form>
		</div>
		<br>
		<br>
		<div id="table Area">
			<table id="depotMain" align="center">
				<thead>
					<tr>
						<th class="th">No.</th><!-- 정산번호 -->
						<th class="th">거래번호</th>
						<th class="th">정산금액</th>
						<th class="th">회원번호</th>
						<th class="th">정산여부</th><!-- 1 : 정산 대기, 2: 정산완료, 3.환불처리 -->
						<th class="th">이력발생일자</th>
					</tr>
				</thead>
				<tbody align="center">
				<% int rowCount = 0;
					for(Calcul c : list){
				%>
					<tr>
						<input type="hidden" value="<%=rowCount%>" name="rowCount" id="rowCount" />
						<td><%= c.getAdjustNo() %></td>
						<td><%= c.getPayDtno() %></td>
						<td><%= c.getPrice() %></td>
						<td><%= c.getMemberNo() %></td>
						<%if(c.getAdjustDiv().equals("1")) {%>
						<td>정산대기</td>
						<%}else if(c.getAdjustDiv().equals("2")) {%>
						<td>정산완료</td>
						<%}else{ %>
						<td>환불처리</td>
						<%} %>
						
						<td><%= c.getAdjustDate() %></td>
						
						
					</tr>
				<% 	rowCount++;
					} 
				%>
			</tbody>
			</table>
			<br>
			<div class="pagingArea" align="center">
			<button type="button" onclick="location.href='<%=request.getContextPath()%>/selectCalculate?currentPage=1'"><<</button>
			
			<%if(currentPage <= 1){%>
				<button disabled><</button>
			<%}else{ %>
				<button type="button" onclick="location.href='<%=request.getContextPath()%>/selectCalculate?currentPage=<%=currentPage -1%>'"><</button>
			<%} %>
			
			<%for(int p = startPage; p <= endPage; p++){ 
				if(currentPage == p){
			%>
					<button type="button" disabled><%= p %></button>
				<%}else{ %>
					<button type="button" onclick="location.href='<%=request.getContextPath()%>/selectCalculate?currentPage=<%=p%>'"><%=p %></button>
			<%
				}
			}
			%>
		
			
			<%if(currentPage >= maxPage){ %>
				<button type="button" disabled>></button>
			<%}else{ %>
				<button type="button" onclick="location.href='<%=request.getContextPath()%>/selectCalculate?currentPage=<%=currentPage + 1 %>'">></button>
			<%} %>
			<button type="button" onclick="location.href='<%=request.getContextPath()%>/selectCalculate?currentPage=<%= maxPage%>'">>></button>
		</div>
			
			
			<br>
		</div>
	</div>


</body>
</html>