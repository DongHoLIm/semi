<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.bvengers.user.member.model.vo.Member"%>
    <%
    Member loginUser = (Member) session.getAttribute("loginUser");
    %>
<!DOCTYPE html>
<html>
<head>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<!-- include summernote-ko-KR -->
<!-- <script src="lang/summernote-ko-KR.js"></script> -->
<meta charset="UTF-8">
<title>메인메뉴</title>
<style>
</style>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>

        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">중고 愛 민족</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
            <li><a href="/sp/views/user/product/productList.jsp"> 구매 </a></li>
             <li><a href="#" onclick="payUpload()"> 상품등록 </a></li>
           <li><a href="/sp/views/user/basket/basket.jsp"> 장바구니 </a></li>
           <li><a href="<%= request.getContextPath()%>/selectNotice.no"> 게시판</a></li>
           <li><a href="<%=request.getContextPath()%>/listMyPage.mp">마이페이지</a></li>
       <li><a href="/sp/views/user/serviceCenter/qna.jsp"> 고객센터</a></li>
         </ul>

      <form class="navbar-form navbar-right" role="search">
        <div class="form-group input-group">
          <input type="text" class="form-control" placeholder="Search..">
          <span class="input-group-btn">
            <button class="btn btn-default" type="button">
              <span class="glyphicon glyphicon-search"></span>
            </button>
          </span>
        </div>
      </form>
      <% if(loginUser == null) {%>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/sp/views/user/login/login.jsp"><span class="glyphicon glyphicon-user"></span> login</a></li>
      </ul>
      <%}else if(loginUser!=null && !loginUser.getMemberId().equals("admins")){ %>
       <ul class="nav navbar-nav navbar-right">
        <li><a onclick="logout();"><span class="glyphicon glyphicon-user" ></span> logOut</a></li>
      </ul>
      <%}%>
    </div>
  </div>
  <script>
  	function logout(){
		location.href="<%=request.getContextPath()%>/logout.me";
  	}
  	
  	function goMyPage(){
		location.href="<%=request.getContextPath()%>/listMyPage.mp";
	}
  	
  	function payUpload(){
  		
  	    if(<%= loginUser == null %>) {
  	        alert("로그인 후 이용해 주세요.");
 	         location.href='/sp/views/user/login/login.jsp'; 
  	    } else{
  	         location.href='/sp/views/user/product/productEnroll.jsp'; 
  	    }
  	}
  </script>
</nav>
</body>
</html>
