<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.kh.bvengers.board.model.vo.*"%>
 <% Board b = (Board)request.getAttribute("b"); 
	 ArrayList<Attachment> fileList = 
			(ArrayList<Attachment>) request.getAttribute("fileList");

 %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

td{
	border:1px solid black	;
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
	<h2 align="center">공지사항</h2>
	<div class="container">
	 	<form action = "<%= request.getContextPath()%>/son.no" method = "post" encType="multipart/form-data">
	<div class = "tableArea">
			<hr>
			<table align = "center" width = "800px">
				<tr>
					<td align = "center" colspan = "7"><h2><%= b.getPostsTitle() %></h2></td>
					<!-- <td colspan = "5"><span></span></td> -->
				</tr>
				<tr>
					<td>작성자</td>
					<td><span><%= b.getMemberId() %></span></td>
					<td>조회수</td>
					<td><span><%= b.getPostsViews() %></span></td>
					<td>작성일</td>
					<td><span><%= b.getCreateDate() %></span></td>
				</tr>
				<tr>
					<td colspan = "6"><%=  %></td>
				</tr>
				<tr>
					<td colspan = "6"><%= b.getContents() %></td>
				</tr>
					
			</table>
		</div>
				<br><br><br>
		</form>
	</div>
	<br>
	<br>
 <footer><%@ include file="../hfl/footer.jsp" %></footer> 
	</div>	
</body>
</html>