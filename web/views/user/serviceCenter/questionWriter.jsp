<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
#sec1 {
		width:100%;
		height:100%;
		padding-top:2%;
		padding-right:20%;
		padding-bottom:2%;
		padding-left:20%;
		margin:0 auto;
}

.outer{
	align:center;
	
}
#qtable tr{
	margin-top:5px;
}
#intd{
	border:1px solid black;
}

#btnArea{
	float:right;
}

</style>
</head>
<body>
	<!-- header 영역 -->
	<header><%@ include file="../hfl/header.jsp" %></header>
	
	<section id="sec1">
			<h2 align="center">문의사항 작성</h2>
			<form action="qna.jsp">
				<div id="questionArea">
				<table align="center" id="qtable">
					<tr>
						<td>제목 : </td>
						<td id="intd"><input type="text" id="qtitle" name="qtitle" size="100%"/></td>
					</tr>
					<tr>
						<td>파일첨부 : </td>
						<td id="intd"><input type="file" id="qfile" name="qfile"/></td>
					</tr>
					<tr>
						<td>글 내용 </td>
						<td id="intd"><textarea name="qcontent" id="qcontent" cols="100" rows="15" style="resize:none;"></textarea></td>
					</tr>
				</table>
				</div>
				<div id="btnArea">
					<button type="reset">다시 작성</button>
					<button type="submit">작성 완료</button>
				</div>
				
			</form>
			
	
	</section>
	
	<!-- footer 영역 -->
	<footer><%@ include file="../hfl/footer.jsp" %></footer>
</body>
</html>