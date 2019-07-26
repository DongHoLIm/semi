<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String msg = (String) request.getAttribute("msg");
	String check = (String) request.getSession().getAttribute("mailkey");
%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<form action="<%=request.getContextPath()%>/checkmail.me" method="post">
		<h1>인증번호 확인란</h1>
		<input type="text" id="key" name="key" placeholder="인증번호 입력칸"
			style="width: 50%;"> <input type="text" id="hiddenvalue"
			name="hiddenvalue" value="0"style="display: none">
		<button value="확인" class="chbtn" onclick="ckbtn();">인증하기</button>
		<input type="button" id="cancle" name="cancle" onclick="cancle();"
			value="취소하기">
		<h1><%=check%></h1>
	</form>
	<script>
function cancle(){
	window.close();
}
	
$(function(){
	
	var msg = "<%=msg%>";
	if(msg.equal(<%=msg%>)){
	alert(msg);
	window.close();
	}
})
function chbtn(){
	
			$("form").submit();
		}
	</script>
</body>
</html>