<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
  @media screen and (max-width: 767px) {
     /*  .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;}  */
    }
    .myPage{
    	list-style: none;
    
    }
    /* a{
    	color:black;
    	text-decoration: none;
    } */
     a:link { 
     color: white; 
     }
	 a:visited {
	  color: black; 
	  text-decoration: none;
	  }
</style>
<title>Insert title here</title>
</head>
<body>
	<!-- header 영역 -->
<body>
 <div class="container" style="float: left; width: 20%; padding-top: 10%; "> 
  <div class="panel-group" id="accordion" >
    <div class="panel panel-default">
      <div class="panel-heading" style="background: black; color:white">
        <h4 class="panel-title" >
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">쇼핑내역</a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse in">
        <div class="w3-dropdown-content w3-bar-block w3-border">
        	<div class="panel-body">
	        	<ul class = "myPage">
	        		<li><a href="/sp/views/user/mypage/myPage.jsp">주문내역</a></li>
	        		<li><a href="/sp/views/user/mypage/orderLook.jsp">주문/배송조회</a></li>
	        		<li><a href="/sp/views/user/mypage/cancleLook.jsp">취소/반품조회</a></li>
	        		<li><a href="/sp/views/user/mypage/refund.jsp">환불/정산내역</a></li>
	        	</ul>
        	</div>
        </div>
      </div>
    </div>
    <div class="panel panel-default" >
      <div class="panel-heading" style="background: black; color:white">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">회원정보</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">
        	<ul>
        		<li><a href="/sp/views/user/mypage/changeInfo.jsp">회원정보 변경</a></li>
        		<li><a href="/sp/views/user/mypage/memberSignOut.jsp" class="w3-button">회원 탈퇴</a></li>
        	</ul>
        </div>
      </div>
    </div>    
  </div>
</div>
</body>
<!-- footer 영역 -->

</html>









