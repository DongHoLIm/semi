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
function ckbtn(){
	$(function(){
		var status = "<%=check%>";
		var usercheck = $("input[id='key']").val();
		console.log(status);
		console.log(usercheck);
		$.ajax({
			url:"checkmail.me",
			type:"post",
			data:{mailchek:status,checkuser:usercheck},
			success:function(data){
				if(data=="Success"){
					alert("인증이완료되었습니다.");
					window.close();
				}else if(data=="fail"){
					alert("인증번호가 틀렸습니다.");
				}				
			}	
			
		});
	});

}
</script>
</head>
<body>
	<h1>인증번호 확인란</h1>
	<input type="text" id="key" name="key" placeholder="인증번호 입력칸" style="width:50%;">
	<button value="확인" class="chbtn" onclick="ckbtn();">인증하기</button> 

	</script>
</body>
</html>