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
   #requestRelease{
   	width: 80%;   	
   	 margin: 0 auto;
   	border:1px solid black;
   	text-align: center;
   }
   #requestProduct{
   	width: 80%;
   }
</style>
<body>
<%@ include file = "../hfl/managerHeader.jsp" %>
   <br />
   <h3 align="center">입고 관리</h3>
   <br />
   <div id="inOutMain">
   		<div id="requestRelease">   			
   			<input type="text" id="requestProduct"	value="" width="100%" />   				
   			<input type="button" onclick="relesDate();" value="출고요청"/>   			
   		</div>
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
               <td><%=d.getProductCode() %><input type="hidden" id="productCode" value="<%=d.getProductCode()%>"/></td>
               <td><%=d.getSelerId() %></td>
               <td><%=d.getLocationCode() %></td>
               <td><%=d.getCompletStatus() %></td>
               <td><%=d.getCheckDate() %></td>
               <td><%if(d.getPayStatus()==null){
            		d.getReleaseDate();
            	}else{%> 
					 <input type="checkBox" value="<%=d.getProductCode()%>" onclick="appendText();" id="checkStatus"/>
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
     function relesDate(){
    	 var productCode = $("input[id='requestProduct']").val();
    	 var allProCode = $("input[id='productCode']");
    	 var check = $("input[id='checkStatus']");
    	 var allListProductCode = "";
    	 var checkAllList= "";
    	 allProCode.each(function(index){
    		allListProductCode+=$(this).val()+","; 
    	 });
    	 check.each(function(index){
    		checkAllList+=$(this).val()+","; 
    	 });
    		$(function (){
    			 var aCode = productCode;
    			 $.ajax({
        			 url:"outProduct.do",
        			 type:"post",
        			 data:{"productCode":aCode,"listProductCode":allListProductCode,"checkList":checkAllList},
        			 success:function(data){
        				 window.location.reload();
        			 }
        		 });
    		 });
     }
   /*   $("#dynamicUL").on("click", 'input:checkbox', function() {
         $("#log").prepend( $(this).val() + " / " + $(this).is(":checked") + " 체크박스가 클릭되었습니다.<br/>"); */
     function appendText(){
         var text = $("input[id='requestProduct']");
         text.val("");
    	 var code="";
    	 $("#checkStatus:checked").each(function(index){
				code+=$(this).val()+","
			});
    	 text.val(code);
    	 
    	}
    	
     
   </script>

</body>
</html>