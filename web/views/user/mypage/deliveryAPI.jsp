<%@page import="com.kh.bvengers.user.myPage.model.vo.myPage"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
#tekbeCompnayList {
    width: 250px;
    height: 30px;
    padding-left: 10px;
    font-size: 16px;
    color: black;
    border: 1px solid black;
    border-radius: 3px;
    margin-top:10%;
    margin-left:auto;
 	margin-right:auto;
}

#invoiceNumberText {
    width: 240px;
    height: 30px;
    padding-left: 10px;
    font-size: 16px;
    color: black;
    border: 1px solid black;
    border-radius: 3px;
    margin-left:auto;
 	margin-right:auto;
}

#tekbeCompnayName, #invoiceNumber{
  color:black;
  font-weight: bold;
  margin-left:auto;
  margin-right:auto;
  font-size: 16px;
}

#myButton1 {
  margin-left:15%;
  background: #FFF;
  background-image: -webkit-linear-gradient(top, #FFF, #FFF);
  background-image: -moz-linear-gradient(top, #FFF, #FFF);
  background-image: -ms-linear-gradient(top, #FFF, #FFF);
  background-image: -o-linear-gradient(top, #FFF, #FFF);
  background-image: linear-gradient(to bottom, #FFF, #FFF);
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0px;
  color: black;
  font-size: 16px;
  padding: 10px 10px 10px 10px;
  text-decoration: none;
}

table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid black;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color:black;
}

</style>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

<script>

$(document).ready(function(){
	var myKey = "OVPc0EILBoWsYekipkJdaQ"; // sweet tracker���� �߱޹��� �ڽ��� Ű �ִ´�.

		// �ù�� ��� ��ȸ company-api
        $.ajax({
            type:"GET",
            dataType : "json",
            url:"https://info.sweettracker.co.kr/api/v1/companylist?t_key="+myKey,
            success:function(data){

            		// ��� 1. JSON.parse �̿��ϱ�
            		var parseData = JSON.parse(JSON.stringify(data));

            		// ��� 2. Json���� ������ �����Ϳ� Array�� �ٷ� �����ϱ�
            		var CompanyArray = data.Company; // Json Array�� �����ϱ� ���� Array�� Company �Է�

            		var myData="";
            		$.each(CompanyArray,function(key,value) {
	            			myData += ('<option value='+value.Code+'>'+value.Name + '</option>');
            		});
            		$("#tekbeCompnayList").html(myData);
            }
        });

		// ��������� ������� tracking-api
        $("#myButton1").click(function() {
        	var t_code = $('#tekbeCompnayList option:selected').attr('value');
        	var t_invoice = $('#invoiceNumberText').val();
            $.ajax({
                type:"GET",
                dataType : "json",
                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
                success:function(data){
                	var myInvoiceData = "";
                	if(data.status == false){
                		myInvoiceData += ('<p>'+data.msg+'<p>');
                	}else{
	            		myInvoiceData += ('<tr>');
	            		myInvoiceData += ('<th>'+"�����»��"+'</td>');
	            		myInvoiceData += ('<th>'+data.senderName+'</td>');
	            		myInvoiceData += ('</tr>');
	            		myInvoiceData += ('<tr>');
	            		myInvoiceData += ('<th>'+"��ǰ����"+'</td>');
	            		myInvoiceData += ('<th>'+data.itemName+'</td>');
	            		myInvoiceData += ('</tr>');
	            		myInvoiceData += ('<tr>');
	            		myInvoiceData += ('<th>'+"�����ȣ"+'</td>');
	            		myInvoiceData += ('<th>'+data.invoiceNo+'</td>');
	            		myInvoiceData += ('</tr>');
	            		myInvoiceData += ('<tr>');
	            		myInvoiceData += ('<th>'+"�����ȣ"+'</td>');
	            		myInvoiceData += ('<th>'+data.receiverAddr+'</td>');
	            		myInvoiceData += ('</tr>');
                	}


                	$("#myPtag").html(myInvoiceData)

                	var trackingDetails = data.trackingDetails;


            		var myTracking="";
            		var header ="";
            		header += ('<tr>');
            		header += ('<th>'+"�ð�"+'</th>');
            		header += ('<th>'+"���"+'</th>');
            		header += ('<th>'+"����"+'</th>');
            		header += ('<th>'+"��ȭ��ȣ"+'</th>');
        			header += ('</tr>');

            		$.each(trackingDetails,function(key,value) {
	            		myTracking += ('<tr>');
            			myTracking += ('<td>'+value.timeString+'</td>');
            			myTracking += ('<td>'+value.where+'</td>');
            			myTracking += ('<td>'+value.kind+'</td>');
            			myTracking += ('<td>'+value.telno+'</td>');
	            		myTracking += ('</tr>');
            		});

            		$("#myPtag2").html(header+myTracking);

                }
            });
        });

});


</script>
<body>
<span id="tekbeCompnayName" size=20>�ù�ȸ���: </span>
<select id="tekbeCompnayList" name="tekbeCompnayList"></select><br/><br/>
<span id="invoiceNumber">������ȣ: </span>
<input type="text" id="invoiceNumberText" name="invoiceNumberText"><br/><br/>
<button id="myButton1">�ù� ��ȸ�ϱ� </button>
<br/>
<br/>
<div>
	<table id="myPtag"></table>
</div>
<br/>
<div>
	<table id="myPtag2"></table>
</div>
</body>
</html>