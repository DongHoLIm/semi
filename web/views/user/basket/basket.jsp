<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.bvengers.user.basket.model.vo.*"%>
    <%
    	ArrayList <Basket> list = (ArrayList <Basket>) request.getAttribute("list");
    	int delieryPrice =2500;
    	int totalPrice =0;
    %>
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
	<button onclick="removeList();">리스트제거</button>
  <table class="table">
    <thead>
      <tr>
        <th id="th3">선택</th>
        <th id="th3"></th>
        <th id="th3">상품명</th>
        <th id="th3">상품금액</th>
        <th id="th3">배송비</th>
        <th id="th3">주문금액</th>
      </tr>
    </thead>
    <tbody>
    <%for(Basket bk : list){ %>
      <tr>
        <td id="td1"><input type="checkbox" id="select" value="<%=bk.getProductCode() %>"/></td>
        <td id="td1"><img src="<%=request.getContextPath() %>/thumbnail_uploadFiles/<%=bk.getFileName() %>" alt=""  id="fileImage"/></td>
        <td id="td1"><h4 id="productName"><%=bk.getProductName() %></h4></td>
        <td id="td1"><p id="info"><%=bk.getPrice() %></p></td>
        <td id="td1"><p id="info1"><%=delieryPrice %></p></td>
        <td id="td1"><p id="info"><%=bk.getPrice() %></p></td>
        <td hidden><%=totalPrice+=bk.getPrice() %></td>
      </tr>
      <%} %>
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
  		<td><%=totalPrice %> &nbsp;&nbsp;</td>
  		<td>+ &nbsp;&nbsp;</td>
  		<td><%=delieryPrice %> &nbsp;&nbsp;</td>
  		<td>= &nbsp;&nbsp;</td>
  		<td><%=totalPrice+delieryPrice %></td>
  	</tr>
  </table>
  <div id="total">
  	<button onclick="choiceProduct();">선택 상품 주문</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	<button onclick="selectAll();">전체 상품 주문</button>
  </div>
</div>
<script>
	function removeList(){
		$(function(){
			var code = "";
			
			$("#select:checked").each(function(index){
				code+=$(this).val()+","
			});
			var deliveryPrice = 2500;
			var total =0;
			$.ajax({
				url:"deleteList.bk",
				type:"post",
				data:{"code":code},
				success:function(data){
						window.location.reload();	
				}
			});
		});
	}
	function selectAll(){
		$(function(){
			   var list = new Array();
			   $("input[id=select]").each(function(index, item){
			      list.push($(item).val());
			   });
			
			var code = list.join(',');
			console.log(code);
			
			location.href="<%= request.getContextPath()%>/payment.pa?code="+code;
			
			
		});
	}
	
	function choiceProduct(){
		$(function(){
			   var list = new Array();
			   $("#select:checked").each(function(index, item){
			      list.push($(item).val());
			   });
			
			var code = list.join(',');
			console.log(code);
			
			location.href="<%= request.getContextPath()%>/payment.pa?code="+code;
			
			
		});
	}
	
	
</script>
<footer><%@ include file="../hfl/footer.jsp"%></footer>
</body>
</html>