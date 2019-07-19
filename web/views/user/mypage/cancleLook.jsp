<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#sec1 {
	width: 100%;
	height: 100%;
	padding-right: 20%;
	padding-left: 20%;
	margin: auto;
}

#area {
	width: 80%;
	height:70%
	padding: 2%;
	margin: 0 auto;
	text-align: center;
	background-color:lightgrey;
}

#deliTable {
	align: center;
}

#deliTable tr {
	align: center;
}

#deliTable tr td {
	align: center;
}

#deliTable tr td img {
	width: 30%;
	align: center;
}

.board {
	width: 80%;
	margin: auto;
	align: center;
	border-spacing: 10px;
}

.row0 {
	background: #eee;
	margin: auto;
}

.row1 {
	border-top: 2px solid #555;
}

.row2, .row3, .row4, .row, .row6, .row7, .row8, .row9, .row10 {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.pageNo {
	margin: auto;
}
</style>
</head>
<body>
	<header><%@ include file="../hfl/header.jsp"%></header>
	<br>
	<header><%@ include file="../hfl/myPageList.jsp"%></header>

	<section id="sec1">
		<div id="area">
			<h3 style="font-weight: bold">취소 / 반품조회</h3>

			<div class="date-select" align="center">
				<br> <span style="font-weight: bold">기간별조회</span> <span>&nbsp;&nbsp;&nbsp;
				<input type="button" value="1주일">&nbsp;
				</span> &nbsp;<input type="button" value="15일">&nbsp; &nbsp;<input
					type="button" value="1개월">&nbsp; <input type="date">
				- <input type="date"><br> <br>
			</div>
		</div>

		<div>
			<br />

			<table border="1" class = "board">
            <tr>
               <th class="cancel">주문일자  </th>
               <th class="cancel">상품정보  </th>
               <th class="cancel">주문상태  </th>
               <th class="cancel">확인/신청</th>
            </tr>
            <tr>
               <td>주문일자내용</td>
               <td><input type="button" onclick="" value="주문상세"></td>
               <td>주문상태내용</td>
               <td>확인/신청내용</td>
            </tr>
            <tr>
               <td>주문일자내용</td>
               <td><input type="button" onclick="" value="주문상세"></td>
               <td>주문상태내용</td>
               <td>확인/신청내용</td>
            </tr>
            <tr>
               <td>주문일자내용</td>
               <td>주문상태내용</td>
               <td>확인/신청내용</td>
            </tr>
         </table>
		</div>
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

	<br>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
</body>
</html>