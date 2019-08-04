<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.bvengers.manager.depot.model.vo.*"%>
  <%
  	String value = request.getParameter("value");
  	String [] str =value.split(",");
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#checkInsert{
		margin: 0 auto;
		width: 60%;
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
		width:724px;
		height:40px;
	}
	button{
		background:black;
		color:white;
	}
</style>
</head>
<body>
<%@ include file = "/views/manager/hfl/managerHeader.jsp" %>
	<br />
	<br />
	<h3 align="center">검수 상태변경</h3>
	<br />
	<hr />
	<br />
	<div id="checkInsert">
		<form action="<%=request.getContextPath()%>/requestCheck.dp" method="post">
		<table>
			<tr>
				<td rowspan="5" width="200px" height="300px">
				<img alt="" src="<%=request.getContextPath()%>/thumbnail_uploadFiles/<%=str[3] %>" width="200px" height="300px">
				</td>

				<td><label for="">상품명</label></td>
				<td><label for=""><%=str[1] %></label></td>
				<td hidden><input type="text" value="<%=str[1] %>" name="productName" /></td>
			</tr>
			<tr>
				<td><label for="">상품코드</label></td>
				<td><label for=""><%=str[0] %></label></td>
				<td hidden><input type="text" value="<%=str[0] %>" name="productCode" /></td>
			</tr>
			<tr>
				<td><label for="">카테고리</label></td>
				<td><label for=""><%=str[2]%></label></td>
				<td hidden><input type="text" value="<%=str[2] %>" name="productCate" /></td>
			</tr>
			<tr>
				<td>창고 위치</td>
				<td align="left">
					<select name="root" id="">
						<option value="PC">PC</option>
						<option value="NOTE">노트북</option>
						<option value="PRO">가전제품</option>
					</select>
					종류 
					<select name="location" id="">
						<option value="A">A</option>
						<option value="B">B</option>
						<option value="C">C</option>
					</select>
					섹션
					<select name="session" id="" >
						<option value="a">a</option>
						<option value="b">b</option>
						<option value="c">c</option>
					</select>
					층
					<select name="room" id="">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					호
				</td>
			</tr>
			<tr>
				<td>상품무게</td>
				<td>
					<select name="deliveryPrice">
						<option value="2500">500G이하</option>
						<option value="3500">500G~1KG이하</option>
						<option value="4000">1KG~10KG이하</option>
						<option value="5000">10KG~20KG이하</option>
						<option value="6000">20KG~30KG이하</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="3"><h4>검수진행상태</h4></td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="radio" value="requestCheck" name="request" id="request" checked/>검수 요청&nbsp;&nbsp;&nbsp;
					<input type="radio" value="checking" name="request" id="checking"/>검수중 &nbsp;&nbsp;&nbsp;
					<input type="radio" value="complete" name="request" id="complete"/>검수완료 &nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="3" id="complteStatusTitle"><h4>검수완료상태</h4></td>
			</tr>
			<tr>
				<td colspan="3" id="complteStatus">
					<input type="radio" value="pass" name="status" id="pass"/>통과 &nbsp;&nbsp;&nbsp;
					<input type="radio" value="fail" name="status" id="notpass"/>미통과 &nbsp;&nbsp;&nbsp;
					<input type="radio" value="checkPass" name="status" id="reasonPass"/>조건부통과 &nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="3" id="reasonTitle"><h4>조건부 통과 사유</h4></td>
			</tr>
			<tr>
				<td colspan="3" id="reason">
					<textarea name="checkPassContent"  cols="83" rows="10"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<button type="submit" id="Btn" style="color:white;">검수상태변경</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="reset" id="Btn" style="color:white;" onclick="history.back()">취소</button>
				</td>
			</tr>
		</table>
		</form>
		<script>
			$(function (){
				$("#reasonTitle").hide();
				$("#reason").hide();
				$("#complteStatusTitle").hide();
				$("#complteStatus").hide()
				$("input[id='request']").click(function(){
					$("#complteStatusTitle").hide();
					$("#complteStatus").hide()
				});
				$("input[id='checking']").click(function(){
					$("#complteStatusTitle").hide();
					$("#complteStatus").hide()
				});
				$("input[id='complete']").click(function(){
					$("#complteStatusTitle").show();
					$("#complteStatus").show()
				});
				$("input[id='reasonPass']").click(function(){
					$("#reasonTitle").show();
					$("#reason").show();
				});
				$("input[id='pass']").click(function(){
					$("#reasonTitle").hide();
					$("#reason").hide();
				});
				$("input[id='notpass']").click(function(){
					$("#reasonTitle").hide();
					$("#reason").hide();
				});
			});
		</script>
	</div>
</body>
</html>