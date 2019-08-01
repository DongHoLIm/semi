<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.bvengers.manager.depot.model.vo.*"%>
    <%
       ArrayList <Depot> list = (ArrayList <Depot>) request.getAttribute("list");
	    DepotPageInfo pi  = (DepotPageInfo) request.getAttribute("pi");
		int listCount = pi.getListCount();
		int currentPage = pi.getCurrentPage();
		int maxPage = pi.getMaxPage();
		int startPage = pi.getStartPage();
		int endPage = pi.getEndPage();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   #depotMain{
      width:80%;
      height: 80%;
      border:2px solid black;
   }
   tr{
      border:1px solid black;
   }
   #th{
      border:1px solid white;
      background:black;
      text-align:center;
      color:white;
   }
   td{
      text-align:center;
   }
   #inOutButton{
      padding-left:73%;
   }
</style>
<body>
<%@ include file = "../hfl/managerHeader.jsp" %>
   <br />
   <h3 align="center">입고 관리</h3>
   <br />
   <div id="inOutMain">
      <div id="table Area">
         <table id="depotMain" align="center">
         <tr>
            <th id="th">번호</th>
            <th id="th">상품코드</th>
            <th id="th">회원아이디</th>
            <th id="th">위치관리번호</th>
            <th id="th">검수상태</th>
            <th id="th">적치 일자</th>
            <th id="th">출고여부</th>
         </tr>
         <%for(Depot d :list){ %>
            <tr>
               <td><%=d.getProductNumber() %></td>
               <td><%=d.getProductCode() %></td>
               <td><%=d.getSelerId() %></td>
               <td><%=d.getLocationCode() %></td>
               <td><%=d.getCompletStatus() %></td>
               <td><%=d.getCheckDate() %></td>
               <td><%if(d.getReleaseDate()==null){ %>
                     <button id="relesDate" onclick="relesDate(<%=d.getProductCode()%>)">출고 요청</button>
                  <%}else{ %>
                     <label for=""><%=d.getReleaseDate() %></label>
                  <%} %>
               </td>
            </tr>
         <%} %>
         </table>

      </div>
   </div>
		<br>
	<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/inDepot.dp?currentPage=1'"><<</button>

			<% if(currentPage <= 1){ %>
			<button disabled><</button>
			<% }else { %>
			<button onclick="location.href='<%=request.getContextPath()%>/inDepot.dp?currentPage=<%=currentPage - 1%>'"> < </button>
			<% } %>

			<% for(int p = startPage; p <= endPage; p++){
				if(currentPage == p){
			%>
					<button disabled><%= p %></button>
			<% } else { %>
					<button onclick="location.href='<%=request.getContextPath()%>/inDepot.dp?currentPage=<%=p%>'"><%= p %></button>
			<%
				}
			   }
			%>

			<% if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<% }else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/inDepot.dp?currentPage=<%=currentPage + 1 %>'">></button>
			<% } %>

			<button onclick="location.href='<%=request.getContextPath()%>/inDepot.dp?currentPage=<%=maxPage%>'">>></button>
		</div>
   <script>
     function relesDate(code){
    	 var incode = window.prompt("상품코드 입력하세요");
    	 if(incode==code){
    		 $(function (){
    			 var aCode = code;
    			 $.ajax({
        			 url:"outProduct.do",
        			 type:"post",
        			 data:{"productCode":aCode},
        			 success:function(data){
        				 window.location.reload();
        			 }
        		 });
    		 });
    	 }else{
    		 alert("잘못입력하셨습니다.");
    	 }
     }
   </script>

</body>
</html>