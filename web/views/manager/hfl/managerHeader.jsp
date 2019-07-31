<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script><meta charset="UTF-8">
<title>메인메뉴</title>
</head>
<body>
<%-- <% if(loginUser != null && loginUser.getMemberId().equals("admin")) {%> --%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath()%>/smnl.mm">중고 愛 민족</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
             <li class="dropdown"><a class="dropdwn-toggle" data-toggle="dropdown" href="#"> 상품관리<span class="caret"></span> </a>
               <ul class="dropdown-menu">
               <li><a href="/sp/views/manager/product/productmanagement.jsp">상품조회/수정/등록</a></li>
               <li><a href="/sp/views/manager/product/powerProductPage.jsp">파워 상품 관리</a></li>
               <li><a href="<%=request.getContextPath()%>/selectCalculate">정산 내역 관리</a></li>
               <li><a href="<%=request.getContextPath()%>/productManagement">구매 내역 관리</a></li>
               <li><a href="/sp/views/manager/product/refundManagement.jsp">환불 내역 관리</a></li>
               </ul>
            </li>
             <li class="dropdown"><a class="dropdwn-toggle" data-toggle="dropdown" href="#"> 회원관리<span class="caret"></span> </a>
                <ul class="dropdown-menu">
               <li><a href="<%=request.getContextPath()%>/memberList.me">고객정보</a></li>
               <li><a href="<%=request.getContextPath()%>/badmanlist.me">경고회원 관리</a></li>
               <li><a href="<%=request.getContextPath()%>/reportList.me">신고정보</a></li>
            </ul>
             </li>
           <li class="dropdown"><a class="dropdwn-toggle" data-toggle="dropdown" href="#"> 통계 <span class="caret"></span></a>
              <ul class="dropdown-menu">
               <li><a href="<%=request.getContextPath()%>/memberStatistics">고객현황</a></li>
               <li><a href="<%=request.getContextPath()%>/views/manager/statistics/salesStatistics.jsp">매출현황</a></li>
            </ul>
           </li>
           <li class="dropdown"><a class="dropdwn-toggle" data-toggle="dropdown" href="#"> 게시글관리 <span class="caret"></span></a>
               <ul class="dropdown-menu">
               <li><a href="<%=request.getContextPath()%>/smbs.mb">게시판 관리</a></li>
               <li><a href="<%=request.getContextPath()%>/smqs.mq">고객센터 관리</a></li>
               </ul>
           </li>
              <li class="dropdown"><a class="dropdwn-toggle" data-toggle="dropdown" > 창고관리 <span class="caret"></span></a>
               <ul class="dropdown-menu">
               <li><a href="<%=request.getContextPath() %>/listall.dp">창고 전체 현황</a></li>
               <li><a href="<%=request.getContextPath() %>/list.dp">검수요청관리</a></li>
               <li><a href="<%=request.getContextPath()%>/barcode.dp">바코드 출력</a></li>
               <li><a href="<%=request.getContextPath()%>/inDepot.dp">입고 관리</a></li>
               <li><a href="<%=request.getContextPath()%>/outProductList.dp">출고 관리</a></li>               
            </ul>
              </li>
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
      <ul class="nav navbar-nav navbar-right">
        <li><a onclick="logout();"><span class="glyphicon glyphicon-user"></span>관리자</a></li>
      </ul>
    </div>
    <script>
    	function logout(){
    		location.href="<%=request.getContextPath()%>/logout.me";
    	}
    </script>
  </div>
</nav>
<%-- <%} %>
 --%></body>
</html>