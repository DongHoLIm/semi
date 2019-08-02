<%@page import="com.kh.bvengers.product.model.vo.Product"%>
<%@page import="com.kh.bvengers.board.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.bvengers.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   Product p = (Product) request.getAttribute("p");
   Board b = (Board) request.getAttribute("b");
   ArrayList<Attachment> fileList = (ArrayList<Attachment>) request.getAttribute("fileList");
   Attachment productImg = fileList.get(0);
%>
<!DOCTYPE html>
<html>
<head>
<style>
.outer {
   margin-left: auto;
   margin-right: auto;
   margin-bottom: 50px;
}
.detail td, .detail th {
   text-align: center;
   border: 1px solid black;
}
.detail th {
   font-weight: bold;
   width : 50px;
   background: black;
   color: white;
   border: 1px solid white;
}

#titleImg {
   width: 100%;
   height: 300px;
}

#titleContentArea{
   height : 500px;
}
#price{
   font-size:2em;
}
.detailBtn{
   background: black;
   color: white;
   width: 100px;
   height: 50px;
}
#contents {
   text-align:left;
}
.btns{
   background: black;
   color: white;
   border: 1px solid white;
   width: 100px;
   height: 50px;
   margin-bottom:10%;
}
#commentHeaderTable{
   text-align:center;
}
#comments{
   width: 100%;
}
#commentHeaderTable th {
   text-align:center;
   font-weight: bold;
   height: 50px;
   background: black;
   color: white;
}
#commentHeaderTable .tWriter{
   width: 100px;
}
#commentHeaderTable .tContent{
   width: 500px;
}
#commentHeaderTable .tDate{
   width: 200px;
}
#commentHeaderTable .tRecommend{
   width: 100px;
}
#btnArea {
   width: 30%;
   align:center;
   margin : 20px auto;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <header><%@ include file="../hfl/header.jsp"%></header>
   <div class="outer">
      <form action="<%=request.getContextPath()%>/payment.pa" method="post" id="productDetail">
         <table class="detail" align="center">
            <tr>
               <th>판매자</th>
               <th colspan="3"><label id="writer"><%= b.getWriter() %></label></th>
            </tr>
            <tr>
               <th rowspan="3">상품</th>
               <td rowspan="3" width="150px">
                  <div id="titleImgArea" align="center">
                     <input type="hidden" value="<%= b.getPostsId() %>" name="postsId" />
                     <img src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%= productImg.getNewFileName() %>" id="titleImg" />
                  </div>
               </td>
               <th>상품명</th>
               <td id="titleContent"><label><%= b.getPostsTitle() %></label></td>
            </tr>
            <tr>
               <td colspan="2">
                  <input type="hidden" id="priceInput" value="<%=p.getProductMoney() %>"/>
                  <label id="price">원</label>
               </td>
            </tr>
            <tr>
               <td width="150px" style="border-right:0">
                  <input type="button" value="장바구니" id="basketBtn" class="detailBtn"/>
               </td>
               <td width="150px" style="border-left:0">
                  <input type="submit" value="구매하기" id="orderBtn" class="detailBtn"/>
               </td>
            </tr>
            <tr>
               <th>상품 설명</th>
               <td colspan="3">
                  <div id="titleContentArea">
                     <p id="contents"><%= (b.getContents()).replace("\r\n","<br>") %></p>
                  </div>
               </td>
            </tr>
            <tr>
               <th colspan="4" id="commentHeader">댓글 작성</th>
            </tr>
            <tr>
               <td colspan="4" ><textarea id="commentContent" rows="15" cols="130" style="resize:no"></textarea></td>
            </tr>
         </table>
      </form>
      <form id="comments">
      <div id="btnArea">
      <button id="addBtn" type="button" class="btns"align="center">댓글 등록</button>
      <button id="showBtn" type="button" class="btns" align="center">댓글 보기</button>
      </div>
      <table id="commentHeaderTable" class="commentTables" border="1" align="center">
         <tr>
            <th colspan="7">댓글 리스트</th>
         </tr>
         <tr>
            <td colspan="2" class="tWriter">작성자</td>
            <td colspan="3" class="tContent">내용</td>
            <td class="tDate">작성일</td>
            <td class="tRecommend">추천수</td>
         </tr>
      </table>
      <table id="commentSelectTable" class="commentTables" border="1" align="center">
         <tbody>
         </tbody>
      </table>
      </form>
   </div>
   <footer><%@ include file="../hfl/footer.jsp"%></footer>
   <script>
      $(function(){
         var postsId = <%= b.getPostsId()%>;
         $(document).ready(function(){
            $.ajax({
               url:"selectComment.pd",
               data:{postsId:postsId},
               type:"post",
               success:function(data){
                  var $commentSelectTable = $("#commentSelectTable tbody");
                  $commentSelectTable.html("");
                  for(var key in data){
                     var $tr = $("<tr>");
                     var $writeTd = $("<td>").text(data[key].memberId).addClass("tWriter");
                     var $contentTd = $("<td>").text(data[key].commentContents).addClass("tContent");
                     var $dateTd = $("<td>").text(data[key].commentDate).addClass("tDate");
                     var $recommend = $("<td>").text(data[key].recommendCount).addClass("tRecommend");
                     $tr.append($writeTd);
                     $tr.append($contentTd);
                     $tr.append($dateTd);
                     $tr.append($recommend);
                     $commentSelectTable.append($tr);
                     $(".tWriter").css({"width":"100px", "height":"50px"});
                     $(".tContent").css("width", "400px");
                     $(".tDate").css("width", "100px");
                     $(".tRecommend").css("width","100px");
                     $commentSelectTable.css({"text-align":"center", "width":"100%","margin":"auto"});
                     $(".commentTables").hide();
                  }
               },
               error:function(){
                  alert("댓글 입력 실패");
               }
            });
         });
      });
      $("#writer").on("click", function(){
         window.open("<%= request.getContextPath()%>/myInfo.me?userId=<%=b.getWriter()%>", '<%= b.getWriter()%>', 'width=400, height=600, location=no, toolbar=no, fullscreen=no');
      });
      $(function(){
         var price = numeral($("#priceInput").attr('value')).format( '0,0' );

         $("#price").text(price+"원");
         <% if(loginUser!=null){%>
         $("#addBtn").click(function(){
            var writer = <%=loginUser.getMemberNo()%>;
            var content = $("#commentContent").val();
            var postsId = <%=b.getPostsId()%>;

            $.ajax({
               url:"insertComment.pd",
               data:{writer:writer, content:content, postsId:postsId},
               type:"post",
               success:function(data){
                     location.reload();
                     $(".commentTables").show();
               },
               error:function(){
                  alert("댓글 입력 실패");
               }
            });
         });
         <%}%>
         $("#showBtn").click(function(){
            $(".commentTables").toggle();
            if($(this).html()=="댓글 보기"){
               $(this).html("댓글 닫기");
            } else {
               $(this).html("댓글 보기");
            };
         });
      });
       $("#basketBtn").click(function(){
          $(function(){
            var fileName="<%=productImg.getNewFileName()%>";
            $.ajax({
               url:"basketList.bk",
               type:"post",
               data:{fileName:fileName},
               success: function(data){
                  if(data==null){
                     alert("해당상품은 이미 장바구니에 있습니다.");
                  }else{
                  if(confirm("장바구니로 이동하시겠습니까?")==true){
                     location.href = "<%=request.getContextPath()%>/basketAllList.bk";
                  }else{

                  }
                  }
               }

            })
          });
      });
   </script>
</body>
</html>