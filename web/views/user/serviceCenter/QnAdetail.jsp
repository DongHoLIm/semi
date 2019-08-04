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
	/* border:1px solid lightgray; */
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
					<td colspan = "7"  style = "height:50px"><h1><%= b.getPostsTitle() %></h1></td>
				</tr>
				<tr>
					<td align = "right">작성자 :</td>
					<td align = "left" id = "writer"><span><%= b.getMemberId() %></span></td>
					<td align = "right">조회수 :</td>
					<td align = "left"><span><%= b.getPostsViews() %></span></td>
					<td align = "right">작성일 :</td>
					<td align = "left"><span><%= b.getCreateDate() %></span></td>
				</tr>
				</table>
				<hr>
				<table align = "center" width = "800px">
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
	<hr>
</div>
</div>

	<div class = "replyArea">
	
	<div >
		<div class = "replayWriterArea" style = " width:800px; height:100%; margin:0 auto;">
				<table align = "center">
				<tr>
					<td><textarea rows = "3" cols = "80" id = "replyContent"></textarea></td>
					<td>&nbsp;&nbsp;</td>
					<td><button id = "addReply" style = "height:60px">댓글 등록</button></td>
				</tr>
			</table>
				<div >
				<h5>&nbsp;</h5>
			</div>
			</div>
				<br>
				
		<table id="replySelectTable" class="commentTables" align="center">
			<tr>
				<th colspan="7" style = "width:800px">댓글 리스트</th>
			</tr>
		</table>
		
		<br>
			<table id="replySelectTable" class="commentTables" border="1" align="center">
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

		<div>
		<% if (loginUser != null && loginUser.getMemberId().equals("admin")){ %>
			<button type = button onclick = "location.href= '<%= request.getContextPath()%>/sonn.no?num=<%=b.getPostsId() %>'">수정하기</button>
			<button type = button onclick = "location.href= '<%= request.getContextPath()%>/ubds.up?num=<%=b.getPostsId() %>'">삭제하기</button>
		<%} %>

		</div>
	<br>
	<br>
 <footer><%@ include file="../hfl/footer.jsp" %></footer>
	</div>
	<script>
	$(function(){
		$("#replySelectTable").on("click", function(){
			$(this).val = "";
		});
	});


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





