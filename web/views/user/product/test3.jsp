<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		$(function() {
			// 1번
			$("#nameBtn").click(function() {
				var name = $("#myName").val();

				$.ajax({
					url : "<%=request.getContextPath()%>/test.do",
					data : {
						name : name
					},
					type : "get",
					success : function(data) {
						console.log("서버 전송 성공!");
					},
					error : function(err) {
						console.log("서버 전송 실패!");
					},
					complete : function(data) {
						console.log("난.. 무조건 호출되는 노예야..");
					}
				});
			});
		});
	</script>
	<h1 align="center">JQuery를 이용한 Ajax 테스트</h1>
	<h3>1. 버튼 선택시 전송 값 서버에 출력</h3>
	<label>1. 이름 : </label>
	<input type="text" id="myName" />
	<button id="nameBtn">이름 보내기</button>
</body>
</html>