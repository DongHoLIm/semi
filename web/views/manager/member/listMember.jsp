<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.* , com.kh.bvengers.user.member.model.vo.*"%>
	<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
    Member loginUser = (Member) session.getAttribute("loginUser");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
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
<style>
#depotMain {
	width: 80%;
	height: 80%;
	border: 2px solid black;
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
	padding-left: 8%;
}

#inOutMain {
	border: 2px solid black;
	width: 80%;
	margin: 0 auto;
}

#table Area {
	align: center;
	width: 80%;
}

.th {
	background: black;
	color: white;
	text-align: center;
	border: 1px solid white;
}
table th{
text-align:center;
}
table td{
text-align:center;
}
.btns{
margin-left:13%;
font-weight:bold;
font-size:3;
}
#chk{
input-align:center;
}
</style>
<body>
	<%@ include file="../hfl/managerHeader.jsp"%>
	<br />
	<h2 align="center">회원 관리</h2>
	
	<div id="inOutMain">
		<br>
		<br>
		<form action="<%=request.getContextPath()%>/searchMember.me" method="post">
		<div id="inOutButton" align="center">
			<select name="selecthowsearch" style="width: 30%;">
				<option value="findId">아이디로 조회</option>
				<option value="findName">이름으로 조회</option>
				<option value="findLevel">등급으로 조회</option>
			</select> <input type="search" name="searchValue">
			<button type="submit"
				style="border-radius: 5px; background-color: black; color: white;">조회</button>
		</div>
		<br>
		<br>
		</form>
		<div class="btns">
		선택회원을
		<button value="블랙리스트" id="blacklist"
			style="align: center; border-radius: 5px; background-color: black; color: white;">블랙리스트</button>
		<button value="활동정지" id="stop"
			style="border-radius: 5px; background-color: black; color: white;">활동정지</button>
		</div>
		<br>
		<br>
		<div id="table Area">
			<table id="depotMain" align="center">
				<tr>
					<th class="th"><input type="checkbox" id="chkAll"></th>
					<th class="th">아이디</th>
					<th class="th">이름</th>
					<th class="th">전화번호</th>
					<th class="th">등급</th>
					<th class="th">주소</th>
					<th class="th">가입일</th>
					<th class="th">판매횟수</th>
					<th class="th">회원 상세 조회</th>
				</tr>
				
			</table>
			<br>
			<br>
		</div>
	</div>

<script>
	$(function(){
		<% for(Member m : list){%>
		
		 var $tableBody = $("table tbody");
		 
		 var $tr = $("<tr>");
		 var $idTd = $("<td>").text('<%=m.getMemberId()%>');
		 var $nameTd = $("<td>").text('<%=m.getMemberName()%>');
		 var $phoneTd = $("<td>").text('<%=m.getPhone()%>');
		 var $gradeTd = $("<td>").text('<%=m.getGradeCode()%>');
		 var $addressTd = $("<td>").text('<%=m.getAddress()%>');
		 var $enrollDateTd = $("<td>").text('<%=m.getEnrollDate()%>');
		 var $sellCountTd = $("<td>").text('<%=m.getSellCount()%>');
		 

		 $tr.append("<input type='checkbox' id=chk>");
		 $tr.append($idTd);
		 $tr.append($nameTd);
		 $tr.append($phoneTd);
		 $tr.append($gradeTd);
		 $tr.append($addressTd);
		 $tr.append($enrollDateTd);
		 $tr.append($sellCountTd);
		 $tr.append("<button id='mbdetail'>상세보기</button>");
		 
		
		 });
		
		 
		 
		 $("#mbdetail").click(function(){
			var mi = $(this).parent().children().eq(1).text();
		 location.href='<%=request.getContextPath()%>/mbdetail.me?mi='+mi;
		 });

		 $tableBody.append($tr);
		<%}%>
	});
	

	$("#chkAll").on("click", function() {
	      var chkAll = $(this).is(":checked");
	      if (chkAll)
	        $("#depotMain input:checkbox").prop("checked", true);
	      else
	        $("#depotMain input:checkbox").prop("checked", false);
	    });
	
</script>
<div class="pagingArea" align="center">
	<button onclick="location.href='<%=request.getContextPath()%>/memberList.me?currentPage=1'"><<</button>
			
			<% if(currentPage <= 1){ %>
			<button disabled><</button>
			<% }else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/memberList.me?currentPage=<%=currentPage - 1%>'"><</button>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
				if(currentPage == p){
			%>
					<button disabled><%= p %></button>
			<% } else { %>
					<button onclick="location.href='<%=request.getContextPath()%>/memberList.me?currentPage=<%=p%>'"><%= p %></button>
			<% 
				}
			   } 
			%>
			
			<% if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<% }else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/memberList.me?currentPage=<%=currentPage + 1 %>'">></button>
			<% } %>

			<button onclick="location.href='<%=request.getContextPath()%>/memberList.me?currentPage=<%=maxPage%>'">>></button>
</div>
</body>
</html>