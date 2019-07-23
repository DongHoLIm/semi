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
<style>
	tr{
		border:1px solid black;		
	}
	td{
		border:1px solid black;
		text-align:center;
		
	}
	#th{
		border:1px solid white;
		text-align:center;
		background:black;
		color:white;
	}
	#depotMain{
		width:80%;
		height: 80%;
		border:2px solid black;
	}
	#createBarcode{
		float:right;
		margin-right: 140px;
	}
</style>
</head>
<body>
<%@ include file ="/views/manager/hfl/managerHeader.jsp" %>
<br />
	<h2 align="center">바코드 생성</h2>
	<form action="">
	<div id ="barcodeMain">
		<div id="barCreate">
		<button onclick="barcodePrint();" id="createBarcode"
		style="color:white;background:black;">
		바코드생성</button>
		</div>
		<br />
		<br />	
		<div>
		<table id="depotMain" align="center">
			<tr>
				<th id="th"></th>
				<th id="th">번호</th>
				<th id="th">상품코드</th>
				<th id="th">상품명</th>
				<th id="th">위치관리번호</th>
				<th id="th">적치 일자</th>
				<th id="th">출고 일자</th>
			</tr>
			<%for(Depot d :list) {%>
			<tr>
				<td><input type="checkBox" id="check" value="<%=d.getProductCode() %>"/></td>
				<td><label for=""><%=d.getProductNumber() %></label></td>
				<td><a href="" id="productCode"><%=d.getProductCode() %></a></td>
				<td><a href=""><%=d.getProductName() %></a></td>
				<td><a href=""><%=d.getLocationCode() %></a></td>
				<td><a href=""><%=d.getCheckDate() %></a></td>
				<td><a href=""><%=d.getReleaseDate() %></a></td>
			</tr>
			<%} %>
		</table>
		<script>			
			function barcodePrint(){
				var code = "";
				var i = 0;
				$("#check:checked").each(function(index){			 
					code+=$(this).val()+",";																
				});				
				var url = "/sp/views/manager/depot/barcodePrint.jsp?value="+code;
				window.open(url,'바코드생성','width=430,height=500,location=no,status=no,scrollbars=yes');		
				
			}
		</script>
		</div>
		</div>
	</form>
</body>
</html>