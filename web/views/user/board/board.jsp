<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.kh.bvengers.board.model.vo.*,com.kh.bvengers.user.member.model.vo.*" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); 

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/d3js/5.9.0/d3.min.js"></script>
<title>Insert title here</title>
<style>
#board{
   text-align:center;
}
#wirte{
   position: absolute;
   right: 30px;
}

.spot {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;

}


.svg-wrapper {
  margin-top: 0;
  position: relative;
  width: 150px;
  /*make sure to use same height/width as in the html*/
  height: 40px;
  display: inline-block;
  border-radius: 3px;
  margin-left: 5px;
  margin-right: 5px
}


#shape {
  stroke-width: 6px;
  fill: transparent;
  stroke: #009FFD;
  stroke-dasharray: 85 400;
  stroke-dashoffset: -220;
  transition: 1s all ease;
}


#text {
  margin-top: -35px;
  text-align: center;
}

#text a {
  color: white;
  text-decoration: none;
  font-weight: 100;
  font-size: 1.1em;
}

.svg-wrapper:hover #shape {
  stroke-dasharray: 50 0;
  stroke-width: 3px;
  stroke-dashoffset: 0;
  stroke: #06D6A0;
}



</style>
</head>
<body>
<head><%@include file ="../hfl/header.jsp" %></head>
<div class="container">
   <br>
   <br>
  <h2 id="board">공지사항</h2>
  <!-- <table class="table" id = "listArea"> -->
			<table align = "center" id = "listArea">
      <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성날짜</th>
        <th>조회수</th>
      </tr>
    </thead>

    <tbody>
     <%for(Board b : list) {%>
				<tr>
					<input type = "hidden" value = "<%=b.getPostsId() %>"> 
					<td><%= b.getPostsId() %></td>
					<td><%= b.getPostsTitle() %></td>
					<td><%= b.getMemberName()%></td>
					<td><%= b.getCreateDate()%></td>
					<td><%= b.getPostsViews()%></td>
				</tr>
     	<%} %>
    </tbody>
  </table>
     <div class = "pagingArea" align ="center" >
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

  <%if (loginUser != null && loginUser.getMemberId().equals("admin")){%>
  <div style="align :center">
  	<button onclick="location.href='views/user/board/boarderwriter.jsp'">작성하기</button>
	</div>
	<%}%>

</div>
<div class="container">
   <br>
   <br>
   <hr>
  <h2 id="board">게시판</h2>
  <form action = "" method = "post" align="right" >
  <select>
     <option value="title">제목</option>
     <option value="writer">작성자</option>
     <option value="wdate">날짜</option>
  </select>
  <input type="text">
  <input type="submit" value="검색">
  </form>
  <table class="table">
      <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성날짜</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td><a href="boarderinsert.jsp">title</a></td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
      <tr>
        <td>2</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
      <tr>
        <td>3</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
        <tr>
        <td>4</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
        <tr>
        <td>5</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
      <tr>
        <td>6</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
      <tr>
        <td>7</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
      <tr>
        <td>8</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
      <tr>
        <td>9</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
      <tr>
        <td>10</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
    </tbody>
  </table>
</div>

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
<footer><%@ include file="../hfl/footer.jsp" %></footer>
</html>

