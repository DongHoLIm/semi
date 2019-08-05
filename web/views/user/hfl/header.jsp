<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.bvengers.user.member.model.vo.Member"%>

    <%
    Member loginUser = (Member) session.getAttribute("loginUser");
    %>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<link href="https://fonts.googleapis.com/css?family=Poor+Story&display=swap" rel="stylesheet">
<!-- include summernote-ko-KR -->
<!-- <script src="lang/summernote-ko-KR.js"></script> -->
<meta charset="UTF-8">
<title>메인메뉴</title>
<style>
* {
	font-family: 'Poor Story', cursive;
	margin: 0;
	padding: 0;
}

html, css {
	width: 100%;
	height: 100%;
}

.position {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	margin-top: 15%;
}

#personal {
	color: white;
	text-decoration: none;
	position: absolute;
	bottom: 15px;
	right: 2%;
}

.spot {
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
}

.svg-wrapper {
	margin-top: 0;
	position: relative;
	width: 150px;
	height: 40px;
	display: inline-block;
	border-radius: 3px;
	margin-left: 5px;
	margin-right: 5px
}

#shape {
	stroke-width: 3px;
	fill: transparent;
	stroke: red;
	stroke-dasharray: 85 400;
	stroke-dashoffset: -220;
	transition: 1s all ease;
}

#text {
	margin-top: -35px;
	text-align: center;
}

#text a {
	color: white;
	text-decoration: none;
	font-weight: 100;
	font-size: 1.1em;
}

.svg-wrapper:hover #shape {
	stroke-dasharray: 50 0;
	stroke-width: 3px;
	stroke-dashoffset: 0;
	stroke: red;
}

#chatLi:hover {
	cursor: pointer;
}

.myPageBtn:hover {
	cursor: pointer;
}

#logoDiv {
	margin-bottom: 10px;
}

.navbar-brand:hover {
	-webkit-transform: scale(1.1); /*  크롬 */
	-moz-transform: scale(1.1); /* FireFox */
	-o-transform: scale(1.1); /* Opera */
	transform: scale(1.1);
	transition: transform .35s;
	-o-transition: transform .35s;
	-moz-transition: transform .35s;
	-webkit-transition: transform .35s;
}

#logoImg {
	width: 25%;
}
#logoImg:hover, input[type=button]:hover {
	-webkit-transform: scale(1.1); /*  크롬 */
	-moz-transform: scale(1.1); /* FireFox */
	-o-transform: scale(1.1); /* Opera */
	transform: scale(1.1);
	transition: transform .35s;
	-o-transition: transform .35s;
	-moz-transition: transform .35s;
	-webkit-transition: transform .35s;
}
li:hover, button:hover {
	-webkit-transform: scale(1.2); /*  크롬 */
	-moz-transform: scale(1.2); /* FireFox */
	-o-transform: scale(1.2); /* Opera */
	transform: scale(1.2);
	transition: transform .35s;
	-o-transition: transform .35s;
	-moz-transition: transform .35s;
	-webkit-transition: transform .35s;
}

</style>
</head>
<body>
<div align="center" id="logoDiv">
	<a href="index.jsp"><img src="<%= request.getContextPath()%>/images/logo.jpg" id="logoImg"/></a>
</div>
<nav class="navbar navbar-inverse" style="background:#fffec2">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>

        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" style="color:black" href="<%=request.getContextPath()%>/index.jsp">중고 愛 민족</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
           <li><a style="color:black" href="<%=request.getContextPath()%>/select.pd"> 구매 </a></li>
           <li><a style="color:black" href="<%=request.getContextPath() %>/views/user/product/productEnroll.jsp"> 상품등록 </a></li>
           <li><a style="color:black" href="<%=request.getContextPath()%>/basketAllList.bk"> 장바구니 </a></li>
           <li><a style="color:black" href="<%= request.getContextPath()%>/selectNotice.no"> 게시판</a></li>
           <% if(loginUser != null) {%>
           <li><a style="color:black" href="<%=request.getContextPath()%>/listMyPage.mp">마이페이지</a></li>
           <%} else {%>
           <li class="byPageBtn"><a class="myPageBtn" style="color:black" onclick="myPage();" >마이페이지</a></li>
           <script>
				function myPage(){
					if(confirm("로그인 후 이용해주시기 바랍니다.")){
						location.href="<%=request.getContextPath()%>/views/user/login/login.jsp";
					}
				}
           </script>
           <%} %>
          <% if(loginUser != null) {%>
       	   <li><a style="color:black" href="<%=request.getContextPath()%>/sfqs.qo"> 고객센터</a></li>
           <%} else {%>
            <li><a style="color:black" href="<%=request.getContextPath()%>/noUserService.nu"> 고객센터</a></li>
           <%} %>
         </ul>
      <% if(loginUser == null) {%>
      <ul class="nav navbar-nav navbar-right">
        <li><a style="color:black" href="/sp/views/user/login/login.jsp"><span class="glyphicon glyphicon-user"></span> login</a></li>
      </ul>
      <%}else if(loginUser!=null && !loginUser.getMemberId().equals("admins")){ %>
       <ul class="nav navbar-nav navbar-right"style="color:black">
        <li><a style="color:black"><span class="glyphicon glyphicon-user" ></span> <%= loginUser.getMemberId() %> 님 환영합니다.</a> </li>
        <li><a style="color:black" href="<%=request.getContextPath()%>/logout.me">logOut</a></li>
      	<li id="chatLi" onclick="submit();"> <a style="color:black">채팅 문의 </a></li>
      </ul>
		<script>
		function submit(){
			var no = <%=loginUser.getMemberNo()%>;
			location.href="<%=request.getContextPath()%>/chat.ch?no="+no;
		}
		</script>
      <%}%>

    </div>
  </div>
</nav>
</body>
</html>
