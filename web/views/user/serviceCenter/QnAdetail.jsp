<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.kh.bvengers.board.model.vo.*,java.util.HashMap"%>
 <% Board b = (Board)request.getAttribute("b"); 
 Attachment a = (Attachment)request.getAttribute("fileList");
	
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
				<tr>
				<% if(!(a.getNewFileName().equals("사진없음"))){%>
				<td colspan = "6"><img id="titleImg" style=" align:center; margin:0 auto; width:100%; height:150%;"src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%= a.getNewFileName()%>"></td>
				<%}else{%>
				<td colspan = "6"></td><%}%>
				</tr>
				<tr>
					<td colspan = "6" align = "center"><h3><%= (b.getContents()).replace("\r\n","<br>") %></h3></td>
				</tr>
			</table>
		</div>
				<br><br><br>
		</form>
	<div class = "replyArea">
			<div class = "replayWriterArea">
			<table align = "center">
				<tr>
					<td>댓글 작성</td>
					<td><textarea rows = "3" cols = "80" id = "replyContent"></textarea></td>
					<td><button id = "addReply">댓글 등록</button></td>
				</tr>
			</table>
				<br><br>
			<table id="replySelectTable" class="commentTables" border="1" align="center">
			<tr>
				<th colspan="7" style = "width:800px">댓글 리스트</th>
			</tr>
			<tbody>
			<tr>
				<td colspan="2" class="tWriter">작성자</td>
				<td colspan="3" class="tContent">내용</td>
				<td class="tDate">작성일</td>				
			</tr>			
			</tbody>
			<tfoot>
			
			</tfoot>
		</table>
		</div>
	</div>
	<br>
	<br>
 <footer><%@ include file="../hfl/footer.jsp" %></footer> 
	</div>	
	<script>
	
	$(function(){
		var postsId = <%= b.getPostsId()%>;
		$(document).ready(function(){
			$.ajax({
				url:"selectComment.pd",
				data:{postsId:postsId},
				type:"post",
				success:function(data){
					var $replySelectTable = $("#replySelectTable tfoot");
					$replySelectTable.html("");
						for(var key in data){
							var $tr = $("<tr>");
							var $writeTd = $("<td colspan='2'>").text(data[key].memberId).css("width", "100px");
							var $contentTd = $("<td colspan='3'>").text(data[key].commentContents).css("width","400px");
							var $dateTd = $("<td>").text(data[key].commentDate).css("width", "200px");
							
						$tr.append($writeTd);
						$tr.append($contentTd);
						$tr.append($dateTd);
						$replySelectTable.append($tr);
					}
				},
				error:function(){
					alert("댓글 입력 실패");
				}
				
			});
		});
	
	});
		
	
	$(function(){
		$("#addReply").click(function(){
			<% if(loginUser!=null){%>
			var writer =  <%= loginUser.getMemberNo()%>;
		    var postId = <%= b.getPostsId()%>;
		    var content = $("#replyContent").val();
		    
		    $.ajax({
		    	url:"iwc.bo",
		    	data:{"writer":writer, "content":content, "postId":postId},
		    	type:"post",
		    	success:function(data) 	 {
		    		location.reload();
					$("#replySelectTable tfoot").show();
		    	
		    	
		    	},
		    	error:function(){
		    		console.log("실패!");
		    	}
		    });
		<%}else{ %>
			alert("로그인이 필요합니다!");
			location.href="views/user/login/login.jsp";

			<%}%>
		});
	});
	
	
	</script>
</body>
</html>





