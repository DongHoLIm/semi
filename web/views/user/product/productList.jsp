<%@page import="java.text.DecimalFormat"%>
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
	min-height: 1000px;
}

.thumbnailArea {
	width: 60%;
	margin: 0 auto;
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

.searchArea button {
	border: 1px solid white;
	color: white;
	background: black;
	float: right;
	margin-right: 8px;
	width: 35%;
	height: 40px;
}

.searchArea {
	margin-left: auto;
	margin-right: auto;
	width: 400px;
	position: absolute;
	right: 50px;
}

.searchArea>a {
	color: black;
	padding: 0 8px;
	overflow: hidden;
	font-size: 1.2em;
}

.searchArea>a:after {
	content: '▼';
}

.searchArea>ul {
	position: absolute;
	width: 50%;
	background: #fff;
	display: none;
	background: black;
	color: white;
}

.searchArea>ul>li {
	cursor: pointer;
	border-top: 0;
	border-bottom: 1px solid red;
	text-align:center;
	width: 100%;
	font-size: 1.2em;
}

.select>ul>li:first-child:after {
	content: '▲';
}
.searchEtc{
	width: 245px;
}
</style>
</head>
<body>
	<header><%@ include file="../hfl/header.jsp"%></header>
	<%@ include file="../hfl/list.jsp" %>
	<div class="outer">
		<form action="<%=request.getContextPath()%>/search.pd" id="searchForm">
			<div class="searchArea">
				<a href="#">검색 옵션 선택</a>
				<ul>
					<li value="title">제목으로 검색</li>
					<li value="content">내용으로 검색</li>
					<li value="category">카테고리로 검색</li>
				</ul>
				<input type="hidden" id="search" name="search"/>
				<input type="search" name="searchProduct" class="searchEtc" />
				<button type="submit" onclick="searchData();">검색하기</button>
			</div>


			<!-- <div class="searchArea">
				<select name="search" id="search">
					<option value="title">제목</option>
					<option value="category">카테고리</option>
					<option value="content">내용</option>
				</select>
			</div> -->
		</form>
		<br />
		<div class="thumbnailArea">
			<% for(int i = 0; i < list.size(); i++) {
				HashMap<String, Object> hmap = list.get(i);
			%>
			<div class="thumb-list" align="center">
				<figure class="productImg">
					<input type="hidden" value="<%= hmap.get("postsId")%>" />
					<img src="/sp/thumbnail_uploadFiles/<%= hmap.get("newFileName")%>"
						class="proImg" width="300px" height="300px" alt="추천 상품 사진" />
					<figcaption>
						<p class="figP">보러가기</p>
					</figcaption>
					<div>
						<br />
						<p class="productTitle"><%= hmap.get("title") %></p>
						<p class="productCategory"><%= hmap.get("category") %></p>
						<p class="price">
							<label id="priceLabels">판매가 : </label>
							<% int fprice = (int)hmap.get("price");
								DecimalFormat dc = new DecimalFormat("###,###,###,###");
								String price = dc.format(fprice);
							%>
							<%= price%>원
						</p>
						<a href="#"></a>
					</div>
				</figure>
			</div>
			<% } %>

		</div>
	</div>

	<!-- footer 영역 -->
	<script>

	function searchData() {
		$("form").submit();
	};

		$(function(){
			$(".thumb-list").click(function(){
				var num = $(this).children().children().eq(0).val();
				location.href="<%=request.getContextPath()%>/selectOne.pd?num="+ num;
			});

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

		$("div.searchArea > a").click(function() {
		    $(this).next("ul").toggle();
		    return false;
		});

		$("div.searchArea > ul > li").click(function() {
		    $(this).parent().hide().parent("div.searchArea").children("a").text($(this).text());
		    var val = $(this).attr('value');
		    $(this).prependTo($(this).parent());

		    $("#search").val($(this).attr('value'));
		});


	</script>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
</body>
</html>