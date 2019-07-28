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
					<td align = "center"><span><%= b.getMemberId() %></span></td>
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
				<div class = "replyArea">
		<div class = "replayWriterArea">
			<table align = "center">
				<tr>
					<td>댓글 작성</td>
					<td><textarea rows = "3" cols = "80" id = "replyContent"></textarea></td>
					<td><button id = "addReply">댓글 등록</button></td>
				</tr>
			</table>
		</div>
		<div>
			<table id = "replySelectTable" border = "1" align = "center"><tbody></tbody></table>
		
		</div>
		</form>
	</div>
	<br>
	<br>
 <footer><%@ include file="../hfl/footer.jsp" %></footer> 
	</div>	
	<script>
	
	$(function(){
		$("#addReply").click(function(){
			var writer =  <%= loginUser.getMemberNo()%>;
		    var postId = <%= b.getPostsId()%>;
		    var content = $("#replyContent").val();
		    
		    $.ajax({
		    	url:"iwc.bo",
		    	data:{writer:writer, content:content, postId:postId},
		    	type:"post",
		    	success:function(data) 	 {
		    		console.log(data);
		    		
		    	var $replySelectTable = $ ("#replySelectTable tbody");
		    	$replySelectTable.html("");
		    	
		    	for(var key in data){
		    		var $tr = $("<tr>");
					var $writeTd = $("<td>").text(data[key].memberId).css("width", "100px");
					var $contentTd = $("<td>").text(data[key].commentContents).css("width","400px");
					var $dateTd = $("<td>").text(data[key].commentDate).css("width", "200px");
								
					$tr.append($writeTd);
					$tr.append($contentTd);
					$tr.append($dateTd);
					$replySelectTable.append($tr);
		    	}
		    	
		    	},
		    	error:function(){
		    		console.log("실패!");
		    	}
		    });
		});
	});
	
	
	
	</script>
</body>
</html>




