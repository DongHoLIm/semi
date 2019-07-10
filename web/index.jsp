<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>

.box{
   text-align: right;
   padding-right:20px;
}

.container-fluid{
   text-align : center;

}

.menu{
   padding :10px;
   text-align: 
}
.carousel-inner > .item > img {
      top: 0;
      left: 0;
      min-width: 100%;
      min-height: 400px;
} 

</style>

</head>
<body>
	<!-- header 영역 -->
	<header><%@ include file="views/user/hfl/header.jsp" %></header>
	
	
 <div class="container">
 	<br><br><h3 align="center">광고배너</h3><br><br><br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

   
    <div class="carousel-inner">
      <div class="item active">
        <img src="images/galxy.PNG" alt="ad1">
      </div>

      <div class="item">
        <img src="images/flower1.PNG" alt="ad2">
      </div>
    
      <div class="item">
        <img src="images/flower2.PNG" alt="ad3">
      </div>
    </div>

    
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div> 


<br>     
<h3 align="center">파워 링크</h3>
<table align="center">
	<tr>
		<td><img src="images/flower3.PNG" class="img-rounded" alt="Cinque Terre" width="304" height="236">&nbsp;&nbsp;</td>
		<td><img src="images/river1.PNG" class="img-rounded" alt="Cinque Terre" width="304" height="236">&nbsp;&nbsp;</td>
		<td><img src="images/river2.PNG" class="img-rounded" alt="Cinque Terre" width="304" height="236">&nbsp;&nbsp;</td>
		<td><img src="images/city1.PNG" class="img-rounded" alt="Cinque Terre" width="304" height="236">&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td><h3><a href="" name="title">진수의 분홍분홍 쿨러</a></h3><br>
			<p>가격: 5000000 <br>
			내용: 노트북쿨러</p>		
		</td>
		<td><h3><a href="" name="title">진수의 분홍분홍 쿨러</a></h3><br>
			<p>가격: 5000000 <br>
			내용: 노트북쿨러</p></td>
		<td><h3><a href="" name="title">진수의 분홍분홍 쿨러</a></h3><br>
			<p>가격: 5000000 <br>
			내용: 노트북쿨러</p></td>
		<td><h3><a href="" name="title">진수의 분홍분홍 쿨러</a></h3><br>
			<p>가격: 5000000 <br>
			내용: 노트북쿨러</p></td>
	</tr>
	<tr>
		<td><img src="images/tower1.PNG" class="img-rounded" alt="Cinque Terre" width="304" height="236">&nbsp;&nbsp;</td>
		<td><img src="images/flower4.PNG" class="img-rounded" alt="Cinque Terre" width="304" height="236">&nbsp;&nbsp;</td>
		<td><img src="images/flower5.PNG" class="img-rounded" alt="Cinque Terre" width="304" height="236">&nbsp;&nbsp;</td>
		<td><img src="images/galxy.PNG" class="img-rounded" alt="Cinque Terre" width="304" height="236">&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td><h3><a href="" name="title">진수의 분홍분홍 쿨러</a></h3><br>
			<p>가격: 5000000 <br>
			내용: 노트북쿨러</p>		
		</td>
		<td><h3><a href="" name="title">진수의 분홍분홍 쿨러</a></h3><br>
			<p>가격: 5000000 <br>
			내용: 노트북쿨러</p></td>
		<td><h3><a href="" name="title">진수의 분홍분홍 쿨러</a></h3><br>
			<p>가격: 5000000 <br>
			내용: 노트북쿨러</p></td>
		<td><h3><a href="" name="title">진수의 분홍분홍 쿨러</a></h3><br>
			<p>가격: 5000000 <br>
			내용: 노트북쿨러</p></td>
	</tr>
</table>
<br><br><br><br><br><br><br>
     
	
	
	
	<!-- footer 영역 -->
	<footer><%@ include file="views/user/hfl/footer.jsp" %></footer>
</body>
</html>