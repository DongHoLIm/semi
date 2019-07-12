<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#sec1 {
		width:100%;
		height:100%;
		padding-top:2%;
		padding-right:20%;
		padding-bottom:2%;
		padding-left:20%;
		margin:auto;
}
.accordionMenu {
	color: #424242;
	background: #fff;
	padding: 10px;
	width: 80%;
	margin: 0 auto;
	border-left:1px solid black;
	border-right:1px solid black;
	
}

.accordionMenu h1 {
	margin: 0;
	font-size: 20px;
	font-weight:bold;
}

.accordionMenu h2 {
	margin: 5px 0;
	paddion: 0;
}

.accordionMenu h2 a {
	font-size: 15px;
	display: block;
	font-weight: normal;
	color: #424242;
	text-decoration: none;
	margion: 0;
	padding: 10px;
}

.accordionMenu h2 a {
	font-size: 15px;
	display: block;
	font-weight: normal;
	/* color: #424242; */
	/* text-shadow: 2px 2px 2px #aeaeae; */
	text-decoration: none;
	margion: 0;
	padding: 10px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	border:1px solid black;
}

.accordionMenu :target h2 a, .accordionMenu h2 a:focus, .accordionMenu h2 a:hover,
	.accordionMenu h2 :active {
	background: #eee;
	/* background:	 -moz-linear-gradient(top, #6bb2ff, #2288dd);
	background: -webkit-gradient(linear, left top, left bottom, from(#6bb2ff),
		to(#2288dd));
	-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#ff6bb2ff,
		endColorstr=#ff2288dd)"; */
	color: #000;
}

.accordionMenu p {
	padding: 0 10px;
	margin: 0;
	height: 0;
	overflow: hidden;
	background:	 -moz-linear-gradient(top, #fff, #ccc);
	background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ccc));
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}

.accordionMenu :target p {
	overflow: auto;
	height: auto;
	min-height: 70px;
}
.board{
		width:80%;
		margin:auto;
		align:center;
        border-spacing: 10px;
        
	}
	
	.row0{
		background:#eee;
		margin:auto;
	}
	.row1{
		border-top: 2px solid #555;
	}
	.row2, .row3, .row4, .row, .row6, .row7, .row8, .row9, .row10{
		border-top: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
	}
	.pageNo{
		margin:auto;
		
	}
	
</style>
</head>
<body>
	<!-- header 영역 -->
	<header><%@ include file="../hfl/header.jsp" %></header>
	
	<section id="sec1">
	<table class="accordionTable">
		<div class="accordionMenu">
			<h1>자주 찾는 질문</h1>
			<div id="question1" class="menuSection">
				<h2>
					<a href="#question1">아이디/패스워드는 어디서 찾나요?</a>
				</h2>
				<p>잘 찾아보세요</p>
			</div>
			<div id="question2" class="menuSection">
				<h2>
					<a href="#question2">주문한 물건이 어디쯤 배송중인가요?</a>
				</h2>
				<p>택배기사한테 물어보세요</p>
			</div>
			<div id="question3" class="menuSection">
				<h2>
					<a href="#question3">오늘 스터디는 어디서 하나요?</a>
				</h2>
				<p>5층 할리스 7그램 프라빈 바나프레소 양평</p>
			</div>
			<div id="question4" class="menuSection">
				<h2>
					<a href="#question4">아이디는 어떻게 변경할 수 있나요?</a>
				</h2>
				<p>못합니다. 계정 다시 파세요.</p>
			</div>
		</div>
	</table>
	
	<p align="center">내가 쓴 질문</p>
		<table class="board">
			<tr class="row0">
			<thead>
				<th>글 번호</th>
				<th>제목</th>
				<th>답변여부</th>
				<th>작성일자</th>
			</thead>
			</tr>
			<tr class="row1">
				<td id="Notd">0001</td>
				<td>물건을 등록했는데 안팔려서 돈이 안들어와요</td>
				<td>N</td>
				<td>08/11/21</td>
			</tr>
			<tr class="row2">
				<td id="Notd">-</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr class="row3">
				<td id="Notd">-</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr class="row4"> 
				<td id="Notd">-</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr class="row5">
				<td id="Notd">-</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr class="row6">
				<td id="Notd">-</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr class="row7">
				<td id="Notd">-</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr class="row8">
				<td id="Notd">-</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr class="row9">
				<td id="Notd">-</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr class="row10">
				<td id="Notd">-</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		
		<footer align="center">	
		<ul class="pagination" align="center">
		  <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
		  <li class="page-item"><a class="page-link" href="#">1</a></li>
		  <li class="page-item"><a class="page-link" href="#">2</a></li>
		  <li class="page-item"><a class="page-link" href="#">3</a></li>
		  <li class="page-item"><a class="page-link" href="#">다음</a></li>
		</ul>
	</footer>
	</section>
	
	<!-- footer 영역 -->
	<footer><%@ include file="../hfl/footer.jsp" %></footer>
</body>
</html>