<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
  <style>
  #total{
  	text-align: center;
  	margin: 15px;
  }
  #totalInfo{
  	text-align: center;
  }
  #fileImage{
  	width: 200px;
  	height: 200px;
  	border:2px solid black;
  }
  #select{
  	margin-top: 155%;
  	margin-left:0 auto;
  	margin-right: 0 auto;
  	width: 30px;
  	height: 30px;
  }
  #th3{
  	text-align: center;
  }
  #td1{
  	text-align: center;
  	margin-top: 120%;
  }
  #productName{
  	margin-top:25%;
  }
  #info{
  	margin-top:90%;
  }
  #info1{
  	margin-top:118%;
  }
  #directBtn{
  	margin-top:67%;
  }
  #basketList{
  	width: 60%;
  	margin: 0 auto;
  	margin-top:5%;
  }
  #basketTitle{
  	text-align: center;
  	margin-bottom: 6%;
  }
  </style>
</head>
<body>
<%@ include file="../hfl/header.jsp"%>
<%@ include file="../hfl/list.jsp"%>

<div id="basketList">
	<h2 id="basketTitle">장바구니</h2>      
  <table class="table">
    <thead>
      <tr>
        <th id="th3"></th>
        <th id="th3"></th>
        <th id="th3">상품명</th>
        <th id="th3">상품금액</th>
        <th id="th3">배송비</th>
        <th id="th3">주문금액</th>
        <th id="th3">선택</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td id="td1"><input type="checkbox" id="select"/></td>
        <td id="td1"><img src="<%=request.getContextPath() %>/images/flower4.PNG" alt=""  id="fileImage"/></td>
        <td id="td1"><h4 id="productName">진수의 블링블링 노트북쿨러</h4></td>
        <td id="td1"><p id="info">300000</p></td>
        <td id="td1"><p id="info1">2500</p></td>
        <td id="td1"><p id="info">302500</p></td>
        <td id="td1">
        	<input type="button" value="바로구매" id="directBtn"/>
        </td>
      </tr>
    </tbody>
  </table>
  <table id="totalInfo" align="center">
  	<tr>
  		<th id="th3">주문금액&nbsp;&nbsp;</th>
  		<th></th>
  		<th id="th3">배송비&nbsp;&nbsp;</th>
  		<th></th>
  		<th id="th3">결제 예정 금액&nbsp;&nbsp;</th>
  	</tr>
  	<tr>
  		<td>300000 &nbsp;&nbsp;</td>
  		<td>+ &nbsp;&nbsp;</td>
  		<td>2500 &nbsp;&nbsp;</td>
  		<td>= &nbsp;&nbsp;</td>
  		<td>302500</td>
  	</tr>
  </table>
  <div id="total">
  	<button onclick="">선택 상품 주문</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	<button onclick="">전체 상품 주문</button>
  </div>
</div>
</body>
<footer><%@ include file="../hfl/footer.jsp"%></footer>
</html>