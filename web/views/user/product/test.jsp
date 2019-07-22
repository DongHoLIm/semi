<%@page import="com.sun.org.apache.regexp.internal.REUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.outer {
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

.thumbnailArea {
	width: 1200px;
	height: 550px;
	margin: 0 auto;
}

.searchArea {
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.thumb-list {
	width: 310px;
	display: inline-block;
}

.thumb-list:hover {
	opacity: 0.8;
	cursor: pointer;
}

.productTitle {
	font-size: 1.5em;
	font-weight: bold;
	margin-top: 5px;
	text-align: center;
}

#priceLabels {
	font-size: 1.2em;
	font-weight: bold;
}

.productImg {
	font-family: 'Quattrocento', Arial, sans-serif;
	position: relative;
	overflow: hidden;
	margin: 10px;
}

.productImg * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
}

.productImg figcaption {
	text-align: center;
	position: absolute;
	top: calc(77%);
	width: 100%;
	background-color: #ffffff;
	padding: 15px 25px 65px;
	opacity: 0.8;
}

.productImg figcaption:before {
	position: absolute;
	content: '';
	z-index: 2;
	bottom: 100%;
	left: 0;
	width: 100%;
	height: 50px;
	opcity: 1;
	background-image: -webkit-linear-gradient(top, transparent 0%, #ffffff 100%);
	background-image: linear-gradient(to bottom, transparent 0%, #ffffff 100%);
}

.productImg p {
	margin: 0 0 10px;
}

.productImg p {
	margin-top: 15px;
	font-size: 1.1em;
	letter-spacing: 1px;
	opacity: 0.9;
}

.productImg a {
	position: absolute;
	z-index: 2;
}

.productImg:hover figcaption, .productImg.hover figcaption {
	top: 230px;
}
</style>
</head>
<body>
<header><%@ include file="../hfl/header.jsp" %></header>
<div class="outer">
	<br />
	<div class="thumbnailArea">
			<% for(int i = 0; i < list.size(); i++) {
				HashMap<String, Object> hmap = list.get(i);
			%>
		<div class="thumb-list" align="center">
			<figure class="productImg">
				<input type="hidden" value="<%= hmap.get("postsId")%>" />
				<img src="/sp/thumbnail_uploadFiles/<%= hmap.get("newFileName")%>" class="proImg" width="300px" height="300px" alt="추천 상품 사진" />
				<figcaption>
				<p class="figP">보러가기</p>
				</figcaption>
				<div>
				<br />
				<p class="productTitle"><%= hmap.get("title") %></p>
				<hr />
				<p class="price"><label id="priceLabels">판매가  : </label> <%= hmap.get("price") %>원</p>
				<a href="#"></a>
				</div>
			</figure>
		</div>
		<% } %>
		<form action="<%= request.getContextPath() %>/search.pd" id="searchForm">
		<div class="searchArea">
			<select name="search" id="search">
				<option value="title">제목</option>
				<option value="category">카테고리</option>
				<option value="content">내용</option>
			</select>
			<input type="search" name="searchProduct" />
			<button type="submit" onclick="search();">검색하기</button>
		</div>
		</form>
	</div>
</div>

	<!-- footer 영역 -->
	<%@ include file="../hfl/footer.jsp" %>
			<script>
			$(function(){
				$(".thumb-list").click(function(){
					var num = $(this).children().children().eq(0).val();
					location.href="<%=request.getContextPath()%>/selectOne.pd?num=" + num;
				});
			});

				$(function() {
					$(".figP").hide();
					$(".productImg").each(function(i) {
						$(this).mouseover(function() {
							$(".figP").eq(i).show();
						});
						$(this).mouseout(function() {
							$(".figP").eq(i).hide();
						});
					});
				});
				function search() {
					$("form").submit();
				}
			</script>
</body>
</html>