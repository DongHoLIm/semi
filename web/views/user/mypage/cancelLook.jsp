<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.td_select {
	width:87%;
}
.searchBox {
   width: 100%;
   height:70%;
   padding: 2%;
   margin: 0 auto;
   text-align: center;
}

.searchdiv {
   width: 85%;
   height:70%;
   padding: 2%;
   margin: 0 auto;
   text-align: center;
   border:1px solid black;
}

.th_select {
	width:13%;
	margin-left:auto;
	margin-right:auto;
	
}


input[type=button] {
   border:1px solid black;
   background:#FFF;
}

.tt_div { 
	width:60%;
	height:100%;
	margin-left:auto;
	margin-right:auto;

}

.board1 {
	width: 80%;
	margin: auto;
	align: center;
	border-spacing: 10px;
}
}
.board1 tr td {
	text-align:center;
}

.rl {
	text-align:center;
}

.th_refund {
	text-align:center;
}

</style>
</head>
<body>
	<header><%@ include file="../hfl/header.jsp"%></header>
	<br>
	<header><%@ include file="../hfl/myPageList.jsp"%></header>

<div class="tt_div">
<div class="searchdiv">
  <table class="searchBox">
                   <!-- <caption style="font-size:20px;">주문조회</caption> -->
     <colgroup>
         <col width="123px">
         <col width="*">
     </colgroup>
     <h3>주문취소 조회</h3>
     <tbody>
         <tr>
             <th class="th_select">기간별 조회</th>
             <td class="td_select">
                <span class="chkbox2">
                       <input type="button" name="dateType" id="dateType3" value="1주일" onclick="setSearchDate('1w')"/>
                       <label for="dateType3"></label>
                   </span>
                   <span class="chkbox2">
                       <input type="button" name="dateType" id="dateType4" value="2주일" onclick="setSearchDate('2w')"/>
                       <label for="dateType4"></label>
                   </span>
                   <span class="chkbox2">
                       <input type="button" name="dateType" id="dateType5" value="1개월" onclick="setSearchDate('1m')"/>
                       <label for="dateType5"></label>
                   </span>
                   
          
           <!-- <div class="clearfix">
               시작일 -->
               <span class="dset">
                   <input type="text" class="datepicker inpType" name="startdate" id="searchStartDate" value="${adminBuildEnergyVo.startdate }" >               </span>
               <span class="demi">~</span>
               <!-- 종료일 -->
               <span class="dset">
                 <input type="text" class="datepicker inpType" name="enddate" id="searchEndDate" value="${adminBuildEnergyVo.enddate }" >
               </span>
               <span>
                   	<input type="button" name="selectDate" id="selectDate"  onclick="search1();" value="조회">
                   </span>
                   </td>
               </tr>
           <tbody>
       </table>
</div>
	<br>
		<div align=center>
			<table border="1" class="board1">
				<thead>
				<tr class="rl">
					<th class="th_refund">주문번호</th>
					<th class="th_refund">상품명</th>
					<th class="th_refund">상품금액</th>
					<th class="th_refund">결제상태</th>
				</tr>
				</thead>
				<tbody>
				<tr class="rl">
				<td>dd</td>
				<td>dd</td>
				<td>dd</td>
				<td>dd</td>
<%-- 				<% for(myPage m : rList) {%>
				<tr>
				<td><%=m.getOno() %></td>
				<td><%=m.getrDate() %></td>
				<td><%=m.getPname() %></td>
				<% String price = dc.format(m.getDtPay());%>
				<td><%=price %>원</td>
				<td><%=m.getRefundStatus() %></td>
			</tr>
			<% } %> --%>
			</tr>
			</tbody>
			</table>			
			</div>
		<br><%-- 
		<div class="pagingArea1" align="center">
			<button
				onclick="location.href = '<%=request.getContextPath()%>/refundList.mp?currentPage=1'"><</button>
			<%
				if (currentPage <= 1) {
			%>
			<button disabled><</button>
			<%
				} else {
			%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/refundList.mp?currentPage=<%=currentPage - 1%>'"><</button>
			<%
				}
			%>
			<%
				for (int p = startPage; p <= endPage; p++) {
					if (currentPage == p) {
			%>
			<button disabled><%=p%></button>
			<%
				} else {
			%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/refundList.mp?currentPage=<%=p%>'"><%=p%></button>
			<%
				}
				}
			%>


			<%
				if (currentPage >= maxPage) {
			%>
			<button disabled>></button>
			<%
				} else {
			%>
			<button
				onclick="location.hreh='<%=request.getContextPath()%>/refundList.mp?currentPage=<%=currentPage + 1%>'">></button>
			<%
				}
			%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/refundList.mp?currentPage=<%=maxPage%>'">>></button>
			</div> --%>
	</div>

	<br>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
</body>
</html>