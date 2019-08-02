<%@page import="com.kh.bvengers.user.myPage.model.vo.MyPagePageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kh.bvengers.user.myPage.model.vo.*"%>
<%
	ArrayList<myPage> mplist = (ArrayList<myPage>) request.getAttribute("mplist");
	String ready = (String) request.getAttribute("ready");
	String start = (String) request.getAttribute("start");
	String success = (String) request.getAttribute("success");
	MyPagePageInfo pi = (MyPagePageInfo) request.getAttribute("pi");
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
 <script>
	$(function(){

		$("#deliReady").click(function(){ //이벤트 사용하고 싶을 시 .click 대신 on("click", '#td', function(){}
			$.ajax({
				url:"deliReady.mp",
				type:"post",
				success:function(data){
					$tableBody = $("#tdeliReady tbody");
					$tableBody.html(""); //요청 시마다 tableBody가 누적되지 않도록 비워줌

					$.each(data, function(index, value){ //index 회차, value값
						var $tr = $("<tr>");
						var $OnoTd = $("<td>").text(value.Ono);
						var $pNameTd = $("<td>").text(decodeURIComponent(value.pName));
						var $dstatusTd = $("<td>").text(value.dstatus);
						var $oDateTd = $("<td>").text(vaule.oDate)

						$tr.append($OnoTd);
						$tr.append($pNameTd);
						$tr.append($dstatusTd);
						$tr.append($oDateTd);

						$tableBody.append($tr);
					});

				},
				error:function(data){
				}
			});
		});

	});

</script>
<style>

.pagingArea {
	margin-top:50px;
	margin-left:auto;
	margin-right:auto;
}

.pagingArea > button {
	background:#FFF;
	border: 1px solid black;

}
#sec1 {
	width: 100%;
	height: 100%;
	padding-right: 20%;
	padding-left: 20%;
	margin: auto;
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

#tdeliReady {
	margin-top:5%;
	margin-left:auto;
	margin-right:auto;
	width: 80%;
	text-align:center;
	border-spacing: 10px;
	border-botton:1px solid #ccc;
}
.board {
	margin-top:5%;
	margin-left:auto;
	margin-right:auto;
	width: 80%;
	text-align:center;
	border-spacing: 10px;
	}

.th1 {
	text-align:center;
	border:1px solid black;
}
.row0 {
	background: black;
	text-align:center;
	color:white;
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
</style>
</head>
<body>
	<header><%@ include file="../hfl/header.jsp"%></header>
	<br>
	<header><%@ include file="../hfl/myPageList.jsp"%></header>

	<section id="sec1">
	<form action="<%=request.getContextPath()%>/listMyPage.mp" id="statusForm" method="post">
		<div id="area">
			<h3 align="center">최근 배송상태</h3>
			<table id="deliTable">
				<tr>
						<input type="hidden" id="dr1" name="dr1">
					<td id="deliReady"><img src="/sp/images/box.png" alt=""  />
						<br />
						<p>
							배송 준비중(<%=ready%>)
						</p></td>
					<td><img src="/sp/images/delivery-truck.png" id="deliStart" /> <br />
						<p>
							배송 중(<%=start%>)
						</p></td>
					<td><img src="/sp/images/order.png" alt="" id="deliSuccess"/>
						<br />
						<p>
							배송 완료(<%=success%>)
						</p></td>
				</tr>
			</table>
		</div>
		</form>

		<div>
			<br />
			<h3 align="center">최근 주문 현황</h3>
			<table class="board">
			<tbody></tbody>
				<tr class="row0">
					<th class="th1">주문번호</th>
					<th class="th1">상품명</th>
					<th class="th1">배송여부</th>
					<th class="th1">주문날짜</th>
				</tr>
				<% for(myPage m : mplist){%>
				<tr class="">
					<td><%=m.getOno() %></td>
					<td><%=m.getPname()%></td>
					<td><%=m.getPstatus()%></td>
					<td><%=m.getoDate()%></td>
				</tr>
				<%}%>
			</table>
		</div>

 		<div id="div_deliReady" style="display:none;">
			<br />
			<h3 align="center">배송 준비중</h3>
			<table id="tdeliReady" >
			<thead>
				<tr class="row0">
					<th class="th1">주문번호</th>
					<th class="th1">상품명</th>
					<th class="th1">배송여부</th>
					<th class="th1">주문날짜</th>
				</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>


<%-- 페이징처리 --%>
		<div class="pagingArea" align="center">
			<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/listMyPage.mp?currentPage=1'"><<</button>

			<% if(currentPage <= 1){ %>
			<button class="btn_paging" disabled><</button>
			<% }else { %>
			<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/listMyPage.mp?currentPage=<%=currentPage - 1%>'"><</button>
			<% } %>

			<% for(int p = startPage; p <= endPage; p++){
				if(currentPage == p){
			%>
					<button class="btn_paging" disabled><%= p %></button>
			<% } else { %>
					<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/listMyPage.mp?currentPage=<%=p%>'"><%= p %></button>
			<%
				}
			   }
			%>

			<% if(currentPage >= maxPage){ %>
			<button class="btn_paging" disabled>></button>
			<% }else{ %>
			<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/listMyPage.mp?currentPage=<%=currentPage + 1 %>'">></button>
			<% } %>

			<button class="btn_paging" onclick="location.href='<%=request.getContextPath()%>/listMyPage.mp?currentPage=<%=maxPage%>'">>></button>
		</div>


	</section>




	<br>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
<script>
		<%-- $(function(){
			$("#listArea td").mouseenter(function(){ //마우스가 올라갔을 때
				$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){ //마우스가 내려갔을 때
				$(this).parent().css({"background":"black"});
			}).click(function(){ //클릭했을 때
				var num = $(this).parent().children("input").val();

				location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num;
			});
		}); --%>

		 $(function(){
			$("#deliReady").click(function(){
					$("#dr1").val("1");
					$("#statusForm").submit();

			});
			$("#deliStart").click(function(){
				$("#dr1").val("2");
				$("#statusForm").submit();
			});
			$("#deliSuccess").click(function(){
				$("#dr1").val("3");
				$("#statusForm").submit();
			});
		});

		 $(function(){
			$("#deliReady").click(function(){
				if($("#div_deliReady").css("display") == "none"){
					$("#div_deliReady").css("display") == "block";
				}
			});
		 });


	</script>
</body>
</html>