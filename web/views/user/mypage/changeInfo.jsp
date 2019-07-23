<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	border: 1px solid black;
	font-size: 15px;
	font-family:'Nanum Gothic', sans-serif;
	font-weight:550;
	border-radius: 5px;
	background-color: #FFF;
}
</style>
</head>
<body>
<header><%@ include file="../hfl/header.jsp" %></header>
<%  
	String [] add =(String []) loginUser.getAddress().split(" "); 
	%>
	<header><%@ include file="../hfl/myPageList.jsp"%></header>
<br><br><br><br>
	<h4 align="center"><%=loginUser.getMemberName() %>님의 회원 정보 수정</h4>
	<br><br>
	<form action="<%=request.getContextPath()%>changeInfo.mp" method="post">
		<table align="center" class="change_info">
			<tr>
				<td><label>아이디</label></td>
				<td><input type="text" name="memberId" value="<%=loginUser.getMemberId()%>" readonly><br></td>
			</tr>
				<td><br><td>
			<tr>
				<td><label>비밀번호&nbsp;</label></td>
				<td><input type="password" name="memberpassword"></td>
			</tr>
				<td><br><td>
			<tr>
				<td><label>이름</label></td>
				<td><input type="text" name="memberName" value="<%=loginUser.getMemberName()%>" readonly></td>
			</tr>
				<td><br><td>
			<tr>
				<td><label>Email</label></td>
				<td><input type="email" name="email" value="<%=loginUser.getEmail()%>"></td>
			</tr>
				<td><br><td>
			<tr>
				<td><label>연락처</label></td>
				<td><input type="tel" name="phone" value="<%=loginUser.getPhone()%>"></td>
			</tr>
				<td><br><td>
			<tr>
				<td><label>우편번호</label></td>
				<td><input type="text" name="zipCode" value="<%=add[0]%>"></td>
				<td><div id="ckZip">검색</div></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address1" value="<%=add[1]%>"></td>
				<td></td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td><input type="text" name="address2" value="<%=add[2]%>"></td>
				<td></td>
			</tr>
			<td><br><td>
			<tr align="center">
				<td colspan="2">
					<button type="button" class="btn_update">수정</button>
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