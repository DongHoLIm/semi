<%@page import="com.kh.bvengers.user.chat.model.vo.Chat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Chat> chList = (ArrayList) request.getAttribute("chList");
	System.out.println(chList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅리스트</title>
<style>
#chatListTable {
	margin: 0 auto;
}
#chatListTable td,  #chatListTable th{
	border: 1px solid black;
	text-align: center;
}
#chatListTable th {
	font-size: 1.2em;
}
#chatListTable thead * {
	color: white;
	background: black;
	border: 1px solid white;
	height: 50px;
}

#chatListTable tbody td {
	height: 80px;
}

#chatListTable .memberNo {
	width: 100px;
}

#chatListTable .memberId {
	width: 200px;
}

#chatListTable .chatDate {
	width: 100px;
}
</style>
</head>
<body>
	<%@ include file="../hfl/managerHeader.jsp"%>
	<div id="outer">
		<div id="chatDiv">
			<div class="chatListDiv">
				<table id="chatListTable">
					<thead>
						<tr>
							<th class="tableHeader" colspan="4">회원 문의 내역</th>
						</tr>
						<tr>
							<td class="memberNo">회원번호</td>
							<td class="memberId">회원ID</td>
							<td class="chatDate">문의일</td>
							<td class="chatStatus">완료 여부</td>
						</tr>
					</thead>
					<tbody>
						<%
							for (Chat ch : chList) {
						%>
						<tr>
							<td class="memberNo"><%=ch.getMemberNo()%></td>
							<td class="memberId"><%=ch.getMemberId()%></td>
							<td class="chatDate"><%=ch.getChatDate()%></td>
							<td><button type="button" onclick="location.href='<%=request.getContextPath()%>/joinChat.ch?no='+<%=ch.getMemberNo() %>">답변하기</button></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
	$(function(){
		$("#chatListTable td").onclick(function(){
			window.open('<%=request.getContextPath()%>/send.me?email='+hc+email,'인증번호','width=430,height=450,status=no,scrollbars=yes');
		});
	});
	</script>
</body>
</html>