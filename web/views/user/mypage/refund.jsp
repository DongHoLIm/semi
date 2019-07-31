<%@page import="com.kh.bvengers.user.myPage.model.vo.MyPagePageInfo"%>
<%@page import="com.kh.bvengers.user.myPage.model.vo.myPage"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   ArrayList<myPage> rList = (ArrayList<myPage>)request.getAttribute("rList");
   MyPagePageInfo pi = (MyPagePageInfo)request.getAttribute("pi");
   int listCount = pi.getListCount();
   int currentPage = pi.getCurrentPage();
   int maxPage = pi.getMaxPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();

   ArrayList<myPage> cList = (ArrayList<myPage>)request.getAttribute("cList");
   MyPagePageInfo pi1 = (MyPagePageInfo)request.getAttribute("pi1");

   int listCount1 = pi1.getListCount();
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
<script>

$(document).ready(function() {
	
    var now = new Date();
    var firstDate, lastDate;
    
    firstDate = new Date(now.getFullYear(),now.getMonth(),1);
    lastDate = new Date(now.getFullYear(),now.getMonth()+1,0);
    
    $('#startdate').val($.datepicker.formatDate('yy-mm-dd', firstDate));
    $('#enddate').val($.datepicker.formatDate('yy-mm-dd', lastDate));
 
    // Datepicker           
    $(".datepicker").datepicker({
        dateFormat : 'yy-mm-dd',
//         buttonImage : '/images/datepicker.png',
        buttonImageOnly : true,
        changeMonth : true, // 월선택 select box 표시 (기본은 false)
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        changeYear : true, // 년선택 selectbox 표시 (기본은 false)
        showButtonPanel : true, // 하단 today, done  버튼기능 추가 표시 (기본은 false)
        currentText: '오늘 날짜',
        closeText: '닫기',
        onClose : function ( selectedDate ) {
       
            var eleId = $(this).attr("id");
            var optionName = "";
 
            if(eleId.indexOf("StartDate") > 0) {
                eleId = eleId.replace("StartDate", "EndDate");
                optionName = "minDate";
            } else {
                eleId = eleId.replace("EndDate", "StartDate");
                optionName = "maxDate";
            }
 
            $("#"+eleId).datepicker( "option", optionName, selectedDate );       
            $(".searchDate").find(".chkbox2").removeClass("on");
        }
    });
   
        $('#searchStartDate').datepicker("option","onClose", function( selectedDate ) {   
            // 시작일 datepicker가 닫힐때
            // 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            $("#searchEndDate").datepicker( "option", "minDate", selectedDate );
            $(".searchDate").find(".chkbox2").removeClass("on");
        });
       
    
        //종료일.
        $('#searchEndDate').datepicker("option","onClose", function( selectedDate ) {   
            // 종료일 datepicker가 닫힐때
            // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정
            $("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
            $(".searchDate").find(".chkbox2").removeClass("on");
        });
       
        $('#searchEndDate').datepicker("option","onSelect", function( selectedDate ) {   
            // 종료일 datepicker가 닫힐때
            // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정
            $("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
            $(".searchDate").find(".chkbox2").removeClass("on");
           
          /*   var f = document.frm;
            $(".adminbuildenergyno").remove(); //name값이 다수여서 지워여야함
            f.submit(); */
        });
       
    
/*         $(".dateclick").dateclick();    // DateClick
        $(".searchDate").schDate();        // searchDate */
       
    });
    
    // Search Date
    
    $.fn.schDate = function() {
       var $obj = $(this);
       /* var $chk = $obj.find("input[type=radio]"); */
       $("#dateType3").click(function(){
       var d1 = $(this).parent().siblings().eq(0).text();
    	  $("#dateType4").parent(".chkbox2").removeClass("on");
    	  $("#dateType5").parent(".chkbox2").removeClass("on");
    	  $("#dateType3").parent(".chkbox2").addClass("on");
       });
       $("#dateType4").click(function(){
     	  $("#dateType3").parent(".chkbox2").removeClass("on");
     	  $("#dateType5").parent(".chkbox2").removeClass("on");
     	  $("#dateType4").parent(".chkbox2").addClass("on");
        });
       $("#dateType5").click(function(){
      	  $("#dateType3").parent(".chkbox2").removeClass("on");
      	  $("#dateType4").parent(".chkbox2").removeClass("on");
      	  $("#dateType5").parent(".chkbox2").addClass("on");
         });
       
       /* $chk.click(function() {
           $('input:not(:checked)').parent(".chkbox2").removeClass("on");
           $('input:checked').parent(".chkbox2").addClass("on");
       }); */
    }
    
    // DateClick
    jQuery.fn.dateclick = function() {
       var $obj = $(this);
       $obj.click(function() {
           $(this).parent().find("input").focus();
       });
    }
    
    function setSearchDate(start) {
    
       var num = start.substring(0, 1);
       var str = start.substring(1, 2);
    
       var today = new Date();
    
       //var year = today.getFullYear();
       //var month = today.getMonth() + 1;
       //var day = today.getDate();
    
       var endDate = $.datepicker.formatDate('yy-mm-dd', today);
       $('#searchEndDate').val(endDate);
    
       if(str == 'd'){
           today.setDate(today.getDate() - num);
       }else if (str == 'w'){
           today.setDate(today.getDate() - (num*7));
       }else if (str == 'm'){
           today.setMonth(today.getMonth() - num);
           today.setDate(today.getDate() + 1);
       }
    
       var startDate = $.datepicker.formatDate('yy-mm-dd', today);
       $('#searchStartDate').val(startDate);
    
       // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
       $("#searchEndDate").datepicker("option", "minDate", startDate);
    
       // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
       $("#searchStartDate").datepicker("option", "maxDate", endDate);
    
       /* var f = document.form;
       f.method = "post";
       $(".adminbuildenergyno").remove(); //name값이 다수여서 지워여야함 */
       
    };
    

    $(document).ready(function() {
    	
        var now1 = new Date();
        var firstDate1, lastDate;
        
        firstDate1 = new Date(now1.getFullYear(),now1.getMonth(),1);
        lastDate1 = new Date(now1.getFullYear(),now1.getMonth()+1,0);
        
        $('#startdate1').val($.datepicker.formatDate('yy-mm-dd', firstDate1));
        $('#enddate1').val($.datepicker.formatDate('yy-mm-dd', lastDate1));
     
        // Datepicker           
        $(".datepicker").datepicker({
            dateFormat : 'yy-mm-dd',
//             buttonImage : '/images/datepicker.png',
            buttonImageOnly : true,
            changeMonth : true, // 월선택 select box 표시 (기본은 false)
            dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
            dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
            monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            changeYear : true, // 년선택 selectbox 표시 (기본은 false)
            showButtonPanel : true, // 하단 today, done  버튼기능 추가 표시 (기본은 false)
            currentText: '오늘 날짜',
            closeText: '닫기',
            onClose : function ( selectedDate ) {
           
                var eleId1 = $(this).attr("id");
                var optionName1 = "";
     
                if(eleId1.indexOf("StartDate") > 0) {
                    eleId1 = eleId1.replace("StartDate1", "EndDate1");
                    optionName1 = "minDate1";
                } else {
                    eleId1 = eleId1.replace("EndDate1", "StartDate1");
                    optionName1 = "maxDate1";
                }
     
                $("#"+eleId1).datepicker( "option", optionName1, selectedDate1 );       
                $(".searchDate1").find(".chkbox21").removeClass("on");
            }
        });
       
            $('#searchStartDate1').datepicker("option","onClose", function( selectedDate1 ) {   
                // 시작일 datepicker가 닫힐때
                // 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#searchEndDate1").datepicker( "option", "minDate1", selectedDate1 );
                $(".searchDate1").find(".chkbox21").removeClass("on");
            });
           
        
            //종료일.
            $('#searchEndDate1').datepicker("option","onClose", function( selectedDate1 ) {   
                // 종료일 datepicker가 닫힐때
                // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정
                $("#searchStartDate1").datepicker( "option", "maxDate1", selectedDate1 );
                $(".searchDate1").find(".chkbox2").removeClass("on");
            });
           
            $('#searchEndDate1').datepicker("option","onSelect", function( selectedDate1 ) {   
                // 종료일 datepicker가 닫힐때
                // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정
                $("#searchStartDate1").datepicker( "option", "maxDate1", selectedDate1 );
                $(".searchDate1").find(".chkbox21").removeClass("on");
               
              /*   var f = document.frm;
                $(".adminbuildenergyno").remove(); //name값이 다수여서 지워여야함
                f.submit(); */
            });
           
        
    /*         $(".dateclick").dateclick();    // DateClick
            $(".searchDate").schDate();        // searchDate */
           
        });
    
        
        function setSearchDate1(start1) {
        
           var num1 = start1.substring(0, 1);
           var str1 = start1.substring(1, 2);
        
           var today1 = new Date();
        
           //var year = today.getFullYear();
           //var month = today.getMonth() + 1;
           //var day = today.getDate();
        
           var endDate1 = $.datepicker.formatDate('yy-mm-dd', today1);
           $('#searchEndDate1').val(endDate1);
        
           if(str1 == 'd'){
               today1.setDate(today1.getDate() - num1);
           }else if (str1 == 'w'){
               today1.setDate(today1.getDate() - (num1*7));
           }else if (str1 == 'm'){
               today1.setMonth(today1.getMonth() - num1);
               today1.setDate(today1.getDate() + 1);
           }
        
           var startDate1 = $.datepicker.formatDate('yy-mm-dd', today1);
           $('#searchStartDate1').val(startDate1);
        
           // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
           $("#searchEndDate1").datepicker("option", "minDate1", startDate1);
        
           // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
           $("#searchStartDate1").datepicker("option", "maxDate1", endDate1);
        
           /* var f = document.form;
           f.method = "post";
           $(".adminbuildenergyno").remove(); //name값이 다수여서 지워여야함 */
           
        };

 

</script>
<style>
.td_select {
	width:87%;
}
.searchBox {
   width: 100%;
   height:70%;
   padding: 2%;
   margin: 0 auto;
   text-align: center;
}

.searchdiv {
   width: 90%;
   height:70%;
   padding: 2%;
   margin: 0 auto;
   text-align: center;
   border:1px solid black;
}

.th_select {
	width:13%;
	margin-left:auto;
	margin-right:auto;
	
}

#selectDate {
	border:1px solid black;
   background:#FFF;
}

input[type=button] {
   border:1px solid black;
   background:#FFF;
}

.th_refund {
	text-align:center;
}
tr {
	text-align:center;
}

/* .searchBox {
	width: 100%;
	height: 100%;
	padding-right: 20%;
	padding-left: 20%;
	margin: auto;
}

 .searchdiv {
	margin-top:5%;
	margin-left:auto;
	margin-right:auto;
	width: 80%;
	height:70%;
	padding: 2%;
	margin: 0 auto;
	text-align: center;
	background-color:#FFF;
	border:1px solid black;
}  */

.tt_div { 
	width:60%;
	height:100%;
	margin-left:auto;
	margin-right:auto;

}

.t_div {
	width:100%;
	height:70%;
	margin: 0 auto;
	text-align: center;
	
}


#deliTable {
	align: center;
}

