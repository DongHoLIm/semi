<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	
   #fullScreen{
		height: 50%;
		margin:10px;
   }
   
   #menubar{
      width:16.6%;
      height: 20%;
      border: 3px solid #ffd8d9;
      text-align: center;   
      padding:1%;
   }
   
   #menuUl{
   		margin-right:20%;
		padding-left:0px;
      margin:0px auto;
   		
   }
   
   #menubar ul li{
      list-style-type: none; 
      
      
   }
	a{
		text-decoration:none;
		color:black;
	}
	
	a:hover {
		text-decoration:none;
	}

	
</style>

</head>
<body>
 <div id="fullScreen">
      <div id="menubar">
         <ul id="menuUl">
            <li><h3>쇼핑내역</h3></li>
            <li><a href="">주문내역</a></li>
            <li><a href="">판매내역</a></li>
            <li><a href="">주문배송조회</a></li>
            <li><hr></li>
            <li><h3>활동</h3></li>
            <li><a href="">장바구니</a></li>
            <li><a href="">내가쓴게시판</a></li>
            <li><hr></li>
            <li><h3>회원정보변경/수정</h3></li>
            <li><a href="">회원정보 변경</a></li>
            <li><a href="">회원정보 수정</a></li>
            <li><a href="">회원 탈퇴</a></li>         
         </ul>
      </div>
   </div>
</body>
</html>