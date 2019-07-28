<%@ page import="com.kh.bvengers.user.myPage.model.vo.MyPagePageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kh.bvengers.user.myPage.model.vo.*"%>
<%

	ArrayList<myPage> olList = (ArrayList<myPage>) request.getAttribute("olList");
	MyPagePageInfo pi = (MyPagePageInfo) request.getAttribute("pi");
	
	
	/* request.setAttribute("olList", olList); */
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	String status = "";
	String page2 = "";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>

.pagingArea {
	margin-top:50px;
}

.pagingArea > button {
	background:#FFF;
	border: 1px solid black;
	
}
input[type=button] {
	border:1px solid black;
	background:#FFF;
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

#sec1 {
	width: 100%;
	height: 100%;
	padding-right: 20%;
	padding-left: 20%;
	margin: auto;
}

#area {
	width: 80%;
	height:70%;
	padding: 2%;
	margin: 0 auto;
	text-align: center;
	border:1px solid black;
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

.board {
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
	<br><br>
	<header><%@ include file="../hfl/myPageList.jsp"%></header>

	<section id="sec1">
		<div id="area">
			<h3 style="font-weight: bold">주문조회</h3>
		<div class="date-select" align="center">
			<br> <span style="font-weight: bold">기간별조회</span> <span>&nbsp;&nbsp;&nbsp;
			<input type="button" value="1주일" id="selectWeek">&nbsp;
			</span> &nbsp;<input type="button" value="15일" id="selectFifteenth">&nbsp; &nbsp;
			<input type="button" value="1개월" id="selectMonth">&nbsp; 
			<input type="date"> - <input type="date"><br> <br>
		</div>
		</div>

	
	<div id="date_sort">
		<p><span class="blind">기간별조회</span></p>
		<ul class="date_3ea">
			<li><a id="btnDate1" href="javascript:DateChangeClick('oneWeek');"><strong>1</strong>주일</a></li>
			<li><a id="btnDate2" href="javascript:DateChangeClick('halfMonth');"><strong>15</strong>일</a></li>
			<li><a id="btnDate3" href="javascript:DateChangeClick('oneMonth');" class="on"><strong>1</strong>개월</a></li>
		</ul>
		<ul class="date_5ea">
			<li><a id="btnDate4" href="javascript:DateChangeClick('oneMonthAgo');"><strong>6</strong>월</a></li>
			<li><a id="btnDate5" href="javascript:DateChangeClick('twoMonthAgo');"><strong>5</strong>월</a></li>
			<li><a id="btnDate6" href="javascript:DateChangeClick('threeMonthAgo');"><strong>4</strong>월</a></li>
			<li><a id="btnDate7" href="javascript:DateChangeClick('fourMonthAgo');"><strong>3</strong>월</a></li>
			<li><a id="btnDate8" href="javascript:DateChangeClick('fiveMonthAgo');"><strong>2</strong>월</a></li>
            
		</ul>
		<ul class="date_pick">
			<li class="pick_d1"><input id="searchSDT" name="searchSDT" readonly="true" type="text" value="2019-06-28" /></li> 
			<li class="date_wave">~</li> 
			<li class="pick_d2"><input id="searchEDT" name="searchEDT" readonly="true" type="text" value="2019-07-28" /></li>
		</ul>
		<a id="btnSearch" class="btn_s_gray11"><span>조회하기</span></a>
	</div>
	




		<div >
			<br />
	<form action="orderDetail.mp" method="post" id="odForm">
			<table border="1" align = "center" class = "board">
				<tr>
					<th class="th_orderLook">주문번호</th>
					<th class="th_orderLook">주문일자</th>
					<th class="th_orderLook">상품정보</th>
					<th class="th_orderLook">주문상태</th>
				</tr>
				<% for(myPage p : olList){%>
				<tr class="od">
					<td><%=p.getOno() %></td>
					<td><%=p.getoDate() %></td>
					<td><button class="btn_od">주문상세</button><br><%=p.getPname()%></td>
					
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
			</table>
			</form>
		</div>
<%-- 페이징처리 --%>
		<div class="pagingArea" align="center">
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
	</section>

	<br>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>

<script type="text/javascript">	

$(".btn_od").click(function(){ 
	var ono = $(this).parent().siblings().eq(0).text();
	console.log(ono);
 	location.href='<%=request.getContextPath()%>/orderDetail.mp?ono='+ono;
 });

$("#selectWeek").click(function(){ 
	
	location.href='<%=request.getContextPath()%>/orderLook.mp?';
 });
 
$("#selectFifteenth").click(function(){ 
	
	location.href='<%=request.getContextPath()%>/orderLook.mp?';
 });
 
$("#selectMonth").click(function(){ 
	
	location.href='<%=request.getContextPath()%>/orderLook.mp?';
 });




$(function () {

	$.datepicker.regional['ko'] = {
		closeText: '닫기',
		prevText: '이전달',
		nextText: '다음달',
		currentText: '오늘',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		weekHeader: 'Wk',
		dateFormat: 'yy-mm-dd',
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: true,
		yearSuffix: '',
		beforeShow: function (input, datepicker) {
			setTimeout(function () {
				$(datepicker.dpDiv).css('zIndex', 100);
			}, 10);
		},
		buttonImageOnly: true,
		buttonImage: "http://image.gmarket.co.kr/_Net/MyG/button/btn_cal.gif"
	};
	$.datepicker.setDefaults($.datepicker.regional['ko']);


	$('#searchSDT_rsv').datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange: "-2:+0",
		showOn: "both", // focus, button, both
		showAnim: "show",  // show, fadeIn, slideDown
		duration: 200,
        minDate: null,
        maxDate: "+0d",
		beforeShow: null,
		onSelect: function(dateText, inst) {
			if (dateText != "")
			{
				fnChangeBtn(0);
			}
		}
	});

	$('#searchEDT_rsv').datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange: "-2:+0",
		showOn: "both", // focus, button, both
		showAnim: "show",  // show, fadeIn, slideDown
		duration: 200,
        minDate: null,
        maxDate: "+0d",
		beforeShow: null,
		onSelect: function(dateText, inst) {
			if (dateText != "")
			{
				fnChangeBtn(0);
			}
		}
	});

});

