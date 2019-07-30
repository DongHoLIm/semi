<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
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
           
            var f = document.frm;
            f.method = "post";
            $(".adminbuildenergyno").remove(); //name값이 다수여서 지워여야함
            f.submit();
        });
       
    
        $(".dateclick").dateclick();    // DateClick
        $(".searchDate").schDate();        // searchDate
       
    });
    
    // Search Date
    
    $.fn.schDate = function() {
       var $obj = $(this);
       /* var $chk = $obj.find("input[type=radio]"); */
       $("#dateType1").click(function(){
       var d1 = $(this).parent().siblings().eq(0).text();
    	  $("#dateType2").parent(".chkbox2").removeClass("on");
    	  $("#dateType3").parent(".chkbox2").removeClass("on");
    	  $("#dateType1").parent(".chkbox2").addClass("on");
       console.log(d1);
    	  <%-- location.href='<%=request.getContextPath()%>/orderLook.mp?d1='+d1; --%>
       });
       $("#dateType2").click(function(){
     	  $("#dateType1").parent(".chkbox2").removeClass("on");
     	  $("#dateType3").parent(".chkbox2").removeClass("on");
     	  $("#dateType2").parent(".chkbox2").addClass("on");
        });
       $("#dateType3").click(function(){
      	  $("#dateType1").parent(".chkbox2").removeClass("on");
      	  $("#dateType2").parent(".chkbox2").removeClass("on");
      	  $("#dateType3").parent(".chkbox2").addClass("on");
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
    
       if (str == 'w') {
           today.setDate(today.getDate() - (num * 7));
       } else if (str == 'f') {
           today.setDate(today.getDate() - (num * 15));
       } else if (str == 'm') {
           today.setMonth(today.getMonth() - num);
           today.setDate(today.getDate() + 1);
       }
    
       var startDate = $.datepicker.formatDate('yy-mm-dd', today);
       $('#searchStartDate').val(startDate);
    
       // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
       $("#searchEndDate").datepicker("option", "minDate", startDate);
    
       // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
       $("#searchStartDate").datepicker("option", "maxDate", endDate);
    
       var f = document.frm;
       f.method = "post";
       $(".adminbuildenergyno").remove(); //name값이 다수여서 지워여야함
       
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
   width: 60%;
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

</style>
</head>
<body>
<div class="searchdiv">
  <table class="searchBox">
                   <!-- <caption style="font-size:20px;">주문조회</caption> -->
     <colgroup>
         <col width="123px">
         <col width="*">
     </colgroup>
     <h2>주문조회</h2>
     <tbody>
         <tr>
             <th class="th_select">기간별 조회</th>
             <td class="td_select">
                <span class="chkbox2">
                       <input type="button" name="dateType" id="dateType1" value="1주일" onclick="setSearchDate('1w')"/>
                       <label for="dateType1"></label>
                   </span>
                   <span class="chkbox2">
                       <input type="button" name="dateType" id="dateType2" value="15일" onclick="setSearchDate('1f')"/>
                       <label for="dateType2"></label>
                   </span>
                   <span class="chkbox2">
                       <input type="button" name="dateType" id="dateType3" value="1개월" onclick="setSearchDate('1m')"/>
                       <label for="dateType3"></label>
                   </span>
                   
          
           <!-- <div class="clearfix">
               시작일 -->
               <span class="dset">
                   <input type="text" class="datepicker inpType" name="startdate" id="searchStartDate" value="${adminBuildEnergyVo.startdate }" >
                   <a href="#none" class="btncalendar dateclick"><img src="<%=request.getContextPath()%>/images/btn_calendar.gif"></a>
               </span>
               <span class="demi">~</span>
               <!-- 종료일 -->
               <span class="dset">
                 <input type="text" class="datepicker inpType" name="enddate" id="searchEndDate" value="${adminBuildEnergyVo.enddate }" >
                   <a href="#none" class="btncalendar dateclick"><img src="<%=request.getContextPath()%>/images/btn_calendar.gif"></a>
               </span>
               <span>
                   	<input type="submit" name="selectDate" id="selectDate" value="조회" onclick="orderDate();">
                   </span>
           <!-- </div>  -->  
                   </td>
               </tr>
           <tbody>
       </table>
</div>
</body>


<script>

function orderDate(){
	var startDate = "${adminBuildEnergyVo.startdate}";
	var endDate = "${adminBuildEnergyVo.enddate}";
	
	console.log(startDate);
	console.log(endDate)
	
	location.href="<%=request.getContextPath()%>/views/user/mypage/orderDate.mp?startDate="+startDate"&endDate"+endDate;

		}

</script>

</html>