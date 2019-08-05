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
#chatLi:hover{
	cursor: pointer;
}
.myPageBtn:hover{
	cursor: pointer;
}
*{ 
font-family: 'Poor Story', cursive; 


}
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
      <a class="navbar-brand" style="color:white" href="<%=request.getContextPath()%>/index.jsp">중고 愛 민족</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
            <li><a style="color:white" href="<%=request.getContextPath()%>/select.pd"> 구매 </a></li>
             <li><a style="color:white" href="<%=request.getContextPath() %>/views/user/product/productEnroll.jsp"> 상품등록 </a></li>
           <li><a style="color:white" href="<%=request.getContextPath()%>/basketAllList.bk"> 장바구니 </a></li>
           <li><a style="color:white" href="<%= request.getContextPath()%>/selectNotice.no"> 게시판</a></li>
           <% if(loginUser != null) {%>
           <li><a style="color:white" href="<%=request.getContextPath()%>/listMyPage.mp">마이페이지</a></li>
           <%} else {%>
           <li class="byPageBtn"><a class="myPageBtn" style="color:white" onclick="myPage();" >마이페이지</a></li>
           <script>
				function myPage(){
					if(confirm("로그인 후 이용해주시기 바랍니다.")){
						location.href="<%=request.getContextPath()%>/views/user/login/login.jsp";
					}
				}
           </script>
           <%} %>
          <% if(loginUser != null) {%>
       	   <li><a style="color:white" href="<%=request.getContextPath()%>/sfqs.qo"> 고객센터</a></li>
           <%} else {%>
            <li><a style="color:white" href="<%=request.getContextPath()%>/noUserService.nu"> 고객센터</a></li>
           <%} %>
         </ul>
      <% if(loginUser == null) {%>
      <ul class="nav navbar-nav navbar-right">
        <li><a style="color:white" href="/sp/views/user/login/login.jsp"><span class="glyphicon glyphicon-user"></span> login</a></li>
      </ul>
      <%}else if(loginUser!=null && !loginUser.getMemberId().equals("admins")){ %>
       <ul class="nav navbar-nav navbar-right">
        <li><a style="color:white" href="<%=request.getContextPath()%>/logout.me"><span class="glyphicon glyphicon-user" ></span> logOut</a></li>
      	<li id="chatLi" onclick="submit();"> <a style="color:white">채팅 문의 </a></li>
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