#deliTable tr {
	align: center;
}

#deliTable tr td {
	align: center;
}

#deliTable tr td img {
	width: 30%;
	align: center;
}

.board {
	width: 80%;
	margin: auto;
	align: center;
	border-spacing: 10px;
}

.board2 {
	width: 80%;
	margin: auto;
	align: center;
	border-spacing: 10px;
}
.pageNo {
	margin: auto;
}

.page-control {
	margin-top:5%;
}
</style>
</head>
<body>
	<header><%@ include file="../hfl/header.jsp"%></header>
	<br>
	<header><%@ include file="../hfl/myPageList.jsp"%></header>
<div class="tt_div">
<div class="searchdiv">
  <table class="searchBox">
                   <!-- <caption style="font-size:20px;">주문조회</caption> -->
     <colgroup>
         <col width="123px">
         <col width="*">
     </colgroup>
     <h3>환불조회</h3>
     <tbody>
         <tr>
             <th class="th_select">기간별 조회</th>
             <td class="td_select">
                <span class="chkbox2">
                       <input type="button" name="dateType" id="dateType3" value="1주일" onclick="setSearchDate('1w')"/>
                       <label for="dateType3"></label>
                   </span>
                   <span class="chkbox2">
                       <input type="button" name="dateType" id="dateType4" value="2주일" onclick="setSearchDate('2w')"/>
                       <label for="dateType4"></label>
                   </span>
                   <span class="chkbox2">
                       <input type="button" name="dateType" id="dateType5" value="1개월" onclick="setSearchDate('1m')"/>
                       <label for="dateType5"></label>
                   </span>
                   
          
           <!-- <div class="clearfix">
               시작일 -->
               <span class="dset">
                   <input type="text" class="datepicker inpType" name="startdate" id="searchStartDate" value="${adminBuildEnergyVo.startdate }" >               </span>
               <span class="demi">~</span>
               <!-- 종료일 -->
               <span class="dset">
                 <input type="text" class="datepicker inpType" name="enddate" id="searchEndDate" value="${adminBuildEnergyVo.enddate }" >
               </span>
               <span>
                   	<input type="button" name="selectDate" id="selectDate"  onclick="search1();" value="조회">
                   </span>
                   </td>
               </tr>
           <tbody>
       </table>
