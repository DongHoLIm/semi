<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import = "java.util.*, com.kh.bvengers.board.model.*,java.util.*,com.kh.bvengers.board.model.vo.*,com.kh.bvengers.user.myPage.model.vo.*"%>
<%
   ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("List");
   System.out.println(list);
   ArrayList<Board> List = (ArrayList<Board>)request.getAttribute("list");

   BoardPageInfo pi1 = (BoardPageInfo)request.getAttribute("pi");

   int listCount = pi1.getListCount();
   int currentPage1 = pi1.getCurrentPage();
   int maxPage1 = pi1.getMaxPage();
   int startPage1 = pi1.getStartPage();
   int endPage1 = pi1.getEndPage();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
   #sec1 {
         width:100%;
         height:100%;
         padding-top:2%;
         padding-right:20%;
         padding-bottom:2%;
         padding-left:20%;
         margin:auto;
   }

   .board{
      width:80%;
      margin:auto;
      align:center;
        border-spacing: 10px;
   }

   .row0{
      background:#eee;
      margin:auto;
      border-bottom: 2px solid #555;
   }
   .row1,.row2, .row3, .row4, .row, .row6, .row7, .row8, .row9, .row10{
      border-top: 1px solid #ccc;
      border-bottom: 1px solid #ccc;
   }
   .pageNo{
      margin:auto;
   }

   #writer{
      margin-top:2px;
      float:right;
      background:white;
      border:1px solid skyblue;
   }

   dt, dd {
      padding: 10px;
   }

   dt {
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      border:1px solid black;
      margin-bottom: 5px;
   }
   dt:hover{
      background:#ededed;
   }
   dt span {
      display: inline-block;
      width: 5px;
      height: 5px;
      background-color: black;
      vertical-align: middle;
      margin-right: 10px;
    }

   dd {
      background:    -webkit-linear-gradient(#fff, #eee);
      background:    -moz-linear-gradient(#fff, #eee);
      background:    -o-linear-gradient(#fff, #eee);
      background:    -webkit-gradient(linear, 0 0, 0 100%, from(#fff), to(#eee));
      background:    linear-gradient(#fff, #eee);

      margin-bottom: 5px;
      display: none;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
    }
    #accordionArea{
       padding-right:2%;
       padding-left:2%;
       width:80%;
       margin:0 auto;
       border:1px solid #ddd;

    }
</style>
</head>
<body>
   <!-- header 영역 -->
   <header><%@ include file="../hfl/header.jsp" %></header>

   <section id="sec1">
   <div id="accordionArea">
   <h2 align="left"> 자주 찾는 질문</h2>
   <%for (Board b : list) {%>
   <dl>
      <dt><span></span><%=b.getPostsTitle()%></dt>
      <dt><span></span><%=b.getContents() %></dt>
      <!--  <dt><span></span>아이디/패스워드는 어디서 찾나요?</dt>
          <dd>우측 상단에 보이시는 로그인 버튼을 클릭 시 로그인 페이지로 이동되며 로그인페이지 하단에 아이디/패스워드 찾기 버튼을 통하여 확인하실 수 있습니다.</dd>
       <dt><span></span>주문한 물건이 어디쯤 배송중인가요?</dt>
          <dd>현재 배송 상태에 관한 현황 정보는 마이페이지에서 확인하실 수 있습니다.</dd>
       <dt><span></span>오늘 스터디는 어디서 하나요?</dt>
            <dd>5층 할리스 7그램 프라빈 바나프레소 양평</dd>
       <dt><span></span>아이디는 어떻게 변경할 수 있나요?</dt>
          <dd>아이디의 변경은 불가능합니다. 새로운 아이디를 사용하고 싶으신 경우 계정을 새로 만들어 이용해 주시기 바랍니다.</dd>
 -->   </dl>
   <% }%>
   </div>
   <script>
   $(document).ready(function(){
      $('dt').removeClass('on').next().slideUp();
   })
   $('dt').on('click', function () {

       if ($(this).hasClass('on')) {
           slideUp();
       } else {
           slideUp();
           $(this).addClass('on').next().slideDown();
       }
       function slideUp() {
           $('dt').removeClass('on').next().slideUp();
       };

   })
   </script>

   <br><br><br><br>
   <p align="center">내가 쓴 질문</p>
      <table class="board" id = messageArea>
         <tr class="row0">
         <thead>
            <th>글 번호</th>
            <th>제목</th>
            <th>답변여부</th>
            <th>작성일자</th>
         </thead>
         </tr>
         <tr class="row1">
         <%for(Board b :List){ %>
         <input type = "hidden" value = "<%=b.getPostsId() %>">
               <td><%= b.getPostsId() %></td>
               <td><%= b.getPostsTitle() %></td>
               <td><%= b.getMemberName()%></td>
               <td><%= b.getCreateDate()%></td>
         </tr>
      <%  int num = b.getPostsId();}%>
         <tr>
         </tr>

         <button id="writer" align="right" onclick="location.href='<%=request.getContextPath()%>/views/user/serviceCenter/questionWriter.jsp'"> 글 작성</button>
      </table>
      <br><br>
       <div class = "pagingArea" align ="center" >
      <button onclick = "location.href = '<%=request.getContextPath()%>/selectNotice.no?currentPage=1'"><</button>
      <%if(currentPage1 <= 1) {%>
      <button disabled><</button>
      <%} else{%>
   <button onclick = "location.href='<%=request.getContextPath()%>/selectNotice.no?currentPage=<%=currentPage1-1%>'"><</button>
      <%}
         System.out.println("최근 페이지는" + currentPage1);
      %>
         <%for (int p = startPage1; p <= endPage1; p++) {
            if(currentPage1 == p){
         %>
            <button disabled><%= p %></button>
         <%} else{ %>
               <button onclick = "location.href='<%=request.getContextPath()%>/selectNotice.no?currentPage=<%=p%>'"><%= p %></button>
         <% }
         }
         %>


         <%if(currentPage1 >= maxPage1){ %>
         <button disabled>></button>
         <%}else{ %>
         <button onclick ="location.hreh='<%=request.getContextPath()%>/selectNotice.no?currentPage=<%=currentPage1 + 1%>'">></button>
         <%} %>
         <button onclick = "location.href='<%=request.getContextPath()%>/selectNotice.no?currentPage=<%=maxPage1%>'">>></button>

      </div>

   </section>
   <script>

   $(function(){
      $("#messageArea td").mouseenter(function(){
         $(this).parent().css({"background":"darkgray","cursor":"pointer"});
      }).mouseout(function(){
            $(this).parent().css({"background":"white"});
      }).click(function(){
         var num = $(this).parent().children("input").val();
         console.log(num);
          location.href="<%=request.getContextPath()%>/soqa.qo?num=" + num;
      });
   });


   </script>
   <!-- footer 영역 -->
   <footer><%@ include file="../hfl/footer.jsp" %></footer>
</body>
</html>