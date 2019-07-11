<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
h4 {
	text-align:center;
}
input {
	margin:0 auto;
	border-radius: 5px;
	height:32px;
}
.btn_update {
	height:30px; 
	width:100%;
	margin:0 auto;
	border: 1px solid #ffd8d9;
	font-size: 15px;
	font-family:'Nanum Gothic', sans-serif;
	font-weight:550;
	border-radius: 5px;
	background-color: #ffd8d9;
	color: black;
}
</style>
</head>
<header><%@ include file="../hfl/header.jsp" %></header>
<body>
<br><br><br><br>
	<h4 align="center"><%-- <%=loginUser.getUserName() %> --%>님의 회원 정보 수정</h4>
	<br><br>
	<form action="" method="post">
		<table align="center" class="change_info">
			<tr>
				<td><label>아이디</label></td>
				<td><input type="text" name="userId" readonly><br></td>
			</tr>
				<td><br><td>
			<tr>
				<td><label>비밀번호&nbsp;</label></td>
				<td><input type="password" name="password">&nbsp;</td>
				<td><button type="button" class="btn_update">수정</button><br></td>
			</tr>
				<td><br><td>
			<tr>
				<td><label>이름</label></td>
				<td><input type="text" name="userName"></td>
			</tr>
				<td><br><td>
			<tr>
				<td><label>Email</label></td>
				<td><input type="email" name="email"></td>
			</tr>
				<td><br><td>
			<tr>
				<td><label>연락처</label></td>
				<td><input type="tel" name="phone"></td>
			</tr>
				<td><br><td>
			<tr>
				<td><label>주소</label></td>
				<td><input type="text" name="address"></td>
			</tr>
			<td><br><td>
			<tr align="center">
				<td colspan="2">
					<input type="submit" value="수정" class="btn_update">
				</td>
			</tr>
		</table>
	</form>
<%-- 	<script>
		$(function(){
			$("input[name=hobby]").each(function(){
				var arr = '<%= loginUser.getHobby() %>'.split(",");
				console.log(arr);
				for(var i = 0; i < arr.length; i++){
					if($(this).val() == arr[i]){
						$(this).attr("checked", true);
					}
				}
			})
		});
		
		function deleteMember(){
			var answer = window.confirm("정말로 탈퇴하실 건가요?");
			
			if(answer == true){
				location.href = '<%=request.getContextPath()%>/deleteMember';
			}
		}
	</script> --%>
	<br><br><br>
	<footer><%@ include file="../hfl/footer.jsp" %></footer>
</body>
</html>