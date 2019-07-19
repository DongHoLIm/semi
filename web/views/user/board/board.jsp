<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*, com.kh.bvengers.board.model.*"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#board{
	text-align:center;
}
#wirte{
	position: absolute;
	right: 30px;
}

.spot {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
 
}


.svg-wrapper {
  margin-top: 0;
  position: relative;
  width: 150px;
  /*make sure to use same height/width as in the html*/
  height: 40px;
  display: inline-block;
  border-radius: 3px;
  margin-left: 5px;
  margin-right: 5px
}


#shape {
  stroke-width: 6px;
  fill: transparent;
  stroke: #009FFD;
  stroke-dasharray: 85 400;
  stroke-dashoffset: -220;
  transition: 1s all ease;
}


#text {
  margin-top: -35px;
  text-align: center;
}

#text a {
  color: white;
  text-decoration: none;
  font-weight: 100;
  font-size: 1.1em;
}

.svg-wrapper:hover #shape {
  stroke-dasharray: 50 0;
  stroke-width: 3px;
  stroke-dashoffset: 0;
  stroke: #06D6A0;
}

</style>
</head>
<body>
<head><%@include file ="../hfl/header.jsp" %></head>
<div class="container">
	<br>
	<br>
  <h2 id="board">공지사항</h2>
  <table class="table">
      <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성날짜</th>
      </tr>
    </thead>
    <tbody>
      <tr>
   
        <td>1</td>
        <td><a href="boarderinsert.jsp">title</a></td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>

    </tbody>
  </table>
</div>
<div class="container">
	<br>
	<br>
	<hr>
  <h2 id="board">게시판</h2>
  <form action="" align="right">
  <select>
  	<option value="title">제목</option>
  	<option value="writer">작성자</option>
  	<option value="wdate">날짜</option>
  </select>
  <input type="text">
  <input type="submit" value="검색">
  </form>             
  <table class="table">
      <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성날짜</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td><a href="boarderinsert.jsp">title</a></td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
      <tr>
        <td>2</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
      <tr>
        <td>3</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
        <tr>
        <td>4</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
        <tr>
        <td>5</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
      <tr>
        <td>6</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
      <tr>
        <td>7</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
      <tr>
        <td>8</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
      <tr>
        <td>9</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>
      <tr>
        <td>10</td>
        <td>title</td>
        <td>writer</td>
        <td>2019-07-06</td>
      </tr>      
    </tbody>
  </table>
</div>
<center>
	<ul class="pagination">
	  <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
	  <li class="page-item"><a class="page-link" href="#">1</a></li>
	  <li class="page-item"><a class="page-link" href="#">2</a></li>
	  <li class="page-item"><a class="page-link" href="#">3</a></li>
	  <li class="page-item"><a class="page-link" href="#">다음</a></li>
	<!--   <li><input type="button" id="wirte" value="글작성" onclick="location.href='boarderwriter.jsp'"></li> -->
	</ul>
	<div id="workarea">
  <div class="position">
	
    <div class="svg-wrapper">
      <svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
        <rect id="shape" height="40" width="150" />
        <div id="text" >
          <a href="../board/boarderwriter.jsp" style="color:black"><span class="spot"></span>글작성</a>
        </div>
      </svg>
    </div>
    </div>
</center>
</body>
<footer><%@ include file="../hfl/footer.jsp" %></footer>
</html>


