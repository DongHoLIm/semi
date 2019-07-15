<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<select id="select1" onchange="itemChange()">
	<option>키보드</option>
	<option>마우스</option>
	<option></option>
</select>
<select id="select2">
</select>
</body>
<script>
function itemChange(){
	var keybord =["갈축","청축","적축"];
	var mouse = ["a","d","c"];
	var monitor=["df","ef"];
	
	var selectItem = $("#select1").val();
	var changeItem;
	if(selectItem == "키보드"){
		changeItem = keybord;
	}else if(selectItem == "마우스"){
		changeItem = mouse;
	}else{
		changeItem = monitor;
	}
	$('#select2').empty();
	for(var i = 0; i<changeItem.size(); i++){
		var option = $("<option>"+changeItem[i]+"</option>");
		$('#select2').append(option);
	}
}
</script>
</html>