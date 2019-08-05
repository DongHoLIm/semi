<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ono = (String) request.getParameter("ono");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">

<style>

.r1 {
	width:100%;
	height:100%;
	margin-top:40px;
	padding-left:5px;
}
.r2 {
	margin-top:50px;
	margin-right:10%;
}
.btn_cancel1 {
	width:60px;
	height: 25px;
	margin-left:auto;
	margin-right:auto;
	margin-top:50px;
	margin-bottom:50px;
	font-size: 14px;
	border-radius: 5px;
	border:1px solid black;
	background:#FFF;
}
.btn_cancel2 {
	text-align:center;
	margin-top:20px;
}
</style>
</head>
<body>

		<div class="r1">
			<h3>주문 취소 신청</h3>
			<br>
			<p>
				주문 취소 신청은 배송 전에만 가능합니다.<br>
				취소 신청 시 카드 취소 처리까지는 카드 회사에 따라 1~3영업일이 추가로 소요 됩니다.
			</p>
			<input type="text" id="hiddenvalue" value="<%=ono %>" style="display:none;">
		<div class="r2" align="right">
			안내 사항을 모두 확인하였으며, 이에 동의합니다.&nbsp;<input type="checkbox" name="cancel_check" class="cancel_check">
		</div>
		<div class="btn_cancel2">
			<button id="check" disabled class="btn_cancel1">확인</button>
			<button onclick="window.close();" class="btn_cancel1">취소</button>
		</div>
		</div>
		<script>
			$(function(){
				$(".cancel_check").change(function(){
					if($(".cancel_check").is(":checked")){

					$("#check").prop("disabled", false);
				}else{
					$("#check").attr("disabled", "disabled");
				}
				})
			});
					$("#check").click(function(){
						/* window.opener.location.href="cancelApply.mp"; */
						var ono =  $("#hiddenvalue").val();
						window.opener.location.href='<%=request.getContextPath()%>/cancelApply.mp?ono='+ono;
						window.close();
						//parent.success();
					});
		</script>
</body>
</html>