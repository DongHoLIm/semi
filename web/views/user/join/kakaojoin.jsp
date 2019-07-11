<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
a{text-decoration:none; color:black; font-weight:bold;}
button{
height: 40px; width:380px;
}
p{line-height:35px;}
</style>
</head>
<body>
	<div class = "header" align="center">
		<h1><a href="/web/index.html">중고 愛 민족</a></h1><br><br>
	</div>
	<hr>
      <!-- page select -->
      <div id="page-select-verify-method-for-create" data-role="page" data-account-type="account_type2" align="center">
        <h2 class="tit_page">가입을 시작합니다!</h2>
        <p class="desc_page">
          카카오계정 하나로<br/>
          	중고 愛 민족 서비스를 모두 이용할 수 있어요.
        </p>
        <div class="box_intro">
          <p class="txt_intro">카카오계정이 있나요?</p>
          <div class="wrap_btn">
            <button class="btn_g btn_confirm verify_eamil" type="button">이메일이 있습니다.</button><br><br>
            <button class="btn_g verify_phone" type="button">새 메일이 필요합니다.</button>
          </div>
          <p class="txt_intro">
            사용중인 카카오아이디가 있다면,<br/>
            로그인하여 새로운 중고愛민족 계정을 만들 수 있어요.<br>
            <a href="#" class="link_g verify_daum_id">카카오 계정으로 중고愛민족계정 가입</a><br><br>
          </p>
        </div>
      </div>
      <hr>
	<footer><%@ include file="../hfl/footer.jsp" %></footer>
</body>
</html>