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
	form{
		float:right;
	}
	#location{
		padding-right: 190px;	
	}
	#date{
		padding-right: 190px;
	}
</style>
<body>
	<%@ include file ="/views/manager/hfl/managerHeader.jsp" %>
	<br>
	<h2 align="center">창고현황</h2>
	<br />
	<div id="selectSearch">		
		<form action="">
			<select name="" id="selectBox" onchange="changeSearchBox();">
				<option class="A" value="locationNum">위치관리번호</option>
				<option class="A" value="barCode">상품코드</option>
				<option class="A" value="searchDate">적치 일자</option>
			</select>				
			<div id="location">
			<input type="text" />
			<button type="submit">검색</button>
			</div>
			<div id="date">
			<input type="date" />
			<button type="submit">검색</button>
			</div>
		</form> 
	</div>
	<script>
	$(function (){
		$("#date").hide();
	});	
	function changeSearchBox(){
			    var langSelect = document.getElementById("selectBox");
		     
			    // select element에서 선택된 option의 value가 저장된다.
			    var selectValue = langSelect.options[langSelect.selectedIndex].value;
			 	
			  if(selectValue=="searchDate"){
				  $("#location").hide();
				  $("#date").show();
			  }else{
				  $("#location").show();
				  $("#date").hide();
			  }
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
	
</body>
</html>