</div>

	<!-- <section id="sec1">
		<div id="area">
			<h3 style="font-weight: bold">환불 내역</h3>

		<div class="date-select" align="center">
			<br> <span style="font-weight: bold">기간별조회</span> <span>&nbsp;&nbsp;&nbsp;<input
				type="button" value="1주일">&nbsp;
			</span> &nbsp;<input type="button" value="15일">&nbsp; &nbsp;<input
				type="button" value="1개월">&nbsp; <input type="date">
			- <input type="date"><br>
		</div>
		</div> -->
	<br>
		<div align=center>
			<table border="1" class = "board">
				<tr>
					<th class="th_refund">주문번호</th>
					<th class="th_refund">주문날짜</th>
					<th class="th_refund">상품명</th>
					<th class="th_refund">환불금액</th>
					<th class="th_refund">상태</th>
				</tr>
				<% for(myPage m : rList) {%>
				<tr>
				<td><%=m.getOno() %></td>
				<td><%=m.getoDate() %></td>
				<td><%=m.getPname() %></td>
				<td><%=m.getDtPay() %></td>
				<td><%=m.getRefundStatus() %></td>
			</tr>
			<% } %>
			</table>			
			</div>
			
			<div class = "pagingArea" align ="center" >
      <button onclick = "location.href = '<%=request.getContextPath()%>/refundList.mp?currentPage=1'"><</button>
      <%if(currentPage <= 1) {%>
      <button disabled><</button>
      <%} else{%>
   <button onclick = "location.href='<%=request.getContextPath()%>/refundList.mp?currentPage=<%=currentPage-1%>'"><</button>
      <%}

      %>
         <%for (int p = startPage; p <= endPage; p++) {
            if(currentPage == p){
         %>
            <button disabled><%= p %></button>
         <%} else{ %>
               <button onclick = "location.href='<%=request.getContextPath()%>/refundList.mp?currentPage=<%=p%>'"><%= p %></button>
         <% }
         }
         %>


         <%if(currentPage >= maxPage){ %>
         <button disabled>></button>
         <%}else{ %>
         <button onclick ="location.hreh='<%=request.getContextPath()%>/refundList.mp?currentPage=<%=currentPage + 1%>'">></button>
         <%} %>
         <button onclick = "location.href='<%=request.getContextPath()%>/refundList.mp?currentPage=<%=maxPage%>'">>></button>

      </div>
      
      
		</div>
		<br><br><br><br>
		
		
		<div class="tt_div">
