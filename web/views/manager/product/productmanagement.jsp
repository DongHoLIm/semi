<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style>
#depotMain {
	width: 90%;
	height: 80%;
	text-align: center;
	border-spacing: 10px;
}
td {
	margin: 15px;
	width: 30px;
}

#th {
	text-align: center;
}

#inOutButton {
	padding-left: 8%;
}

#inOutMain {
	width: 80%;
	margin: 0 auto;
}

#table Area {
	align: center;
	width: 80%;
}

.th {
	text-align: center;
}
.btns{
padding-left: 50%;
}
</style>
<body>
	<%@ include file="../hfl/managerHeader.jsp"%>
	<br />
	<h2 align="center">상품 관리</h2>
	<div id="inOutMain">
		<br>
		<br>
		<div id="inOutButton" align="center">
			<select id="select1" name="category" style="width: 10%;"
				onchange="select2();">
				<option value="PC">PC</option>
				<option value="Notebook">노트북</option>
				<option value="etc">가전제품</option>
			</select> <select id="select2" name="term" style="width: 10%;">
				<option value="">소분류</option>
			</select> <input type="search" name="searchValue">
			<button type="submit"
				style="border-radius: 5px; background-color: black; color: white">조회</button>
		</div>
		<br>
		<br>
		<div id="table Area">
			<table id="depotMain" align="center">
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
			<br>
			<br>
			<div class="btns">
			<button onclick=""
				style="border-radius: 5px; background-color: black; color: white;">삭제</button>
			<button onclick=""
				style="border-radius: 5px; background-color: black; color: white;">수정</button>
			</div>
		</div>
	</div>
	<script>
		function pageMove() {
			location.href = '';
		}
		function itemChange() {
			var langSelect = document.getElementById("select1");
			var selectValue = langSelect.options[langSelect.selectedIndex].value;
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

</body>
</html>