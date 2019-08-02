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
    	String num = "num";
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

			<table id="depotSearch" >
				<tr>
					<th id="th3">창고 위치</th>
					<th id="th3">적치 일자</th>
					<th id="th3">출고 일자</th>
					<th id="th3">상품코드</th>
				    <th id="th3"></th>
				</tr>
				<tr>
					<td>
					<select name="root" id="">
						<option value="">--물품--</option>
						<option value="PC">PC</option>
						<option value="NOTE">노트북</option>
						<option value="PRO">생활가전</option>
					</select>
					물품명
					<select name="session" id="">
						<option value="">--세션--</option>
						<option value="A">A</option>
						<option value="B">B</option>
						<option value="C">C</option>
					</select>
					세션명
					<select name="floor" id="">
						<option value="">--층--</option>
						<option value="a">a</option>
						<option value="b">b</option>
						<option value="c">c</option>
					</select>
					층
					<select name="room" id="">
						<option value="">--호--</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					호
					</td>
					<td><input type="date" style="width: 200px;" id="insertDate"/></td>
					<td><input type="date" style="width: 200px;" id="releaseDate"/></td>
					<td><input type="text" style="width: 200px;" id="productCode"/></td>
					<td>
					<button type="button" onclick="search();">검색</button>
					<button id="excelGo"onclick="goExcel();">엑셀다운로드</button>
					</td>
				</tr>
			</table>
	</div>
	<script>
		function search(){
			$(function(){
				var root = $("select[name='root']").val();
				var session = $("select[name='session']").val();
				var floor = $("select[name='floor']").val();
				var room = $("select[name='room']").val();
				var insertDate = $("input[id='insertDate']").val();
				var releaseDate = $("input[id='releaseDate']").val();
				var productCode =$("input[id='productCode']").val();
				
				
				$.ajax({
					url:"search.dp",
					data:{"root":root,"session":session,"floor":floor,"room":room,"insertDate":insertDate,"releaseDate":releaseDate,"productCode":productCode},
					type:"post",
					success:function(data){
						var $depotTbody = $("#depotMain tbody");
						var $pagingDiv1 =$("#pagingArea div");
						$depotTbody.html("");
						$pagingDiv1.html("");
						var i = 1;
						for(var i = 0; i < data["list"].length; i++){
							var $tr = $("<tr>");
							var $num = $("<td><label>").text(data["list"][i].productNumber);
							var $code = $("<td><label>").text(data["list"][i].productCode);
							var $location=$("<td><label>").text(data["list"][i].locationCode);
							var $name = $("<td><label>").text(data["list"][i].productName);
							var $checkd = $("<td><label>").text(data["list"][i].checkDate);
							var $released = $("<td><label>");
							if(data["list"][i].releaseDate==null){
								$released.text("미출고");
							}else{
								$released.text(data["list"][i].releaseDate);
							}
							$tr.append($num);
							$tr.append($code);
							$tr.append($name);
							$tr.append($location);
							$tr.append($checkd);
							$tr.append($released);
							$depotTbody.append($tr);
						}
						var currentPage = data["pi"].currentPage;
						var endPage = data["pi"].endPage;
						var limit = data["pi"].limit;
						var listCount = data["pi"].listCount;
						var maxPage = data["pi"].maxPage;
						var startPage = data["pi"].startPage;

						var $pagingDiv2 =$("<div class='pagingArea' align='center'>");
						var $firstBtn = $("<button>").text('<<');
						var $preBtn = $("<button>").text('<');

						var $nextBtn =$("<button>").text('>');
						var $lastBtn =$("<button>").text('>>');


						$pagingDiv2.append($firstBtn);
						$pagingDiv2.append($preBtn);
						$firstBtn.attr('onclick',"newPage("+currentPage+")");
						if(currentPage <= 1){
							$preBtn.attr('disabled',true);
						}else{
							$preBtn.attr('onclick',"newPage("+(currentPage-1)+")");
						}
						for(var i = startPage ; i <= endPage ;i++){
							var $numBtn = $("<button>");
							if(currentPage == i){
								$numBtn.attr('disabled',true);
							}else{
								$numBtn.attr('onclick',"newPage("+i+")");
							}
							$numBtn.text(i);
							$pagingDiv2.append($numBtn);
						}
						if(currentPage >= maxPage){
							$nextBtn.attr('disabled',true);
						}else{
							$nextBtn.attr('onclick','newPage('+(currentPage+1)+')');
						}
						$lastBtn.attr('onclick','newPage('+maxPage+')');

						$pagingDiv2.append($nextBtn);
						$pagingDiv2.append($lastBtn);

						$pagingDiv1.append($pagingDiv2);
						}
				});
			});
		}
		$(function(){
			$("#excelGo").click(function(){
				location.href="<%=request.getContextPath()%>/excelGo.dp";
			});
		});

		function newPage(page){
			var location = $("select[id='depotLocation']").val();
			var insertDate = $("input[id='insertDate']").val();
			var releaseDate = $("input[id='releaseDate']").val();
			var productCode =$("input[id='productCode']").val();
			var currentPage = page;
			$.ajax({
				url:"search.dp",
				data:{"location":location,"insertDate":insertDate,"releaseDate":releaseDate,"productCode":productCode,"currentPage":currentPage},
				type:"post",
				success:function(data){
					var $depotTbody = $("#depotMain tbody");
					var $pagingDiv1 =$("#pagingArea div");
					$depotTbody.html("");
					$pagingDiv1.html("");
					var i = 1;
					for(var i = 0; i < data["list"].length; i++){
						var $tr = $("<tr>");
						var $num = $("<td><label>").text(data["list"][i].productNumber);
						var $code = $("<td><label>").text(data["list"][i].productCode);
						var $location=$("<td><label>").text(data["list"][i].locationCode);
						var $name = $("<td><label>").text(data["list"][i].productName);
						var $checkd = $("<td><label>").text(data["list"][i].checkDate);
						var $released = $("<td><label>").text(data["list"][i].releaseDate);
						$tr.append($num);
						$tr.append($code);
						$tr.append($name);
						$tr.append($location);
						$tr.append($checkd);
						$tr.append($released);
						$depotTbody.append($tr);
					}
					var currentPage = data["pi"].currentPage;
					var endPage = data["pi"].endPage;
					var limit = data["pi"].limit;
					var listCount = data["pi"].listCount;
					var maxPage = data["pi"].maxPage;
					var startPage = data["pi"].startPage;

					var $pagingDiv2 =$("<div class='pagingArea' align='center'>");
					var $firstBtn = $("<button>").text('<<');
					var $preBtn = $("<button>").text('<');

					var $nextBtn =$("<button>").text('>');
					var $lastBtn =$("<button>").text('>>');


					$pagingDiv2.append($firstBtn);
					$pagingDiv2.append($preBtn);
					$firstBtn.attr('onclick',"newPage("+currentPage+")");
					if(currentPage <= 1){
						$preBtn.attr('disabled',true);
					}else{
						$preBtn.attr('onclick',"newPage("+(currentPage-1)+")");
					}
					for(var i = startPage ; i <= endPage ;i++){
						var $numBtn = $("<button>");
						if(currentPage == i){
							$numBtn.attr('disabled',true);
						}else{
							$numBtn.attr('onclick',"newPage("+i+")");
						}
						$numBtn.text(i);
						$pagingDiv2.append($numBtn);
					}
					if(currentPage >= maxPage){
						$nextBtn.attr('disabled',true);
					}else{
						$nextBtn.attr('onclick','newPage('+(currentPage+1)+')');
					}
					$lastBtn.attr('onclick','newPage('+maxPage+')');

					$pagingDiv2.append($nextBtn);
					$pagingDiv2.append($lastBtn);

					$pagingDiv1.append($pagingDiv2);
					}
			});
		}
	</script>
	<br>
	<br><br>
		<table id="depotMain" align="center">
			<thead>
			<tr >
				<th id="th3">번호</th>
				<th id="th3">상품코드</th>
				<th id="th3">상품명</th>
				<th id="th3">위치관리번호</th>
				<th id="th3">적치 일자</th>
				<th id="th3">출고 일자</th>
			</tr>
			</thead>
			<tbody>
			<%for(Depot d :list) {%>
			<tr id="list">
				<td><label for=""><%=d.getProductNumber() %></label></td>
				<td><label for=""><%=d.getProductCode() %></label></td>
				<td><label for=""><%=d.getProductName() %></label></td>
				<td><label for=""><%=d.getLocationCode() %></label></td>
				<td><label for=""><%=d.getCheckDate() %></label></td>
				<td><%if(d.getReleaseDate()==null){ %>
					<label for="">미출고</label>
				<%}else{ %>
					<label for=""><%=d.getReleaseDate() %></label>	
				<%}%>
				</td>
			</tr>
			<%} %>
			</tbody>
		</table>

		<br>
	<div id ="pagingArea">
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
	</div>
</body>
</html>