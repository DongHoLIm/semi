<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 이새끼 th가운데정렬해야하삼 -->
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<title>Insert title here</title>
<style>
#select-area {
	width: 80%;
	border: 2px solid #ffd8d9;
	margin: 0 auto;
	border-radius: 5px;
}

#select {
	width: 100%;
	border-radius: 1px;
}

table {
	width: 90%;
	text-align: center;
	border-spacing: 10px;
}

td {
	margin: 15px;
	width: 30px;
}

.selectAll {
	align: right;
}
</style>
</head>
<header><%@ include file="../hfl/managerHeader.jsp"%></header>
<body>
	<br>
	<br>
	<br>
	<div align="center" id="select-area">
		<h1>상품 관리</h1>
		<form>
			<div id="select">
				<select id="select1" name="category" style="width: 10%;" onchange="select2();">
					<option value="PC">PC</option>
					<option value="Notebook">노트북</option>
					<option value="etc">가전제품</option>
				</select> <select id="select2" name="term" style="width: 10%;">
					<option value="">소분류</option>
				</select> <input type="search" name="searchValue">
				<button type="submit" style="border-radius: 5px; background-color: #ffd8d9;">조회</button>
			</div>
			<br>

			<div class="productDiv">

				<table id="productList">
					<tr>
						<td>
							<h4>No.</h4> <img
							src="<%=request.getContextPath()%>/images/flower4.PNG"
							class="img-rounded" alt="Cinque Terre"
							style="max-width: 100%; height: auto;" onclick="pageMove();">&nbsp;&nbsp;
							<p>
								진수의 분홍분홍 쿨러 <input type="checkbox">
							</p>
						</td>
						<td>
							<h4>No.</h4> <img
							src="<%=request.getContextPath()%>/images/flower4.PNG"
							class="img-rounded" alt="Cinque Terre"
							style="max-width: 100%; height: auto;" onclick="pageMove();">&nbsp;&nbsp;
							<p>
								진수의 분홍분홍 쿨러 <input type="checkbox">
							</p>
						</td>

						<td>
							<h4>No.</h4> <img
							src="<%=request.getContextPath()%>/images/flower4.PNG"
							class="img-rounded" alt="Cinque Terre"
							style="max-width: 100%; height: auto;" onclick="pageMove();">&nbsp;&nbsp;
							<p>
								진수의 분홍분홍 쿨러 <input type="checkbox">
							</p>
						</td>

					</tr>
				</table>
				<hr>
			<%@ include file="../hfl/pagination.jsp" %>
				<button onclick="" style="border-radius: 5px; background-color: #ffd8d9;">삭제</button>
				<button onclick="" style="border-radius: 5px; background-color: #ffd8d9;">수정</button>
			</div>
		</form>
		<script>
function pageMove(){
	location.href='';
}
function itemChange() {
    var langSelect = document.getElementById("select1");
    var selectValue= langSelect.options[langSelect.selectedIndex].value;
    var $sel2 = $("#select2");
    var $opt2 = $("#option2");
    if (selectValue == "findPC") {
      $("#select2").empty();
      var $desktop = $("<option value='desktop'>").text("본체");
        var $monitor = $("<option value='monitor'>").text("모니터");
        $sel2.append($desktop);
        $sel2.append($monitor);            
    } else if (selectValue == "findNotebook") {
      $("#select2").empty();
      var $note = $("<option value='note'>").text("노트북");
      var $bag = $("<option value='bag'>").text("노트북가방");
      $sel2.append($note);
      $sel2.append($bag);
      
    } else {
       $("#select2").empty();
       var $cook = $("<option value='cook'>").text("주방용품");
       var $life = $("<option value='life'>").text("생활가전");
       $sel2.append($cook);
       $sel2.append($life);
    }    
 }
</script>
	</div>
</body>
</html>