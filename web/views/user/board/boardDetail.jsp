<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.kh.bvengers.board.model.vo.*,java.util.HashMap"%>
 <% Board b = (Board)request.getAttribute("b"); 
	ArrayList<HashMap<String, Object>> fileList = (ArrayList<HashMap<String, Object>>) request.getAttribute("fileList");

 %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>

td{
	border:1px solid lightgray;
	}
.tableArea{
		border:1px solid white;
		width:800px;
		height:100%;
		margin:0 auto;
} 
#content{
		height:230px;
	}

</style>
</head>
<head><%@include file ="../hfl/header.jsp" %></head>
<body>
<div>
	<br>
	<br>
	<div class="container">
	 	<form action = "<%= request.getContextPath()%>/son.no" method = "post" encType="multipart/form-data">
	<div class = "tableArea">
			<hr>
			<table align = "center" width = "800px">
				<tr>
					<td align = "center" colspan = "7"><h2><%= b.getPostsTitle() %></h2></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td align = "center" id = "writer"><span><%= b.getMemberId() %></span></td>
					<td>조회수</td>
					<td align = "center"><span><%= b.getPostsViews() %></span></td>
					<td>작성일</td>
					<td align = "center"><span><%= b.getCreateDate() %></span></td>
				</tr>
				<% for(int i = 0; i < fileList.size(); i++){ 
					HashMap<String, Object> hmap = fileList.get(i);
				 %>
				<tr>
				<td colspan = "6"><img id="titleImg" style=" align:center; margin:0 auto; width:100%; height:150%;"src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%= hmap.get("newFileName")%>"></td>
				</tr>
				<tr>
					<td colspan = "6" align = "center"><h3><%= (b.getContents()).replace("\r\n","<br>") %></h3></td>
				</tr>
					<%} %>
			</table>
		</div>
				<br><br><br>
		</form>
		<div>
		<button id= "report" align = "left" onclick = "report();">신고하기</button>
		</div>
	</div>
	<br>
	<br>
 <footer><%@ include file="../hfl/footer.jsp" %></footer> 
	</div>	
	<script>
	function report(){
	  var writer = $("#writer").text();
	  var postId =<%= b.getPostsId() %>;
      var array = writer+"/"+postId;	
      console.log(array);
      console.log("ss");	
      window.open('<%=request.getContextPath()%>/ss.re?array='+array,'신고하기','width=430,height=450,status=no,scrollbars=yes');
	}
	</script>

</body>
</html>





