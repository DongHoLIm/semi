<%@ page import="com.kh.bvengers.user.myPage.model.vo.MyPagePageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kh.bvengers.user.myPage.model.vo.*"%>
<%

	ArrayList<myPage> olList = (ArrayList<myPage>) request.getAttribute("olList");
	/* request.setAttribute("olList", olList); */
	String status = "";
	String page2 = "";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.tt_div { 
	width:60%;
	height:100%;
	margin-left:auto;
	margin-right:auto;

}

.t_div {
	width:100%;
	height:70%;
	margin: 0 auto;
	text-align: center;
	
}

.pagingArea {
	margin-top:50px;
}

.pagingArea > button {
	background:#FFF;
	border: 1px solid black;
	
}
.btn_od {
	border:1px solid black;
	background:#FFF;
}
#ip_status {
	border:none;
	text-align:center;
}

.th_orderLook {
	text-align:center;
}


#deliTable {
	align: center;
}

#deliTable tr {
	text-align:center;
}

#deliTable tr td {
	text-align:center;
}

#deliTable tr td img {
	width: 30%;
	align: center;
}

.dateBoard {
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

tr > th, tr>td{
	width: 25%;
	margin: auto;
	text-align:center;
	border-spacing: 10px;
}
.page-control {
	margin-top:10%;
}


</style>
</head>
<body>
	<header><%@ include file="../hfl/header.jsp"%></header>
	<header><%@ include file="../hfl/myPageList.jsp"%></header>
	<%@ include file="orderLookDatePicker.jsp" %>
<div class="tt_div">
<%-- <div class="searchdiv">
  <table class="searchBox">
                   <!-- <caption style="font-size:20px;">주문조회</caption> -->
                    <colgroup>
                        <col width="123px">
                        <col width="*">
                    </colgroup>
                    <h2>주문조회</h2>
                    <tbody>
                        <tr>
                            <th class="th_select">기간별 조회</th>
                            <td class="td_select">
                               <span class="chkbox2">
                                            <input type="button" name="dateType" id="dateType1" value="1주일" onclick="setSearchDate('1w')"/>
                                            <label for="dateType1"></label>
                                        </span>
                                        <span class="chkbox2">
                                            <input type="button" name="dateType" id="dateType2" value="15일" onclick="setSearchDate('1w')"/>
                                            <label for="dateType2"></label>
                                        </span>
                                        <span class="chkbox2">
                                            <input type="button" name="dateType" id="dateType3" value="1개월" onclick="setSearchDate('1m')"/>
                                            <label for="dateType3"></label>
                                        </span>
                               
                                <!-- <div class="clearfix">
                                    시작일 -->
                                    <span class="dset">
                                        <input type="text" class="datepicker inpType" name="startdate" id="searchStartDate" size=20 value="${adminBuildEnergyVo.startdate }" >
                                        <a href="#none" class="btncalendar dateclick"><img src="<%=request.getContextPath()%>/images/btn_calendar.gif"></a>
                                    </span>
                                    <span class="demi">~</span>
                                    <!-- 종료일 -->
                                    <span class="dset">
                                      <input type="text" class="datepicker inpType" name="enddate" id="searchEndDate" size=20 value="${adminBuildEnergyVo.enddate }" >
                                        <a href="#none" class="btncalendar dateclick"><img src="<%=request.getContextPath()%>/images/btn_calendar.gif"></a>
                                    </span>
                                <!-- </div>  -->  
                            </td>
                        </tr>
                    <tbody>
                </table>
			</div> --%>
			
		<div class="t_div">
			<br />
			<table border="1" align = "center" class = "dateBoard">
				<thead>
				<tr>
					<th class="th_orderLook">주문번호</th>
					<th class="th_orderLook">주문일자</th>
					<th class="th_orderLook">상품정보</th>
					<th class="th_orderLook">주문상태</th>
				</tr>
				</thead>
				<tbody>
				<% for(myPage p : olList){%>
				<tr class="od">
					<td><%=p.getOno() %></td>
					<td><%=p.getoDate() %></td>
					<td><%=p.getPname()%><br><button class="btn_od">주문상세</button></td>
					
				<% if(p.getRefundStatus() != "" && p.getRefundStatus() != "1" && p.getRefundStatus() != "2"){
				   	status = p.getRefundStatus();
					if(p.getDstatus() != "" && p.getDstatus() != "1" && p.getDstatus() != "2" && p.getDstatus() != "3"){
				 	status = p.getDstatus();
					if(p.getPayStatus() != "" && p.getPayStatus() != "1" && p.getPayStatus() != "2"){
				   	status = p.getPayStatus();
					}}}%>
					<td><%=status %></td>
				</tr>
				<%}%>
				</tbody>
			</table>
		</div></div>
<%-- 페이징처리 --%>
		<div id="pagingArea" align="center">
			<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/orderLook.mp?currentPage=1'"><<</button>
			
			<% if(currentPage <= 1){ %>
			<button class="btn_paging" disabled><</button>
			<% }else { %>
			<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/orderLook.mp?currentPage=<%=currentPage - 1%>'"><</button>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
				if(currentPage == p){
			%>
					<button class="btn_paging" disabled><%= p %></button>
			<% } else { %>
					<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/orderLook.mp?currentPage=<%=p%>'"><%= p %></button>
			<% 
				}
			   } 
			%>
			
			<% if(currentPage >= maxPage){ %>
			<button class="btn_paging" disabled>></button>
			<% }else{ %>
			<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/orderLook.mp?currentPage=<%=currentPage + 1 %>'">></button>
			<% } %>
			<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/orderLook.mp?currentPage=<%=maxPage%>'">>></button>
		</div>

	<br>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>

<script>
 
    $(".btn_od").click(function(){ 
    	var ono = $(this).parent().siblings().eq(0).text();
    	console.log(ono);
     	location.href='<%=request.getContextPath()%>/orderDetail.mp?ono='+ono;
     });

</script>
<%-- $(".btn_od").click(function(){ 
	var ono = $(this).parent().siblings().eq(0).text();
	console.log(ono);
 	location.href='<%=request.getContextPath()%>/orderDetail.mp?ono='+ono;
 }); --%>
<%-- 
$("#selectWeek").click(function(){ 
	
	location.href='<%=request.getContextPath()%>/orderLook.mp?';
 });
 
$("#selectFifteenth").click(function(){ 
	
	location.href='<%=request.getContextPath()%>/orderLook.mp?';
 });
 
$("#selectMonth").click(function(){ 
	
	location.href='<%=request.getContextPath()%>/orderLook.mp?';
 }); --%>

	
	
	
	
	
</body>
</html>