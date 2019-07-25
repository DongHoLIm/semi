<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.bvengers.manager.depot.model.vo.*"%>
  <%
  	ArrayList<Depot> list = (ArrayList<Depot>) request.getAttribute("list");
  %>  
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
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
	#th3{
		border:1px solid white;
		text-align:center;
		background: black;
		color:white;
	}
	td{
		border: 1px solid black;
		text-align:center;
	}
	#searchButton{
		padding-left:73%;
	}
	button{
	background:black;
	
	}
</style>
<body>
<%@ include file = "../hfl/managerHeader.jsp" %>
	<br />
	<h3 align="center">검수요청 관리</h3>
		<br />
		<div id="searchButton">
			<form action="">
				<select name="check" id="check" onchange="changeSearchBox();">
					<option value="location">위치관리번호</option>
					<option value="date">검수요청일자</option>
					<option value="status">검수진행상태</option>
				</select>
				<div id="locationNum">
					<input type="text" name="searchCheck" id="searchCheck"/>
					<button type="submit" style="color:white;" >검색</button>
				</div>
				<div id="checkDate">
					<input type="date" />
					<button type="submit" style="color:white;">검색</button>
				</div>
				<div id="checkStatus">
					<select name="" id="">
						<option value="">검수요청</option>
						<option value="">검수중</option>
						<option value="">검수완료</option>
					</select>
					<button type="submit" style="color:white;">검색</button>
				</div>
			</form>	
			<script>
				$(function(){
					$("#checkDate").hide();
					$("#checkStatus").hide();
				});
				function changeSearchBox(){
					var langSelect = document.getElementById("check");
					
					var selectVal = langSelect.options[langSelect.selectedIndex].value;
					
					if(selectVal=="location"){
						$("#locationNum").show();
						$("#checkDate").hide();
						$("#checkStatus").hide();
					}else if(selectVal=="date"){
						$("#locationNum").hide();
						$("#checkDate").show();
						$("#checkStatus").hide();
					}else{
						$("#locationNum").hide();
						$("#checkDate").hide();
						$("#checkStatus").show();
					}
						
				}
			</script>
		</div>
		<br />
	<div id="checkMain">
		<div id="table Area">
			
			<table id="depotMain" align="center">
			<tr>
				<th id="th3">번호</th>
				<th id="th3">상품코드</th>
				<th id="th3">카테고리</th>
				<th id="th3">상품명</th>			 
				<th id="th3">검수 요청일자</th>
				<th id="th3">검수진행상태</th>
			</tr>
			<%for(Depot d :list) {%>
			<tr>
				<td><%=d.getProductNumber() %></td>
				<td><%=d.getProductCode() %></td>
				<td hidden><input type="hidden" value="<%=d.getProductCode() %>" name="updateProduct" /></td>
				<td><%=d.getProductCate() %></td>
				<td><%=d.getProductName() %></td>
				<td><%=d.getCheckDate() %></td>
				<td><%if(d.getCheckStatus().equals("1")){ %>
						<button onclick="location.href='<%=request.getContextPath()%>/views/manager/depot/depotCheck.jsp?value=<%=d.getProductCode() %>,<%=d.getProductName() %>,<%=d.getProductCate() %>'" style="color:white">검수요청</button>
					<%}else if(d.getCheckStatus().equals("2")) {%>
						<button onclick="location.href='<%=request.getContextPath()%>/views/manager/depot/depotCheck.jsp?value=<%=d.getProductCode() %>,<%=d.getProductName() %>,<%=d.getProductCate() %>'" style="color:white">검수중</button>
					<%}else{ %>
						<label for="">검수완료</label>
						<button onclick="location.href='<%=request.getContextPath()%>/views/manager/depot/depotCheck.jsp?value=<%=d.getProductCode() %>,<%=d.getProductName() %>,<%=d.getProductCate() %>'" style="color:white">수정</button>
					<%} %>
				</td>
			</tr>	
			<%} %>
			
			</table>
		</div>
	</div>
	<script>
		function update(){
			
		}
	</script>

</body>
</html>