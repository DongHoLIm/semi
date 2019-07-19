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
	border: 1px dashed black;
	width: 43%;
	height: 600px;
}

#staticBtns {
	margin-top: 10%;
	margin-left: 3%;
}

.btns {
	margin-top: 2%;
	background: white;
	border: none;
	color:black;
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
	background: black;
	color:white;
	border : 1px solid white;
}

.red {
	color : red;
}
.blue {
	color : blue;
}
.green {
	color : green;
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
			<input type="button" value="결제건수" class="menuBtn btns red" disabled />
			<input type="button" value="결제자수" class="menuBtn btns blue" disabled />
			<input type="button" value="결제금액" class="menuBtn btns green" disabled /><br />
			<form action="">

			</form>
		</div>
		<div id=stat class="statics">
			<input type="button" value="연도별 고객현황" disabled class="btns" />
			<table>
				<tr>
					<th class="tHeader">연도</th>
					<th class="data">2018</th>
					<th class="data">2019</th>
				</tr>
				<tr>
					<th class="tHeader">결제건수</th>
					<td class="data"></td>
					<td class="data"></td>
				</tr>
				<tr>
					<th class="tHeader">결제자수</th>
					<td class="data"></td>
					<td class="data"></td>
				</tr>
				<tr>
					<th class="tHeader">결제금액</th>
					<td class="data"></td>
					<td class="data"></td>
				</tr>
			</table>
		</div>
	</div>

	<%@ include file="../hfl/footer.jsp"%>
</body>
</html>