<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.bvengers.product.model.vo.Refund"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.bvengers.product.model.vo.CalculPageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   ArrayList<Refund> rList = (ArrayList<Refund>)request.getAttribute("rList");
   CalculPageInfo pi = (CalculPageInfo)request.getAttribute("pi");
   int listCount = pi.getListCount();
   int currentPage = pi.getCurrentPage();
   int maxPage = pi.getMaxPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();

   DecimalFormat dc = new DecimalFormat("###,###,###,###");


%>	

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.pagingArea > button {
	background:#FFF;
	border: 1px solid black;

}

#refundMain {
	width: 95%;
	height: 80%;
	border :2px solid black;
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
	padding-left:8%;
}
#inOutMain {
	border :2px solid black;
	width:80%;
	margin:0 auto;
}
#table Area{
align:center;
width:90%;
}
.th{
background:black;
color:white;
text-align:center;
border:1px solid white;
}
.od {
	text-align:center;
}

.refundMain tr td {
	border:1px solid black;
}
</style>
<body>
	<%@ include file="../hfl/managerHeader.jsp"%>
	<br />
	<h2 align="center">환불내역 관리</h2>
	<div id="inOutMain"><br><br>
		<!-- <div id="inOutButton" align="center">
			
		<select name="refundStatus" style="width:10%;">
			<option value="findPC">환불 대기</option>
			<option value="findNotebook">환불 완료</option>
		</select></div>< --><br>
		<div id="table Area">
			<table id="refundMain" align="center">
				<tr>
		<th class="th">주문번호</th>
		<th class="th">신청날짜</th>
		<th class="th">회원번호</th>
		<th class="th">상품코드</th>
		<th class="th">검수여부</th>
		<th class="th">환불상태</th>
	</tr>
		<% for(Refund r : rList) {%>
			<tr class="od">
					<input type="hidden" id="pno" value="<%=r.getPno()%>">
					<input type="hidden" id="pcode" value="<%=r.getpCode()%>">
					<td><%=r.getOno() %></td>
					<td><%=r.getrDate() %></td>
					<td><%=r.getMno() %></td>
					<td><%=r.getPno() %></td>
					<td><button class="btn_1" value="1">통과</button><button class="btn_2" value="2">미통과</button></td>
					<td><%=r.getrStatus() %></td>
				</tr>
		<% } %>
			</table><br><br>
		</div>
		
		
	<div class = "pagingArea" align ="center" >
      <button onclick = "location.href = '<%=request.getContextPath()%>/refundProduct.mp?currentPage1=1'"><<</button>
      <%if(currentPage <= 1) {%>
      <button disabled><</button>
      <%} else{%>
   <button onclick = "location.href='<%=request.getContextPath()%>/refundProduct.mp?currentPage1=<%=currentPage-1%>'"><</button>
      <%}%>
         <%for (int p = startPage; p <= endPage; p++) {
            if(currentPage == p){
         %>
            <button disabled><%= p %></button>
         <%} else{ %>
               <button onclick = "location.href='<%=request.getContextPath()%>/refundProduct.mp?currentPage1=<%=p%>'"><%= p %></button>
         <% }
         }
         %>


         <%if(currentPage >= maxPage){ %>
         <button disabled>></button>
         <%}else{ %>
         <button onclick ="location.hreh='<%=request.getContextPath()%>/refundProduct.mp?currentPage1=<%=currentPage + 1%>'">></button>
         <%} %>
         <button onclick = "location.href='<%=request.getContextPath()%>/refundProduct.mp?currentPage1=<%=maxPage%>'">>></button>

      </div>
	</div>
	
<script>

$(".btn_1").click(function(){ 
	var pass = $(this).val();
	var pno = $("#pno").val();
	var pcode = $("#pcode").val();
 	location.href='<%=request.getContextPath()%>/refundChange.mp?pass='+pass+'&&pno='+pno+'&&pcode='+pcode;
 	console.log(pass);
 	console.log(pno);
 	console.log(pcode);
 	
 });
 
$(".btn_2").click(function(){ 
	var pass = $(this).val();
	var pno = $("#pno").val();
	var pcode = $("#pcode").val();
	console.log(pass);
	console.log(pno);
	console.log(pcode);
	location.href='<%=request.getContextPath()%>/refundChange.mp?pass='+pass+'&&pno='+pno+'&&pcode='+pcode;
 });
 
</script>

		
</body>
</html>