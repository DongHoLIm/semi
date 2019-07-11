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
		padding-right:20%;
		padding-left:20%;
		
		margin:auto;
	}
	thead{
			background:#eee;
			
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
	<header><%@ include file="../hfl/managerHeader.jsp" %></header>
	<br />
	<br />
	
	<section id="sec1">
		<p align="center">공지사항</p>
		<table class="board">
			<tr class="row0">
			<thead>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
			</thead>
			</tr>
			<tr class="row1">
				<td id="Notd">0010</td>
				<td>그동안 많은 사랑 갑사합니다.</td>
				<td>파업</td>
				<td>19/07/26</td>
			</tr>
			<tr class="row2">
				<td id="Notd">0009</td>
				<td>생활가전 할인이벤트 </td>
				<td>냉장고사야지</td>
				<td>19/07/19</td>
			</tr>
			<tr class="row3">
				<td id="Notd">0008</td>
				<td>심심해서 글 한번 써봐요</td>
				<td>관리자</td>
				<td>19/07/17</td>
			</tr>
			<tr class="row4"> 
				<td id="Notd">0007</td>
				<td>블랙리스트 제재명단 공지</td>
				<td>관리자</td>
				<td>19/07/16</td>
			</tr>
			<tr class="row5">
				<td id="Notd">0006</td>
				<td>UI업데이트 공지</td>
				<td>관리자</td>
				<td>19/07/13</td>
			</tr>
			<tr class="row6">
				<td id="Notd">0005</td>
				<td>파워상품 공지</td>
				<td>관리자</td>
				<td>19/07/09</td>
			</tr>
			<tr class="row7">
				<td id="Notd">0004</td>
				<td>짐캐리 파업 공지</td>
				<td>관리자</td>
				<td>19/07/06</td>
			</tr>
			<tr class="row8">
				<td id="Notd">0003</td>
				<td>짐캐리 이벤트 공지</td>
				<td>짐짝</td>
				<td>19/06/29</td>
			</tr>
			<tr class="row9">
				<td id="Notd">0002</td>
				<td>이번주 공지 쉽니다</td>
				<td>관리자</td>
				<td>19/06/22</td>
			</tr>
			<tr class="row10">
				<td id="Notd">0001</td>
				<td>배송할인이벤트 공지</td>
				<td>관리자</td>
				<td>19/06/15</td>
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
	<br />
		
	
	
	<footer><%@ include file="../../user/hfl/footer.jsp" %></footer>
	
	
</body>
</html>



















