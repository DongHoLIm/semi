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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
<%-- function ckbtn(){
if(<%=msg%>){
	alert("인증성공!");
}else{
	alert("인증 실패!");
}
} --%>
function ckbtn(data){
	var a = $("input[id='key']").val();
	console.log(data);
	console.log(a);
	if(data===a){
		$(function(){ 
			$.ajax({
				url:"<%=request.getContextPath() %>/checkmail.me",
				data:{"status":1},
				success:function(){}
			});
		});
	}else{
		$(function(){ 
			$.ajax({
				url:"<%=request.getContextPath() %>/checkmail.me",
				data:{"status":0},
				success:function(){
					
				}
			});
		});
		alert("즉당히좀 맞추세요");
	}
}
</script>
</head>
<body>
	<h1>인증번호 확인란</h1>
	<input type="text" id="key" name="key" placeholder="인증번호 입력칸" style="width:50%;">
	<button value="확인" class="chbtn" onclick="ckbtn(<%=check%>);">인증하기</button> 
	
</body>
</html>