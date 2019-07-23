<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	#sub_cate{
		
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
		<caption class="title"><b>상품 등록</b></caption>
		<form action="<%=request.getContextPath()%>/insert.po" method="post" encType="multipart/form-data">
		<table class="table table-bordered" align="center" style="width:60%;">
			<tr>
				<th>제목 </th>
				<td colspan="3"><input type="text" size=30 name="postsTitle" class="form-control"/></td>
			</tr>
			<tr>
				<th width="25%">카테고리</th>
				<td width="25%">
					<select class="cate_enroll" name="mainCate" style="width:70%;">
						<option id="pc" value="pc">PC
						<option id="laptop" value="laptop">노트북
						<option id="digital" value="digital">가전제품
					</select>
				</td>
				<th width="25%">상세카테고리</th>
				<td width="25%">
					<select id="sub_cate" class="sub_cate sub_cate1" name="subCate1" style="width:80%;">
							<option id="desktop" value="desktop">데스크탑
							<option id="pcEtc" value="pcEtc">PC 주변기기
					</select>
					<select id="sub_cate" class="sub_cate sub_cate2" name="subCate2" style="width:80%;">
							<option id="case" value="case">노트북 가방
							<option id="notebook" value="notebook">노트북
							<option id="notebookEtc" value="notebookEtc">노트북 주변기기
					</select>
					<select id="sub_cate" class="sub_cate sub_cate3" name="subCate3" style="width:80%;">
						<option id="ha" value="ha">생활가전
						<option id="ka" value="ka">주방가전
						<option id="camera" value="camera">카메라
					</select>
				</td>		
            </tr>
            <tr>
                <th>상품명 </th>
                <td colspan="3"><input cols="10" size=30 name="productName" class="form-control" style="resize:none"></td>
            </tr>
            <tr>
                <th>가격 </th>
                <td colspan="3"><input type="text" name="productMoney" class="form-control"></td>
            </tr>
            <tr>
                <th>상품 이미지</th>
                <td colspan="3">
                	<div>
                	<input type="file" name="file1" class="pull-right" id="file1" style="width:50%;"/>
                	<input type="file" name="file2" class="pull-right" id="file2" style="width:50%;"/>
                	<input type="file" name="file3" class="pull-right" id="file3" style="width:50%;"/>
                	<input type="file" name="file4" class="pull-right" id="file4" style="width:50%;"/>
                	</div>
                </td>
            </tr>
            <tr>
                <th>상품 설명 </th>
                <td colspan="3">
                	<textarea cols="10" rows="10" name="contents" class="form-control" style="resize:none"></textarea>
                	<!-- <input type="text" class=""/> -->
                </td>
                
            </tr>
            <tr>
                <th>상품 보관일자 </th>
                <td colspan="3"><input type="date" name="keepDate" style="width:40%;" class="form-control" id="keepDate"/></td>
            </tr>
            <tr>
                <td colspan="5">
                    <input type="submit" value="등록" id="btn_enroll subBtn" class="pull-right"/>
                    <input type="button" value="취소" id="btn_enroll" class="pull-left"/>
                    <input type="button" value="목록" id="btn_enroll" class="pull-right" onclick="javascript:location.href='list.jsp'"/>
                </td>
            </tr>
</table>
        </form>
        <script>
        	$(function(){
	        			$(".sub_cate1").show();
	        			$(".sub_cate2").hide();
	        			$(".sub_cate3").hide();
        		
        		$(".cate_enroll").change(function(){
	        		var select = $(".cate_enroll").val();

	        		if(select == "pc"){
	        			$(".sub_cate1").show();
	        			$(".sub_cate2").hide();
	        			$(".sub_cate3").hide();
	        			
	        		}else if(select == "laptop"){
	        			$(".sub_cate1").hide();
	        			$(".sub_cate2").show();
	        			$(".sub_cate3").hide();
	        		}else{
	        			$(".sub_cate1").hide();
	        			$(".sub_cate2").hide();
	        			$(".sub_cate3").show();
	        		}
        		
        		});
        		
        		/* $(".subBtn").onclick(function(){
        			
        		}); */
        		
        		
        		
        		
        		
        	});
        </script>
        
</div>
<footer><%@ include file="../hfl/footer.jsp" %></footer>
</body>
</html>