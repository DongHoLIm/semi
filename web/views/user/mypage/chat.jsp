<%@page import="com.kh.bvengers.user.chat.model.vo.Chat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Chat ch = (Chat)request.getAttribute("ch");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header><%@ include file="../hfl/header.jsp"%></header>
	<fieldset>
		<textarea name="" id="messageWindow" cols="50" rows="10" rows="10" readonly></textarea>
		<br /> <input type="text" id="inputMessage" /> <input type="button" value="send" onclick="send();" />
	</fieldset>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
</body>
<script>
	var textarea = document.getElementById("messageWindow");
	var id = "<%=loginUser.getMemberId()%>";
	var no = <%=ch.getMemberNo()%>;
	var webSocket = new WebSocket('ws://localhost:8001/sp/chatting?id='+id);
	var inputMessage = document.getElementById('inputMessage');

	webSocket.onerror = function(event) {
		onError(event);
	};
	webSocket.onopen = function(event) {
		onOpen(event);
	};
	webSocket.onmessage = function(event) {
		onMessage(event);
	};
	function onMessage(event) {
		textarea.value += event.data + "\n";
	};
	function onOpen(event) {
		textarea.value += "연결 성공\n";
	};
	function onError(event) {
		alert(event.data);
	};
	function send() {
		textarea.value += id + " : " + inputMessage.value + "\n";
		webSocket.send(id + " : " + inputMessage.value);
		inputMessage.value = "";
	};
</script>
</html>