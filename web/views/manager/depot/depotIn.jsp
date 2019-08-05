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
   .wrap {
	    text-align: center;
	}
   #reles{
	    -webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	    -moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	    -ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	    -o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	    transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	    display: block;
	    margin: 20px auto;
	    text-decoration: none;
	    border-radius: 4px;
	    padding: 20px 30px;
	}
	
	a.button {
	    color: black;
	    box-shadow: black 0 0px 0px 2px inset;
	}
	
	a.button:hover {
	    color: white;
	    box-shadow: black 0 0px 0px 40px inset;
	}
	
	a.button2 {
	    color: black;
	    box-shadow: black 0 0px 0px 2px inset;
	}
	
	a.button2:hover {
	    color: white;
	    box-shadow: black 0 80px 0px 2px inset;
	}
</style>
<body>
<%@ include file = "../hfl/managerHeader.jsp" %>
   <br />
   <h3 align="center">입고 관리</h3>
   <br />
   <div id="inOutMain">
   		<div class="wrap">  			
   			<input type="text" id="requestProduct"	value="" width="50%" onkeypress="if(event.keyCode==13){enterEvent();}" />   				
   			 <a class="button" onclick="search();" >출고요청</a>		
   		</div>
      <div id="table Area">
         <table id="depotMain" align="center">
         <tr>
         	<th id="th"></th>
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
            	<td><input type="checkBox" value="<%=d.getProductCode()%>" onclick="appendText();" id="checkStatus"/></td>
               <td><%=d.getProductNumber() %></td>
               <td><%=d.getProductCode() %><input type="hidden" id="productCode" value="<%=d.getProductCode()%>"/></td>
               <td><%=d.getSelerId() %></td>
               <td><%=d.getLocationCode() %></td>
               <td><%=d.getCompletStatus() %></td>
               <td><%=d.getCheckDate() %></td>
               <td><%if(d.getPayStatus()==null){
            		d.getReleaseDate();
            	}else{%> 
					결제완료
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
    		$(function (){
    			 var aCode = productCode;
    			 $.ajax({
        			 url:"outProduct.do",
        			 type:"post",
        			 data:{"productCode":aCode},
        			 success:function(data){
        				 window.location.reload();
        			 }
        		 });
    		 });
     }
     function appendText(){
         var text = $("input[id='requestProduct']");
         text.val("");
    	 var code="";
    	 $("#checkStatus:checked").each(function(index){
				code+=$(this).val()+","
			});
    	 text.val(code);
    	 
    	}
    function enterEvent(){
    	 var text = $("input[id='requestProduct']");
    	var code ="";	
    	 text.each(function(index){
    			code=$(this).val()+","
    		});
    	 text.val(code);
    }     
   </script>

</body>
</html>