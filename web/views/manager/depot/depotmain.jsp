<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.bvengers.manager.depot.model.vo.*"%>
    <%
    	ArrayList<Depot> list = (ArrayList<Depot>) request.getAttribute("list");
    	DepotPageInfo pi  = (DepotPageInfo) request.getAttribute("pi");
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
</head>

<style>
	#depotMain{
		width:80%;
		height: 80%;
		border:2px solid black;
	}
	tr{
		border:1px solid black;		
	}
	td{
		border:1px solid black;
		text-align:center;
		
	}
	#th3{
		border:1px solid black;
		text-align: center;
		background: black;
		color:white;
	}
	#location{
		padding-right: 190px;	
	}
	#date{
		padding-right: 190px;
	}
	#searchProductCode{
		padding-right: 190px;
	}
	#selectSearch{
		width: 100%;
		margin: 0 auto;
		height: 12%;
		
	}
</style>
<body>
	<%@ include file ="/views/manager/hfl/managerHeader.jsp" %>
	<br>
	<h2 align="center">창고현황</h2>
	<br />
	<div id="selectSearch" align="center">		
		<form action="">
			<table id="depotSearch" >
				<tr>
					<th id="th3">창고 위치</th>
					<th id="th3">적치 일자</th>
					<th id="th3">출고 일자</th>
					<th id="th3">상품코드</th>
				    <th id="th3"></th>
				</tr>
				<tr>
					<td><select name="" id="" style="width: 200px;">
							<option value="">A1</option>
							<option value="">A2</option>
							<option value="">A3</option>
							<option value="">B1</option>
							<option value="">B2</option>
							<option value="">B3</option>
							<option value="">C1</option>
							<option value="">C2</option>
							<option value="">C3</option>
						</select>
					</td>
					<td><input type="date" style="width: 200px;"/></td>
					<td><input type="date" style="width: 200px;"/></td>
					<td><input type="text" style="width: 200px;"/></td>
					<td><button type="button" onclick="search();">검색</button></td>
				</tr>
			</table>
		</form> 
	</div>
	<script>
		function search(){
			
		}
	</script>	
	<br>
	<br><br>
		<table id="depotMain" align="center">
			<tr >
				<th id="th3">번호</th>
				<th id="th3">상품코드</th>
				<th id="th3">상품명</th>
				<th id="th3">위치관리번호</th>
				<th id="th3">적치 일자</th>
				<th id="th3">출고 일자</th>
			</tr>
			<%for(Depot d :list) {%>
			<tr>
				<td><label for=""><%=d.getProductNumber() %></label></td>
				<td><a href=""><%=d.getProductCode() %></a></td>
				<td><a href=""><%=d.getProductName() %></a></td>
				<td><a href=""><%=d.getLocationCode() %></a></td>
				<td><a href=""><%=d.getCheckDate() %></a></td>
				<td><a href=""><%=d.getReleaseDate() %></a></td>
			</tr>
			<%} %>
		</table>
		<br>
	<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/listall.dp?currentPage=1'"><<</button>
			
			<% if(currentPage <= 1){ %>
			<button disabled><</button>
			<% }else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/listall.dp?currentPage=<%=currentPage - 1%>'"> < </button>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
				if(currentPage == p){
			%>
					<button disabled><%= p %></button>
			<% } else { %>
					<button onclick="location.href='<%=request.getContextPath()%>/listall.dp?currentPage=<%=p%>'"><%= p %></button>
			<% 
				}
			   } 
			%>
			
			<% if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<% }else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/listall.dp?currentPage=<%=currentPage + 1 %>'">></button>
			<% } %>

			<button onclick="location.href='<%=request.getContextPath()%>/listall.dp?currentPage=<%=maxPage%>'">>></button>
		</div>
</body>
</html>