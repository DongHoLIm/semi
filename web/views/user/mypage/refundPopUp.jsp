<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<style>
.r1 {
	width:100%;
	height:100%;
	margin-top:40px;
}
.r2 {
	margin-top:50px;
	margin-right:10%;
}
.btn_refund1 {
	width:60px;
	height: 25px;
	margin-left:auto;
	margin-right:auto;
	margin-top:50px;
	margin-bottom:50px;
	border: 1px solid #ffd8d9;
	font-size: 14px;
	font-family: 'Sunflower', sans-serif;
	border-radius: 5px;
	background-color: #ffd8d9;
	color: black;
}
.btn_refund2 {
	text-align:center;
	margin-top:20px;
}
</style>
</head>
<body>
		<div class="r1">
			<h3>반품/환불 신청</h3>
			<br>
			<p>
				반품/환불 신청은 배송완료 후 7일 이내에만 가능합니다.<br> 단순변심 반품은 불가능하며 상품 파손의 경우에만
				반품이 가능합니다.<br> 단, 택배비 관련 문의는 고객센터에 직접 연락해주시길 바랍니다.
			</p>
		<div class="r2" align="right">
			안내 사항을 모두 확인하였으며, 이에 동의합니다.&nbsp;<input type="checkbox" name="return_check" class="return_check">
		</div>
		<div class="btn_refund2">
			<button id="check" disabled class="btn_refund1">확인</button>
			<button onclick="window.close();" class="btn_refund1">취소</button>
		</div>
		</div>
		<script>
			$(function(){
				$(".return_check").change(function(){
					if($(".return_check").is(":checked")){
						
					$("#check").prop("disabled", false);
				}else{
					$("#check").attr("disabled", "disabled");
				}
				})
			});
					$("#check").click(function(){
						window.opener.location.href="returnAddress.jsp";
						window.close();
					});
		</script>
</body>
</html>