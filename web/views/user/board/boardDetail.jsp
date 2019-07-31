<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.kh.bvengers.board.model.vo.*,java.util.HashMap"%>
 <% Board b = (Board)request.getAttribute("b");
 	Attachment a = (Attachment)request.getAttribute("fileList");
 	//ArrayList<HashMap<String, Object>> fileList = (ArrayList<HashMap<String, Object>>) request.getAttribute("fileList");

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
		</div>
		<div>
			<table id = "replySelectTable" border = "1" align = "center"><tbody></tbody></table>

		</div>
		<div>
		<button id= "report" align = "left" onclick = "report();">신고하기</button>
		<% if (loginUser != null && loginUser.getMemberId().equals("admin")){ %>
			<button type = button onclick = "location.href= '<%= request.getContextPath()%>/sonn.no?num=<%=b.getPostsId() %>'">수정하기</button>
		<%} %>

		</div>
	<br>
	<br>
 <footer><%@ include file="../hfl/footer.jsp" %></footer>
	</div>
	<script>
	function report(){
	  var writer = <%= b.getMemberNo()%>;
	  console.log(writer);
	  var postId =<%= b.getPostsId()%>;
	  console.log(postId);
	  var array = writer+"/"+postId;
      console.log(array);

      var url = "views/user/board/report.jsp?array="+array;

      window.open(url,'신고하기','width=430,height=450,status=no,scrollbars=yes');
	};


	$(function(){
		$("#addReply").click(function(){
			<% if(loginUser!=null){%>
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
		<%}else{ %>
			alert("로그인이 필요합니다!");
			location.href="views/user/login/login.jsp";

			<%}%>
		});
	});
	</script>

</body>
</html>





