<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/d3js/5.9.0/d3.min.js"></script>
<title>Insert title here</title>
<style>
#board {
	text-align: center;
}

#wirte {
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
	<%@ include file="../hfl/managerHeader.jsp"%>
	<div class="container">
		<br> <br>
		<h2 id="board">공지사항</h2>
		<!-- <table class="table" id = "listArea"> -->
		<table align="center" id="listArea" class="table">
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


			</tbody>
		</table>

		<br>
		<br>

		<div align="center">
			<button
				onclick="location.href='<%=request.getContextPath()%>/views/manager/board/frequentQuestionwrite.jsp'">작성하기</button>
		</div>

	</div>
	<div class="container">
		<br> <br>
		<hr>
		<h2 id="board">게시판</h2>
		<form action="" method="post" align="right">
			<select>
				<option value="title">제목</option>
				<option value="writer">작성자</option>
				<option value="wdate">날짜</option>
			</select> <input type="text"> <input type="submit" value="검색">
		</form>
		<table class="table" id="messageArea">
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
				<%--   <%for(Board m: list1) {%> --%>
				<tr>
					<%--   <input type = "hidden" value = "<%=m.getPostsId() %>"> 
					<td><%= m.getPostsId() %></td>
					<td><%= m.getPostsTitle() %></td>
					<td><%= m.getMemberName()%></td>
					<td><%= m.getCreateDate()%></td>
					<td><%= m.getPostsViews()%></td> --%>
				</tr>
			</tbody>

		</table>
	</div>


</body>
</html>