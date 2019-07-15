<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
#fullScreen {
	height: 50%;
	margin: 10px;
}
nav {
   margin-top: 15%;
   margin-right: 5%;
   /* padding-right:5%;
      padding-left:5%; */
}
.cancel {
	text-align:center;
}

#subScreen {
	margin-top:5%;
	margin-bottom:3%;
	width: 67%;
	margin-left: 16.6%;
	height: 100%;
	text-align: left;
}
table{
	width:100%;
	height:100%;
	border:1px solid pink;
	text-align:center;
}
#menubar {
	width: 15.6%;
	height: 100%;
	border: 3px solid #ffd8d9;
	text-align: center;
	padding: 1%;
	float: left;
}

#menuUl {
	margin-right: 20%;
	padding-left: 0px;
	margin: 0px auto;
}

#menubar ul li {
	list-style-type: none;
}

.date-select {
	background: pink;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}

</style>
</head>
<header><%@ include file="../hfl/header.jsp"%></header>
<body>

	<header><%@ include file="../hfl/myPageList.jsp"%></header>
	<!-- <nav
      class="w3-sidebar w3-bar-block w3-animate-left w3-collapse w3-top w3-center"
      style="width:15%; font-weight: bold" id="mySidebar">


      <div class="w3-dropdown-hover" id="pc">
         <a align="center">쇼핑내역</a>
         <div class="w3-dropdown-content w3-border">
            <a href="#" class="w3-button">주문/배송조회</a><br> 
            <a href="#" class="w3-button">취소/반품조회</a><br> 
            <a href="#" class="w3-button">환불/정산내역</a>
         </div>
      </div>

      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <div class="w3-dropdown-hover" id="nettop">
         <a align="center">활동</a>
         <div class="w3-dropdown-content w3-bar-block w3-border">
            <a href="#" class="w3-button">장바구니</a><br> <a href="#"
               class="w3-button">내가쓴게시판</a><br>
         </div>
      </div>

      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <div class="w3-dropdown-hover" id="ect">
         <a align="center">회원정보변경/수정</a>
         <div class="w3-dropdown-content w3-bar-block w3-border">
            <a href="#" class="w3-button">회원정보 변경</a><br> 
            <a href="#" class="w3-button">회원정보 수정</a><br> 
            <a href="#" class="w3-button">회원 탈퇴</a>
         </div>
      </div>

   </nav> -->
   <a style="display: scroll; position: fixed; bottom: 10px; right: 20px;"
      href="#" title="Top">
      <p style="padding: 20px; background: #F66; color: #fff;">맨위로</p>
   </a>
    </aside>
   
	<!-- </div> -->
	<div id="subScreen">
		<h3 style="font-weight: bold">취소 / 반품조회</h3>

		<div class="date-select" align="center">
			<br> <span style="font-weight: bold">기간별조회</span> <span>&nbsp;&nbsp;&nbsp;<input
				type="button" value="1주일">&nbsp;</span> &nbsp;<input type="button" value="15일">&nbsp;
			&nbsp;<input type="button" value="1개월">&nbsp; <input type="date">
			- <input type="date"><br>
			<br>
		</div>
		<br>
		<div align=center>
			<table border="1">
				<tr>
					<th class="cancel">주문일자  </th>
					<th class="cancel">상품정보  </th>
					<th class="cancel">주문상태  </th>
					<th class="cancel">확인/신청</th>
				</tr>
				<tr>
					<td>주문일자내용</td>
					<td><input type="button" onclick="" value="주문상세"></td>
					<td>주문상태내용</td>
					<td>확인/신청내용</td>
				</tr>
				<tr>
					<td>주문일자내용</td>
					<td><input type="button" onclick="" value="주문상세"></td>
					<td>주문상태내용</td>
					<td>확인/신청내용</td>
				</tr>
				<tr>
					<td>주문일자내용</td>
					<td><input type="button" onclick="" value="주문상세"></td>
					<td>주문상태내용</td>
					<td>확인/신청내용</td>
				</tr>
			</table>
		</div>
	</div>
	<br>
</body>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
</html>