<div class="searchdiv">
  <table class="searchBox">
                   <!-- <caption style="font-size:20px;">주문조회</caption> -->
     <colgroup>
         <col width="123px">
         <col width="*">
     </colgroup>
     <h3>정산조회</h3>
     <tbody>
         <tr>
             <th class="th_select">기간별 조회</th>
             <td class="td_select">
                <span class="chkbox21">
                       <input type="button" name="dateType" id="dateType7" value="1주일" onclick="setSearchDate1('1w')"/>
                       <label for="dateType7"></label>
                   </span>
                   <span class="chkbox21">
                       <input type="button" name="dateType" id="dateType8" value="2주일" onclick="setSearchDate1('2w')"/>
                       <label for="dateType8"></label>
                   </span>
                   <span class="chkbox21">
                       <input type="button" name="dateType" id="dateType9" value="1개월" onclick="setSearchDate1('1m')"/>
                       <label for="dateType9"></label>
                   </span>
                   
          
           <!-- <div class="clearfix">
               시작일 -->
               <span class="dset">
                   <input type="text" class="datepicker inpType" name="startdate1" id="searchStartDate1" value="${adminBuildEnergyVo.startdate1 }" >               </span>
               <span class="demi">~</span>
               <!-- 종료일 -->
               <span class="dset">
                 <input type="text" class="datepicker inpType" name="enddate1" id="searchEndDate1" value="${adminBuildEnergyVo.enddate1 }" >
               </span>
               <span>
                   	<input type="button" name="selectDate1" id="selectDate1"  onclick="search2();" value="조회">
                   </span>
                   </td>
               </tr>
           <tbody>
       </table>
