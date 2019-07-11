<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 이메일 -->
	 <div class="login_inp" id="loginEmailField" >
      <label for="loginEmail" class="screen_out">이메일 또는 전화번호</label><!-- 2018-02-13 수정 --><!-- 2018-03-30 수정 -->
      <input id="loginEmail" type="text" class="inp_login inp_email" name="email" value="" autocomplete="off"
             placeholder="이메일 또는 전화번호"
             validator="email_or_phone"
             data-error-empty="이메일 또는 전화번호를 입력해주세요."
             data-error-invalid="이메일 또는 전화번호 형식이 올바르지 않습니다.">
      <button type="button" class="btn_help ico_login"><span class="ir_wa">관련 설명 보기/닫기</span></button>
      <div class="login_tooltip">
        <p>카카오계정은 카카오 서비스 및 연계 서비스를 이용하기 위하여 필요한 로그인 계정입니다.</p>
        <span class="user_more"><a href="/weblogin/find_account_guide?continue=https%3A%2F%2Fkauth.kakao.com%2Foauth%2Fauthorize%3Fclient_id%3D387111fcbb5a1a4df6358c90c99522be%26response_type%3Dcode%26redirect_uri%3Dhttps%253A%252F%252Flogin.11st.co.kr%252Fauth%252Foauth%252Fcallback.tmall%26state%3D334bf5d9be310bafd64af8e5dcb4fe25f6056873e9cad4a8f1e925c4cf5fce334ae49a4e"  class="link_more">카카오계정 찾기</a></span>
        <span class="ico_login ico_bottom"></span>
      </div>
    </div>

	<!-- 비밀번호 -->
	<div class="login_inp">
      <label for="loginPw" class="screen_out">비밀번호</label>
      <input type="password" id="loginPw" class="inp_login" name="password" autocomplete="off"
             placeholder="비밀번호"
             validator="password"
             data-error-empty="카카오계정 비밀번호를 입력해주세요.(영문자/숫자/특수문자)"
             data-error-invalid="비밀번호가 올바르지 않습니다.">
    </div>
	<button type="submit" class="btn_login submit">로그인</button>
</body>
</html>