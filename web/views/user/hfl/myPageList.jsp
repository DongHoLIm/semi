<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import = "com.kh.bvengers.user.member.model.vo.*"
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
@media screen and (max-width: 767px) { /*  .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;}  */
}

.navbar {
   border-right : 3px solid #ffe6e6;
   border-bottom: 3px solid #ffe6e6;
}

li {
	list-style: none;
}

.myPage {
	list-style: none;
}

a {
	color: black;
	text-decoration: none;
	a: link{
     color: white;
}

a:visited {
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
	<!-- header 영역 -->
<body>

 <div class="container" style="float: left; width: 20%; padding-top: 10%; ">
  <div class="panel-group" id="accordion" >
    <div class="panel panel-default">
      <div class="panel-heading" style="background:#ffe6e6; color:black">
        <h4 class="panel-title" >
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">쇼핑내역</a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse in">
        <div class="w3-dropdown-content w3-bar-block w3-border">
        	<div class="panel-body">
	        	<ul class = "myPage">
	        		<li><a href="<%=request.getContextPath()%>/orderLook.mp">주문조회</a></li>
	        		<li><a href="<%=request.getContextPath()%>/mySaleProduct.mp">My판매현황</a></li>
	        		<li><a href="<%=request.getContextPath()%>/cancelLook.mp">주문취소조회</a></li>
	        		<li><a href="<%=request.getContextPath()%>/refundList.mp">환불/정산내역</a></li>
	        	</ul>
        	</div>
        </div>
      </div>
    </div>
    <div class="panel panel-default" >
      <div class="panel-heading" style="background: #ffe6e6; color:black">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">회원정보</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">
	        <div class="mypage">
	        	<ul>
	        		<li><a href="/sp/views/user/mypage/memberInfo.jsp">회원정보 변경</a></li>
	        		<li><a href="/sp/views/user/mypage/memberSignOut.jsp">회원 탈퇴</a></li>
	        	</ul>
	        </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>









