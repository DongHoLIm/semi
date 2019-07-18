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

.box{
   text-align: right;
   padding-right:20px;
}

.container-fluid{
   text-align : center;

}

.menu{
   padding :10px;
   text-align:
}
.carousel-inner > .item > img {
      top: 0;
      left: 0;
      min-width: 100%;
      min-height: 400px;
}
.firstItem{
	cursor:pointer;
}
</style>

</head>
	<!-- header 영역 -->
<body>
<div class="thumbnailArea">
		<% for(int i = 0; i < list.size(); i++) {
			HashMap<String, Object> hmap = list.get(i);
		%>
	<div class="thumb-list" align="center">
		<div>
			<input type="hidden" value="<%= hmap.get("postsId")%>" />
			<img src="/sp/thumbnail_uploadFiles/<%= hmap.get("newFileName")%>" width="200px" height="200px" alt="추천 상품 사진" />
		</div>
	</div>
	<% } %>
</div>
	<!-- footer 영역 -->
</body>
</html>