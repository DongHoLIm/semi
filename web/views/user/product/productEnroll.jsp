<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글 등록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
.title {
	font-size:20px;
	margin:0 auto;
}

	tr {
	width:40%;
}
	th {
	width:20%;
}
#btn_enroll {
	border: 1px solid #ffd8d9;
	font-size: 14px;
	width:10%;
	font-family:'Nanum Gothic', sans-serif;
	font-weight:550;
	border-radius: 5px;
	background-color: #ffd8d9;
	color: black;
}

</style>
</head>
<body>

	<header><%@ include file="../hfl/header.jsp" %></header>
	<div><%@ include file="../hfl/list.jsp" %></div>
<br><br><br><br>
<div class="container">
<table class="table table-bordered" align="center" style="width:60%;">
    <thead>
        <caption class="title"><b>상품 등록</b></caption>
    </thead>
        <form action=".jsp" method="post" encType="multiplart/form-data" class="form_enroll">
            <tr>
                <th>제목 </th>
                <td><input type="text" size=30 name="subject" class="form-control"/></td>
            </tr>
            <tr><th>카테고리</th>
            <td>
	            <select class="cate_enroll" name="카테고리" style="width:40%;">
					<option id="pc" value="PC">PC
					<option id="laptop" value="노트북">노트북
					<option id="digital" value="가전제품">가전제품
				</select>
			</td>
            </tr>
            <tr>
                <th>상품명 </th>
                <td><textarea cols="10" size=30 name="content" class="form-control" style="resize:none"></textarea></td>
            </tr>
            <tr>
                <th>가격 </th>
                <td><input type="text" name="price" class="form-control"></td>
            </tr>
            <tr>
                <th>상품 이미지</th>
                <td>
                	<input type="file" name="file1" class="pull-right" id="file1" style="width:50%;"/>
                	<input type="file" name="file2" class="pull-right" id="file2" style="width:50%;"/>
                	<input type="file" name="file3" class="pull-right" id="file3" style="width:50%;"/>
                	<input type="file" name="file4" class="pull-right" id="file4" style="width:50%;"/>
                </td>
            </tr>
            <tr>
                <th>상품 설명 </th>
                <td><textarea cols="10" rows="10" name="content" class="form-control" style="resize:none"></textarea></td>
            </tr>
            <tr>
                <th>상품 보관일자 </th>
                <td><input type="date" name="date" style="width:40%;" class="form-control" name="keepDate" id="keepDate"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" value="등록" id="btn_enroll" onclick="sendData()" class="pull-right"/>
                    <input type="button" value="취소" id="btn_enroll" class="pull-left"/>
                    <input type="button" value="목록" id="btn_enroll" class="pull-right" onclick="javascript:location.href='list.jsp'"/>
                </td>
            </tr>
        </form>
</table>
</div>
<footer><%@ include file="../hfl/footer.jsp" %></footer>
</body>
</html>