<%@page import="com.kh.bvengers.product.model.vo.Product"%>
<%@page import="com.kh.bvengers.board.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.bvengers.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Product p = (Product) request.getAttribute("p");
	Board b = (Board) request.getAttribute("b");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>) request.getAttribute("fileList");
	Attachment productImg = fileList.get(0);
%>
<!DOCTYPE html>
<html>
<head>
<style>
.outer {
	width: 50%;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 50px;
}

.detail td, .detail th {
	text-align: center;
	border: 1px solid black;
}

.detail th {
	font-size: 1.2em;
	font-weight: bold;
	width : 100px;
	background: black;
	color:white;
	border: 1px solid white;
}

#titleImgArea {
	margin: 0 auto;
}
#titleImg {
	width: 300px;
	height: 300px;
}

#titleContentArea{
	height : 500px;
}
#titleContent{
	width: 600px;
}
#price{
	font-size:2em;
}
.detailBtn{
	background: black;
	color: white;
	border: none;
	width: 100px;
	height: 50px;
}
#contents {
	text-align:left;
}
#addBtn{
	background: black;
	color: white;
	border: 1px solid white;
	width: 150px;
	height: 50px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header><%@ include file="../hfl/header.jsp"%></header>
	<div class="outer">
		<form action="<%=request.getContextPath()%>/payment.pa" method="post" id="productDetail">
			<table class="detail" align="center">
				<tr>
					<th>판매자</th>
					<th colspan="6"><label id="writer"><%= b.getWriter() %></label></th>
				</tr>
				<tr>
					<th rowspan="4">상품</th>
					<td rowspan="4">
						<div id="titleImgArea" align="center">
							<input type="hidden" value="<%= b.getPostsId() %>" name="postsId" />
							<img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= productImg.getNewFileName() %>" id="titleImg" />
						</div>
					</td>
					<th width="100px" height="50px">상품명</th>
					<th colspan="3" id="titleContent"><label><%= b.getPostsTitle() %></label></th>
				</tr>
				<tr>
					<td colspan="4">

					</td>
				</tr>
				<tr>
					<td colspan="4">
						<input type="hidden" id="priceInput" value="<%=p.getProductMoney() %>"/>
						<label id="price">원</label>
					</td>
				</tr>
				<tr>
					<td width="300px">
						<input type="button" value="장바구니" id="basketBtn" class="detailBtn"/>
					</td>
					<td width="300px">
						<input type="submit" value="구매하기" id="orderBtn" class="detailBtn"/>
					</td>
				</tr>
				<tr>
					<th>상품 설명</th>
					<td colspan="5">
						<div id="titleContentArea">
							<p id="contents"><%= (b.getContents()).replace("\r\n","<br>") %></p>
						</div>
					</td>
				</tr>
				<tr>
					<th colspan="5" id="commentHeader">댓글 작성</th>
				</tr>
				<tr>
					<td colspan="5" ><textarea id="commentContent" rows="3" cols="150" style="resize:no"></textarea></td>
				</tr>
				<tr>
					<td rowspan="4" colspan="5" ><button id="addBtn">댓글 등록</button></td>
				</tr>
			</table>
		</form>
		<table id="commentHeagerTable" border="1" align="center">
			<tr>
				<td colspan="2" style="width:100px">작성자</td>
				<td colspan="3" style="width:400px">내용</td>
				<td style="width:200px">작성일</td>
				<td style="width:100px">추천수</td>
			</tr>
		</table>
		<table id="commentSelectTable" border="1" align="center">
			<tbody>
			</tbody>
		</table>
	</div>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
	<script>
		$(function(){
			var postsId = <%= b.getPostsId()%>;
			$(document).ready(function(){

				$.ajax({
					url:"selectComment.pd",
					data:{postsId:postsId},
					type:"post",
					success:function(data){
						var $commentSelectTable = $("#commentSelectTable tbody");
						$commentSelectTable.html("");
						for(var key in data){
							var $tr = $("<tr>");
							var $writeTd = $("<td>").text(data[key].memberId).css("width", "100px");
							var $contentTd = $("<td>").text(data[key].commentContents).css("width","400px");
							var $dateTd = $("<td>").text(data[key].commentDate).css("width", "200px");
							var $recommend = $("<td>").text(data[key].recommendCount).css("width", "100px");
							$tr.append($writeTd);
							$tr.append($contentTd);
							$tr.append($dateTd);
							$tr.append($recommend);
							$commentSelectTable.append($tr);
						}
					},
					error:function(){
						alert("댓글 입력 실패");
					}
				});
			});
		});
		$("#writer").on("click", function(){
			window.open("<%= request.getContextPath()%>/myInfo.me?userId=<%=b.getWriter()%>", '<%= b.getWriter()%>', 'width=400, height=600, location=no, toolbar=no, fullscreen=no');
		});
		$(function(){
			var price = numeral($("#priceInput").attr('value')).format( '0,0' );

			$("#price").text(price+"원");
			$("#addBtn").click(function(){
				var writer = <%= loginUser.getMemberNo()%>;
				var content = $("#commentContent").val();
				var postsId = <%= b.getPostsId()%>;

				$.ajax({
					url:"insertComment.pd",
					data:{writer:writer, content:content, postsId:postsId},
					type:"post",
					success:function(data){
						var $commentSelectTable = $("#commentSelectTable tbody");
						$commentSelectTable.html("");

						for(var key in data){
							var $tr = $("<tr>");
							var $writeTd = $("<td>").text(data[key].memberId).css("width", "100px");
							var $contentTd = $("<td>").text(data[key].commentContents).css("width","400px");
							var $dateTd = $("<td>").text(data[key].commentDate).css("width", "200px");
							var $recommend = $("<td>").text(data[key].recommendCount).css("width", "100px");
							$tr.append($writeTd);
							$tr.append($contentTd);
							$tr.append($dateTd);
							$tr.append($recommend);
							$commentSelectTable.append($tr);
						}
					},
					error:function(){
						alert("댓글 입력 실패");
					}
				});
			});
		});
	</script>
</body>
</html>