function DateChangeClick_rsv(gbn) {
	
	var toDay = '2019-07-28';
	if (gbn == 'toDay') {
		$("#searchSDT_rsv").val(toDay);
		$("#searchEDT_rsv").val(toDay);
	}
	else if (gbn == 'threeMonth') {
		var threeMonthDay = '2019-04-28';
		$("#searchSDT_rsv").val(threeMonthDay);
		$("#searchEDT_rsv").val(toDay);
		fnChangeBtn_rsv(1);
	}
	else if (gbn == 'sixMonth') {
		var sixMonthDay = '2019-01-28';
		$("#searchSDT_rsv").val(sixMonthDay);
		$("#searchEDT_rsv").val(toDay);
		fnChangeBtn_rsv(2);
	}
	else if (gbn == 'oneYear') {
		var oneYearDay = '2018-07-28';
		$("#searchSDT_rsv").val(oneYearDay);
		$("#searchEDT_rsv").val(toDay);
		fnChangeBtn_rsv(3);
	}
	fnRangeSearch_rsv();
}

function fnChangeBtn_rsv(gbn) {
	for(var i = 1 ; i < 4 ; i++)
	{
		$("#btnDate" + i + "_rsv").removeClass("on");
	}
	if (gbn > 0) {
		$("#btnDate" + gbn + "_rsv").addClass("on");
	}
}




<%-- $("#btn_od").click(function(){ 
	var od = $(this).parent().siblings().eq(0).text();
	console.log(od);
 location.href='<%=request.getContextPath()%>/orderDetail.mp?od='+od;
 }); --%>


 <%-- function goOd(){
	$("#btn_od").click(function(){
		var od = $(this).parent().siblings().eq(0).text();
		console.log(od);
		 location.href='<%=request.getContextPath()%>/orderDetail.mp?od='+od;
		
}); --%>
	<%-- location.href="<%=request.getContextPath()%>/orderDetails.jsp"; --%>


/* $(function(){
	$("#btn_od").click(function(){
		request.getRequestDispatcher("orderDetail.mp").forward(request, response);
		
	});
});
 */
</script>	
	
	
	
	
	
</body>
</html>