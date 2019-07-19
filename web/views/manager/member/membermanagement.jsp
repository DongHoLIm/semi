<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#depotMain {
	width: 80%;
	height: 80%;
	border: 2px solid black;
}

tr {
	border: 1px solid black;
}

#th {
	border: 1px solid white;
	background: black;
	color: white;
	text-align: center;
}

#inOutButton {
	padding-left: 8%;
}

#inOutMain {
	border: 2px solid black;
	width: 80%;
	margin: 0 auto;
}

#table Area {
	align: center;
	width: 80%;
}

.th {
	background: black;
	color: white;
	text-align: center;
	border: 1px solid white;
}
.btns{
margin-left:13%;
font-weight:bold;
font-size:3;
}
</style>
<body>
	<%@ include file="../hfl/managerHeader.jsp"%>
	<br />
	<h2 align="center">회원 관리</h2>
	<div id="inOutMain">
		<br>
		<br>
		<div id="inOutButton" align="center">
			<select name="select" style="width: 30%;">
				<option value="findId">아이디로 조회</option>
				<option value="findName">이름으로 조회</option>
				<option value="findLevel">등급으로 조회</option>
			</select> <input type="search" name="searchValue">
			<button type="submit"
				style="border-radius: 5px; background-color: black; color: white;">조회</button>
		</div>
		<br>
		<br>
		<div class="btns">
		선택회원을
		<button value="블랙리스트"
			style="align: center; border-radius: 5px; background-color: black; color: white;">블랙리스트</button>
		<button value="활동정지"
			style="border-radius: 5px; background-color: black; color: white;">활동정지</button>
		</div>
		<br>
		<br>
		<div id="table Area">
			<table id="depotMain" align="center">
				<tr>
					<th class="th"><input type="checkbox"></th>
					<th class="th">아이디</th>
					<th class="th">이름</th>
					<th class="th">전화번호</th>
					<th class="th">등급</th>
					<th class="th">주민등록번호</th>
					<th class="th">방문수</th>
					<th class="th">게시글 수</th>
					<th class="th">최종방문일</th>
					<th class="th">주소</th>
					<th class="th">가입일</th>
					<th class="th">판매횟수</th>
				</tr>
			</table>
			<br>
			<br>
		</div>
	</div>


</body>
</html>