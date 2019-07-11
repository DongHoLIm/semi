<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.t1 {
	width:60%;
}
.btn_so {
	margin:0 auto;
	width: 80px;
	height: 30px;
	border: 1px solid pink;
	font-size: 13px;
	font-family:'Nanum Gothic', sans-serif;
	font-weight:550;
	border-radius: 5px;
	background-color: pink;
	color: black;
	}
	.btn_so:hover {color:white;}

</style>
</head>
<header><%@ include file="../hfl/header.jsp"%></header>
<body>
	<table class="t1" align="center">
		<tr>
			<td>
				<h2>회원탈퇴</h2>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원탈퇴 전 다음 사항을 꼭 숙지하시기 바랍니다.</p>
			</td>
		</tr>
		<br>
		<table class="t2" align=center>
			<tr>
				<td>
					<div>
						<font color="pink" size=4></font> <font size=3>회원탈퇴 안내</font>
					</div>
				</td>
			</tr>

			<tr>
				<td align=center><textarea name="tos" rows=10 cols=100>회원탈퇴 신청 전 안내 사항을 확인 해 주세요.
회원탈퇴를 신청하시면 현재 로그인 된 아이디는 사용하실 수 없습니다.
회원탈퇴를 하더라도, 서비스 약관 및 개인정보 취급방침 동의하에 따라 일정 기간동안 회원 개인정보를 보관합니다.

- 회원 정보
- 상품 구입 및 대금 결제에 관한 기록
- 상품 배송에 관한 기록
- 소비자 불만 또는 처리 과정에 관한 기록
- 게시판 작성 및 사용후기에 관한 기록
</textarea></td>
			</tr>

			<tr>
				<td><input type="checkbox">안내 사항을 모두 확인하였으며, 이에 동의합니다.<br>
			
		</table>
	</table>
	<br>
	<br>
	<div align="center">
		<a href="join.jsp">
			<button type="button" class="btn_so">회원탈퇴</button>
		</a> <a href="#">
			<button type="button" class="btn_so">취소</button>
		</a>
	</div>
	<br>
	<br>
	<br>
	<br>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>


</body>
</html>