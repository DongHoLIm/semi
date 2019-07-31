<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	border:1px solid white;
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
	<div id="statisticsOuter" align="center">
		<div id="graphs" class="statics" style="width:100%;">
			<div id="container" class="statisticsContainer"style="wdith:80%; min-width: 310px; height: 400px; margin: 0 auto"></div><!-- 차트가 생성 -->
		</div>
		
		<div id=stat class="staticsTable">
			<input type="button" value="매출현황" disabled class="btns" />
			<table id="datatable">
			    <thead>
			        <tr>
			            <th></th>
			            <th>매출금액</th>
			            <th>판매금액</th>
			            <th>환불금액</th>
			        </tr>
			    </thead>
			    <tbody>
			        <tr>
			            <th>Apples</th>
			            <td>3</td>
			            <td>4</td>
			            <td>4</td>
			        </tr>
			        <tr>
			            <th>Pears</th>
			            <td>2</td>
			            <td>0</td>
			            <td>14</td>
			        </tr>
			        <tr>
			            <th>Plums</th>
			            <td>5</td>
			            <td>11</td>
			            <td>8</td>
			        </tr>
			        <tr>
			            <th>Bananas</th>
			            <td>1</td>
			            <td>1</td>
			            <td>6</td>
			        </tr>
			        <tr>
			            <th>Oranges</th>
			            <td>2</td>
			            <td>4</td>
			            <td>7</td>
			        </tr>
			    </tbody>
			</table>
		</div>
	</div>

	<%@ include file="../hfl/footer.jsp"%>
	
	<script>
		Highcharts.chart('container', {
		    data: {
		        table: 'datatable'
		    },
		    chart: {
		        type: 'column'
		    },
		    title: {
		        text: '매출현황'
		    },
		    yAxis: {
		        allowDecimals: false,
		        title: {
		            text: '금액(만)'
		        }
		    },
		    tooltip: {
		        formatter: function () {
		            return '<b>' + this.series.name + '</b><br/>'/*  +
		                this.point.y + ' '  */+ this.point.name.toLowerCase();
		        }
		    }
		    
		});
		
	</script>
</body>
</html>