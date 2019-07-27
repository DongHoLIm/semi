<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "java.util.*,com.kh.bvengers.board.model.vo.*,com.kh.bvengers.user.myPage.model.vo.*"%>
	
<%
ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
BoardPageInfo pi = (BoardPageInfo)request.getAttribute("pi");
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
width:80%;
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
	<h2 align="center">게시물 관리</h2>
	<div id="inOutMain"><br><br>
		<div id="inOutButton" align="center">
			<select name="search" id="search">
				<option value="notebook">노트북</option>
				<option value="">가전제품</option>
				<option value=""></option>
			</select>
		<span>
		<select name="select" style="width:20%;">
			<option value="findId">아이디로 조회</option>
			<option value="findName">이름으로 조회</option>
			<option value="findLevel">등급으로 조회</option>
		</select>
		<input type="search" name="searchValue">
		<button type="submit" style="border-radius: 5px; background-color: black; color:white;">조회</button>
	</span>		</div><br><br>
	  <div style="align :center">
	</div>
		<div id="table Area">
			<table id="depotMain" align="center">
				<tr>
		<th class="th">No.</th>
		<th class="th">ID</th>
		<th class="th">게시글 제목</th>
		<th class="th">삭제</th>
	</tr>
		<%for (Board b : list) {%>
			<tr class = "row1"> <input type = "hidden" value = "<%=b.getPostsId() %>"> 				
			<td><%= b.getPostsId() %></td>
			<td><%= b.getPostsTitle() %></td>
			<td><%= b.getMemberId() %></td>
			<td><%= b.getCreateDate() %></td>
			<%} %>	
	
			</table>
			<br><br><br><br>
		  <div class = "pagingArea" align ="center" class="pagination" >
		<button onclick = "location.href = '<%=request.getContextPath()%>/selectNotice.no?currentPage=1'"><</button>      
		<%if(currentPage <= 1) {%> 
		<button disabled><</button>
		<%} else{%>
	<button onclick = "location.href='<%=request.getContextPath()%>/selectNotice.no?currentPage=<%=currentPage-1%>'"><</button>
		<%}
			System.out.println("최근 페이지는" + currentPage);
		%>    
			<%for (int p = startPage; p <= endPage; p++) {
				if(currentPage == p){
			%>
				<button disabled><%= p %></button>
			<%} else{ %>
					<button onclick = "location.href='<%=request.getContextPath()%>/selectNotice.no?currentPage=<%=p%>'"><%= p %></button>
			<% }  
			}	
			%>
			
			
			<%if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<%}else{ %>
			<button onclick ="location.hreh='<%=request.getContextPath()%>/selectNotice.no?currentPage=<%=currentPage + 1%>'">></button>
			<%} %>
			<button onclick = "location.href='<%=request.getContextPath()%>/selectNotice.no?currentPage=<%=maxPage%>'">>></button>
 		 
      </div>
		</div>
	</div>
<script>
	$(function(){
		$("#depotMain td").mouseenter(function(){
			
			$(this).parent().css({"background":"darkgray","cursor":"pointer"});
		}).mouseout(function(){
				$(this).parent().css({"background":"white"});	
		}).click(function(){
			var num = $(this).parent().children("input").val();
			console.log(num);
			 location.href="<%=request.getContextPath()%>/son.no?num=" + num;
		});
	});
	
	</script>

</body>
</html>