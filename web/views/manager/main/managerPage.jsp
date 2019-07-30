<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.kh.bvengers.board.model.vo.*,com.kh.bvengers.user.myPage.model.vo.*" %>
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
	#sec1 {
		width:100%;
		height:100%;
		padding-right:10%;
		padding-left:10%;

		margin:auto;
	}
	thead{
			background:#eee;

	}
	.board{
		width:80%;
		margin:auto;
		align:center;
        border-spacing: 10px;

	}

	.row0{
		background:black;
		color:white;
		margin:auto;
	}
	th{
		background:black;
		color:white;
	}
	.row1{
		border-top: 2px solid #555;
	}
	.row2, .row3, .row4, .row, .row6, .row7, .row8, .row9, .row10{
		border-top: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
	}

	.pageNo{
		margin:auto;

	}



</style>
</head>
<body>

	<!-- header 영역 -->
	<header><%@ include file="../hfl/managerHeader.jsp" %></header>
	<br />
	<br />

	<section id="sec1">
		<h2 align="center">공지사항</h2>

		<table class="board" id = "listArea">
			<tr class="row0">
			<thead>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
			</thead>
			</tr>
			<%for (Board b : list) {%>
				<tr class = "row1"> <input type = "hidden" value = "<%=b.getPostsId() %>">
				<td><%= b.getPostsId() %></td>
				<td><%= b.getPostsTitle() %></td>
				<td><%= b.getMemberId() %></td>
				<td><%= b.getCreateDate() %></td>
			<%} %>
		</table>
		<div align = "center">
      <button onclick="location.href='<%=request.getContextPath()%>/views/user/board/boarderwriter.jsp'">작성하기</button>
      </div>

			<br><br><br><br>
		  <div class = "pagingArea" align ="center" class="pagination" >
		<button onclick = "location.href = '<%=request.getContextPath()%>/selectNotice.no?currentPage=1'"><</button>
		<%if(currentPage <= 1) {%>
		<button disabled><</button>
		<%} else{%>
	<button onclick = "location.href='<%=request.getContextPath()%>/selectNotice.no?currentPage=<%=currentPage-1%>'"><</button>
		<%}
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
		<br>

	</section>
	<br />

	<footer><%@ include file="../../user/hfl/footer.jsp" %></footer>

	<script>
	$(function(){
		$("#listArea td").mouseenter(function(){

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



















