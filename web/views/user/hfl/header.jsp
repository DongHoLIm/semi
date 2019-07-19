<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>메인메뉴</title>
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
      <a class="navbar-brand" href="#">중고 愛 민족</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
            <li><a href="/sp/views/user/product/productList.jsp"> 구매 </a></li>
             <li><a href="/sp/views/user/product/productEnroll.jsp"> 상품등록 </a></li>
           <li><a href="/sp/views/user/basket/basket.jsp"> 장바구니 </a></li>
           <li><a href="/sp/views/user/board/board.jsp"> 게시판</a></li>
              <li><a href="/sp/views/user/mypage/myPage.jsp"> 마이페이지</a></li>
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
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/sp/views/user/login/login.jsp"><span class="glyphicon glyphicon-user"></span> login</a></li>
      </ul>
    </div>
  </div>
</nav>
</body>
</html>
