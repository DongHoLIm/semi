<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String check = (String) request.getSession().getAttribute("mailkey");
    String memberId = (String) request.getAttribute("memberId");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
function okok(){
	var key="<%=check%>";
	var userinput=$("#userinput").val();
	var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
	if(($("#password").val()=="")||($("#password2").val()=="")){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	
	if((!getCheck.test($("#password").val()))||!getCheck.test($("#password2").val())){
		alert("비밀번호를 다시 설정하세요");
		return false;
	}
	
	if(($("#password").val() == ($("#password2").val()))&& $("userinput").val()!=""){
		alert("비밀번호가 변경되었습니다!");
		$("form").submit();	
	}else{
		alert("비밀번호를 다시 설정하세요");
		return false;
	}
	
	
	/* if(key==userinput){
		alert("임시비밀번호가 일치합니다.");
		console.log(key);
		$("form").submit();
	} */
 	$(function(){
		$(".okok").click(function(){
		var status="<%=check%>";
		var checkuser = $("#userinput").val();
			
		$.ajax({
			url:"checkmail.me",
			type:"post",
			data:{mailcheck:status,checkuser:checkuser},
			success:function(data){
				if(data=="success"){
				alert("인증이 완료되었습니다.");
				}else if(data=="fail"){
					alert("인증 실패!\n 다시 설정해주세요");
					
				}
			}
		});
	}); 
		});
}
</script>
</head>
<body>
	<form action="<%=request.getContextPath()%>/changePwd.me" method="post">
	<h1>비밀번호 재설정</h1>
	<input type="text" id="userinput" name="userinput" placeholder="비밀번호를 입력해주세요" style="width:50%;">
	<input type="password" id="password" name="password" placeholder="바꿀 비밀번호를 입력하세요" style="width:50%">
	<input type="password" id="password2" name="password2" placeholder="한번 더 입력하세요" style="width:50%">
	<input type="button" value="확인" class="okok" onclick="okok();">
	</form>
</body>
</html>