<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kh.bvengers.manager.member.model.vo.*,com.kh.bvengers.user.member.model.vo.*"%>
	<%
	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");
	Member loginUser = (Member) session.getAttribute("loginUser");
	MMemberPageInfo pi = (MMemberPageInfo) request.getAttribute("pi");
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
</style>
<body>
	<%@ include file="../hfl/managerHeader.jsp"%>
	<br />
	<h2 align="center">신고대상 관리</h2>
	<form action="" method="post">
	<div id="inOutMain"><br><br>
		<div id="inOutButton" align="center">
			
		<select name="selecthowsearch" style="width:20%;">
			<option value="findId">아이디로 조회</option>
			<option value="findName">이름으로 조회</option>
			<option value="findLevel">등급으로 조회</option>
		</select>
		<input type="search" name="searchValue">
		<button type="submit" style="border-radius: 5px; background-color: black; color:white;">조회</button>
	</div><br><br>
		<div id="table Area">
			<table id="depotMain" align="center">
				<tr>
		<th class="th">신고번호</th>
		<th class="th">신고자</th>
		<th class="th">신고대상</th>
		<th class="th">신고근거</th>
		<th class="th">신고일자</th>
		<th class="th">신고사유</th>
		<th class="th">블랙리스트 등록</th>
		<th class="th">회원정지</th>
	</tr>
	<%for(Report r : list){ %>
	<tr>
	<td align="center"><%=r.getReportNo() %></td>
	<td align="center"><%=r.getReporter() %></td>
	<td align="center"><%=r.getMemberDest() %></td>
	<td align="center"><a class="detail"><%=r.getPostsId() %></a></td>
	<td align="center"><%=r.getReportDate() %></td>
	<td align="center"><%=r.getReportComments() %></td>
	<td align="center"><input type="button" class="blacklist" value="등록하기"></td>
	<td align="center">
	<select name = "term" id="term">
	<option value="3">3일</option>
	<option value="7">1주</option>
	<option value="30">한달</option>
	</select>
	<input type="button" class="mstop" value="정지"></td>
	</tr>
	<%} %>
 	
<%-- 			<%@ include file="rearchMemberResult.jsp" %>
 --%>			</table><br>
		</div><br>
	</div><br><br>
		</form>

<div class="pagingArea" align="center">
	<button onclick="location.href='<%=request.getContextPath()%>/reportList.me?currentPage=1'"><<</button>
			
			<% if(currentPage <= 1){ %>
			<button disabled><</button>
			<% }else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/reportList.me?currentPage=<%=currentPage - 1%>'"> < </button>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
				if(currentPage == p){
			%>
					<button disabled><%= p %></button>
			<% } else { %>
					<button onclick="location.href='<%=request.getContextPath()%>/reportList.me?currentPage=<%=p%>'"><%= p %></button>
			<% 
				}
			   } 
			%>
			
			<% if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<% }else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/reportList.me?currentPage=<%=currentPage + 1 %>'">></button>
			<% } %>

			<button onclick="location.href='<%=request.getContextPath()%>/reportList.me?currentPage=<%=maxPage%>'">>></button>
</div>
<script>
$(".detail").click(function(){
	var num = $(this).text();
	location.href='<%=request.getContextPath()%>/son.no?num='+num;
});

$(function(){
$(".blacklist").click(function(){
	var memberId = $(this).parent().siblings().eq(2).text();
	var reason = $(this).parent().siblings().eq(3).text();
	$.ajax({
		url:"/sp/blacklist.me",
		type:"post",
		data:{memberId:memberId,reason:reason},
		success:function(data){
			if(data==="success"){
				alert("블랙리스트처리완료");
			}else{
				alert("처리 실패!");
			}
		}
	});
});
});
$(function(){
	$(".mstop").click(function(){
	var memberId = $(this).parent().siblings().eq(2).text();
	var term = $("#term option:selected").val();
	var reason = $(this).parent().siblings().eq(3).text();
	$.ajax({
		url:"/sp/memberStop.me",
		type:"post",
		data:{memberId:memberId,term:term,reason:reason},
		success:function(data){
			if(data==="success"){
				alert("정지완료");
			}else{
				alert("정지실패")
			}
		}
	});
	}); 
});
</script>
</body>
</html>