</div>

		<br>
		<div align=center>
				<table border="1" class = "board2"> 
			<tr>
				<th class="th_refund">정산번호</th>
				<th class="th_refund">정산날짜</th>
				<th class="th_refund">정산상태</th>
				<th class="th_refund">정산금액</th>
				<th class="th_refund">회원 정보</th>
			</tr>
			<% for(myPage m : cList) { %>
			<tr>
				<td><%=m.getAno() %></td>
				<td><%=m.getaDate() %></td>
				<td><%=m.getaStatus() %></td>
				<td><%=m.getaPrice() %></td>
				<td>은행명 : <%=m.getbCode()%><br> 계좌번호 : <%=m.getAccountNo() %><br> 예금주 : <%=m.getAname() %></td>
			</tr>
			<% } %>
		</table>
		</div></div>
		
		
   <div class = "pagingArea" align ="center" >
      <button onclick = "location.href = '<%=request.getContextPath()%>/refundList.mp?currentPage1=1'"><</button>
      <%if(currentPage1 <= 1) {%>
      <button disabled><</button>
      <%} else{%>
   <button onclick = "location.href='<%=request.getContextPath()%>/refundList.mp?currentPage1=<%=currentPage1-1%>'"><</button>
      <%}%>
         <%for (int p = startPage1; p <= endPage1; p++) {
            if(currentPage1 == p){
         %>
            <button disabled><%= p %></button>
         <%} else{ %>
               <button onclick = "location.href='<%=request.getContextPath()%>/refundList.mp?currentPage1=<%=p%>'"><%= p %></button>
         <% }
         }
         %>


         <%if(currentPage1 >= maxPage1){ %>
         <button disabled>></button>
         <%}else{ %>
         <button onclick ="location.hreh='<%=request.getContextPath()%>/refundList.mp?currentPage1=<%=currentPage1 + 1%>'">></button>
         <%} %>
         <button onclick = "location.href='<%=request.getContextPath()%>/refundList.mp?currentPage1=<%=maxPage1%>'">>></button>

      </div>

	<br>
	<footer><%@ include file="../hfl/footer.jsp"%></footer>
</body>
</html>