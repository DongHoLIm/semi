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
.danger{
	color:red;
	font-size:5px;
}

#fileLabel{
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #7799dd;
	cursor: pointer;
	border: 1px solid #7090d0;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	width:25%;

}

.pullRight{
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip:rect(0,0,0,0);
	border: 0;
}

.fileName{
	width:70%;
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;

}


</style>
</head>
<body>

	<header><%@ include file="../hfl/header.jsp" %></header>
	<div><%@ include file="../hfl/list.jsp" %></div>
<br><br><br><br>
<div class="container">
		<button class="testBtn" onclick="<%=request.getContextPath()%>/payment.pa">상품구매 테스트</button>
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
	                	<label for="file1" id="fileLabel">이미지 업로드</label>
	                	<input class="fileName" value="파일선택" disabled="disabled">
	                	<input type="file" name="file1" class="pullRight" id="file1" style="width:50%;"/><br />
	                	<p class="danger">*첫번째 업로드 사진이 메인 이미지가 됩니다.</p>
					</div>
                	<div>
	                	<label for="file2" id="fileLabel">이미지 업로드</label>
	                	<input class="fileName" value="파일선택" disabled="disabled">
	                	<input type="file" name="file2" class="pullRight" id="file2" style="width:50%;"/><br />
                	</div>
                	<div>
						<label for="file3" id="fileLabel">이미지 업로드</label>
	                	<input class="fileName" value="파일선택" disabled="disabled">
	                	<input type="file" name="file3" class="pullRight" id="file3" style="width:50%;"/><br />
					</div>
					<div>
						<label for="file4" id="fileLabel">이미지 업로드</label>
	                	<input class="fileName" value="파일선택" disabled="disabled">
						<input type="file" name="file4" class="pullRight" id="file4" style="width:50%;"/><br />
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
                    <input type="submit" value="등록" id="btn_enroll" class="pull-right"/>
                    <input type="button" value="홈으로" id="btn_enroll" class="pull-left" onclick="javascript:location.href='index.jsp'"/>
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

        		$(".pullRight").change(function(){

        			if(window.FileReader){
        				var fileName = $(this)[0].files[0].name;
       				} else {
       					var fileName = $(this).val().split('/').pop().split('\\').pop();
					}
					console.log(fileName);
					$(this).siblings(".fileName").val(fileName);


        		});





        	});
        </script>

</div>
<footer><%@ include file="../hfl/footer.jsp" %></footer>
</body>
</html>