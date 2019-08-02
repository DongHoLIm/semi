<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<style>
	#array{
		display:none;
	}
</style>
<body>
<h1>신고하기</h1>
	
	<form action = "<%=request.getContextPath()%>/ss.re" method = "post">
	<textarea id = "array" name = "array" ><%= request.getParameter("array")%></textarea>
	<textarea id="content" name="content" placeholder="신고 사유" style="width:50%; height:150px;"></textarea> 
	<br><br>
	<button type ="submit" value="확인" class="postbtn" onclick="postbtn();">신고하기</button> 
	</form>

	

</body>
<script>
	function postbtn(){
		 self.close();   
	}

</script>
</html>