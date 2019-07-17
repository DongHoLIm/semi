<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<style>
#graphs {
	border: 1px dashed red;
	width: 43%;
	height: 600px;
}

#staticBtns {
	margin-top: 10%;
	margin-left: 3%;
}

.btns {
	margin-top: 2%;
	background: #ffd8d9;
	border: none;
	margin-bottom: 5%;
	font-size : 1.15em;
	font-weight: bold;
}

.menuBtn {
	margin-left: 5%;
}

.statics {
	display: inline-block;
	height: 600px;
}

table th, table td {
	border: 1px solid black;
	text-align: center;
}

table th {
	background: #ffd8d9;
}

.red {
	color : red;
}
.blue {
	color : blue;
}
.data {
	width: 180px;
}
.tHeader {
	width: 100px;
	height: 50px;
}
#outer{
	margin-top: 8%;
}
</style>
</head>
<header><%@ include file="../hfl/managerHeader.jsp"%></header>
<body>
	<div id="outer" align="center">
		<div id="graphs" class="statics">
			<input type="button" value="매출금액" class="menuBtn btns red" disabled />
			<input type="button" value="판매이익" class="menuBtn btns blue" disabled />
			<form action="">

			</form>
		</div>
		<div id=stat class="statics">
			<input type="button" value="연도별 매출현황" disabled class="btns" />
			<table>
				<tr>
					<th class="tHeader">연도</th>
					<th class="data">2018</th>
					<th class="data">2019</th>
				</tr>
				<tr>
					<th class="tHeader">매출금액</th>
					<td class="data"></td>
					<td class="data"></td>
				</tr>
				<tr>
					<th class="tHeader">판매이익</th>
					<td class="data"></td>
					<td class="data"></td>
				</tr>
			</table>
		</div>
	</div>

	<%@ include file="../hfl/footer.jsp"%>
</body>
</html>