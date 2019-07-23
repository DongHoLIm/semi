<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.bvengers.user.member.model.vo.*"%>
    <%
    Member m = (Member) request.getAttribute("m");
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../hfl/managerHeader.jsp"%>
	
	<form>
		<div id="table Area">
			<table id="depotMain" align="center">
				<tr>
					<th class="th"></th>
					<th class="th"></th>
				</tr>
				<tr>
					<th class="th">회원번호</th>
					<td class="td"><input type="text" size="50" name="memberNo" value="<%=m.getMemberNo() %>" readonly></td>
				</tr>
				<tr>
					<th class="th">아이디</th>
					<td class="td"><input type="text" size="50" name="memberId" value="<%=m.getMemberId() %>" readonly></td>
				</tr>
				<tr>
					<th class="th">비밀번호</th>
					<td class="td"><input type="text" size="50" name="password" value="<%=m.getMemberPassword() %>" readonly></td>
				</tr>
				<tr>
					<th class="th">이름</th>
					<td class="td"><input type="text" size="50" name="memberName" value="<%=m.getMemberName() %>" readonly></td>
				</tr>
				<tr>
					<th class="th">이메일</th>
					<td class="td"><input type="text" size="50" name="email" value="<%=m.getEmail() %>" readonly></td>
				</tr>
				<tr>
					<th class="th">주소</th>
					<td class="td"><input type="text" size="50" name="address" value="<%=m.getAddress() %>" readonly></td>
				</tr>
				<tr>
					<th class="th">연락처</th>
					<td class="td"><input type="text" size="50" name="phone" value="<%=m.getPhone() %>" readonly></td>
				</tr>
				<tr>
					<th class="th">가입일</th>
					<td class="td"><input type="text" size="50" name="enrollDate" value="<%=m.getEnrollDate() %>" readonly></td>
				</tr>
				<tr>
					<th class="th">탈퇴일</th>
					<td class="td"><input type="text" size="50" name="retireDate" value="<%=m.getRetireDate() %>" readonly></td>
				</tr>
				<tr>
					<th class="th">탈퇴여부</th>
					<td class="td"><input type="text" size="50" name="retire" value="<%=m.getRetire() %>" readonly></td>
				</tr>
				<tr>
					<th class="th">회원구분</th>
					<td class="td"><input type="text" size="50" name="memberDiv" value="<%=m.getMemberDiv() %>" readonly></td>
				</tr>
				<tr>
					<th class="th">예금주</th>
					<td class="td"><input type="text" size="50" name="accountHolder" value="<%=m.getAccountHolder() %>" readonly></td>
				</tr>
				<tr>
					<th class="th">은행코드</th>
					<td class="td"><input type="text" size="50" name="bankCode" value="<%=m.getBankCode() %>" readonly></td>
				</tr>
				<tr>
					<th class="th">계좌번호</th>
					<td class="td"><input type="text" size="50" name="accountNo" value="<%=m.getAccountNo() %>" readonly></td>
				</tr>
				<tr>
					<th class="th">등급코드</th>
					<td class="td"><input type="text" size="50" name="gradeCode" value="<%=m.getGradeCode() %>" readonly></td>
				</tr>
				<tr>
					<th class="th">판매횟수</th>
					<td class="td"><input type="text" size="50" name="sellCount" value="<%=m.getSellCount() %>" readonly></td>
				</tr>
			</table>
			<br>
			<br>
		</div>
	</form>
</body>
</html>