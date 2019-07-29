<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"import="java.util.* , com.kh.bvengers.user.member.model.vo.*"%>
	<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
    Member loginUser = (Member) session.getAttribute("loginUser");
	MemberPageInfo pi = (MemberPageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	%>	
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
table th{
text-align:center;
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
	<%-- <%if(loginUser == null || !loginUser.getMemberId().equals("admin")){ 
		request.setAttribute("msg", "잘못된 경로로 접근했어요");
		request.getRequestDispatcher("/views/common/errorPagePrompt.jsp").forward(request, response);
	}else{%> --%>
	<div id="inOutMain">
		<br>
		<br>
		<form action="<%=request.getContextPath()%>/memberList.me" method="post">
		<div id="inOutButton" align="center">
			<select name="selecthowsearch" style="width: 30%;">
				<option value="findId">아이디로 조회</option>
				<option value="findName">이름으로 조회</option>
				<option value="findLevel">등급으로 조회</option>
			</select> <input type="search" name="searchValue">
			<button type="submit"
				style="border-radius: 5px; background-color: black; color: white;">조회</button>
		</div>
		<br>
		<br>
		</form>
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
					<th class="th">주소</th>
					<th class="th">가입일</th>
					<th class="th">판매횟수</th>
				</tr>
				<%for(Member m : list){ %>
				<tr>
					<td><input type="checkbox" class="chk"></td>
					<td><%=m.getMemberId() %></td>
					<td><%=m.getMemberName() %></td>
					<td><%=m.getPhone() %></td>
					<td><%=m.getGradeCode() %></td>
					<td><%=m.getAddress()%></td>
					<td><%=m.getEnrollDate() %></td>
					<td><%=m.getSellCount() %></td>
					<td><button class="mbdetail">상세보기</button></td>
				</tr>
				<%} %>
			</table>
			<br>
			<br>
		</div>
	</div>

</body>
</html>