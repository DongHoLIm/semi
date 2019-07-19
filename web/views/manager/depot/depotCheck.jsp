<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#checkInsert{
		margin: 0 auto;
	}
	#productImage{
		width:45%;
	}
	table{
		text-align: center;
		margin:0 auto ;
	}
	tr{
		border:1px solid black;
	}
	td{
		border:1px solid black;
	}
	button{
		background:black;
		color:white;
	}
</style>
</head>
<body>
<%@ include file = "../hfl/managerHeader.jsp" %>
	<br />
	<br />
	<h3 align="center">검수 상태변경</h3>
	<br />
	<hr />
	<br />
	<div id="checkInsert">
		<form action="">
		<table>
			<tr>
				<td rowspan="4" width="200px" height="300px">
				<img alt="" src="<%=request.getContextPath()%>/images/flower4.PNG" width="200px" height="300px">
				</td>
			
				<td><label for="">상품명</label></td>
				<td><input type="text" style="float:left" readonly /></td>
			</tr>
			<tr>
				<td><label for="">상품코드</label></td>
				<td><input type="text" style="float:left" readonly/></td>
			</tr>
			<tr>
				<td><label for="">카테고리</label></td>
				<td><input type="text" style="float:left" readonly/></td>
			</tr>
			<tr>
				<td>창고 위치</td>
				<td align="left">
					<select name="" id="">
						<option value="">A</option>
						<option value="">B</option>
						<option value="">C</option>
						<option value="">D</option>
					</select>
					섹션
					<select name="" id="" >
						<option value="">1</option>
						<option value="">2</option>
						<option value="">3</option>
					</select>
					층
				</td>
			</tr>
			<tr>
				<td colspan="3"><h4>검수진행상태</h4></td>
			</tr>
			<tr>
				<td colspan="3">
					<button style="color:white;">검수요청</button>&nbsp;&nbsp;&nbsp;
					<button style="color:white;">검수중</button>&nbsp;&nbsp;&nbsp;
					<button style="color:white;">검수 완료</button>&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="3"><h4>검수완료상태</h4></td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="radio" value="pass" name="status"/>통과 &nbsp;&nbsp;&nbsp;
					<input type="radio" value="fail" name="status"/>미통과 &nbsp;&nbsp;&nbsp;
					<input type="radio" value="checkPass" name="status"/>조건부통과 &nbsp;&nbsp;&nbsp;			 		
				</td>
			</tr>
			<tr>
				<td colspan="3"><h4>조건부 통과 사유</h4></td>
			</tr>
			<tr>
				<td colspan="3">
					<textarea name="" id="" cols="100" rows="10"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<button type="submit" id="Btn" style="color:white;" onclick="">검수상태변경</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="reset" id="Btn" style="color:white;">취소</button>
				</td>				
			</tr>
		</table>		
		</form>		
	</div>
</body>
</html>