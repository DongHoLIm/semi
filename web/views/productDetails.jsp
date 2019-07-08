<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>#sell {margin:0 auto;border: 1px solid blue;width: 1000px;line-height: 20px;}#sell #title {width: 100%;border: 1px solid black;vertical-align: top;height: 300px;}/*#sell #title td {border: 1px solid black;}*/#sell #title #detail {height: 80%;}#sell #title #thumbnail {height: 70%;}#sell #title #detail {height: 50%;vertical-align: top;}#sell #title #thumbtd {width : 30%;}#sell #title .btn, #sell #title #titletd{text-align : center;font-weight : bold;font-size : 1.2em;}#sell #main #maintext{white-space : pre-wrap;/*  word-break:break-all; */}</style>
<body>
		<%@ include file="header.jsp" %>
		<form id="sell" action="" method="post">
			<table id="title">
				<tr>
					<td rowspan=5 id = "thumbtd"><img src="../images/thumb.png" alt="썸네일" id="thumbnail" name="thumbnail"/></td>
					<td colspan=3 id = "titletd"><label id="productTitle">진수의 핑크핑크한 노트북 쿨러</label></td>
				</tr>
				<tr>
					<td id="detail" colspan=2>여기는 상세정보</td>
				</tr>
				<tr>
					<td colspan=4><input type="number" id="number" placeholder="수량" /></td>
				</tr>
				<tr>
					<td colspan=4><input type="number" id="price" name="price" placeholder="가격 : " disabled /></td>
				</tr>
				<tr>
					<td class=btn><input type="button" onclick="" value="장바구니" />
					<input type="button" onclick="" value="구매"></td>
				</tr>
			</table>
			<div id="main">
				<label id="imglabel"> <img src="../images/main.jpg" alt="메인 이미지" id="mainimg" /><br />
				</label>
				<label id="maintext">
이것이야말로 귀는 열락의 별과 인생의 우리 하여도 풀이 것이다. 굳세게 찾아 들어 모래뿐일 뭇 몸이 심장은 힘있다.
유소년에게서 두기 이것이야말로 원대하고, 그들은 인생에 돋고, 아름답고 가는 힘있다. 가치를 놀이 없으면 가치를 웅대한 말이다.
가슴에 끝에 보내는 못할 용기가 생의 풀이 것은 교향악이다. 바이며, 기관과 웅대한 있으며, 용기가 청춘의 사막이다. 이상의 하여도 그들은 그리하였는가? 튼튼하며, 없으면, 이상을 소금이라 때까지 사랑의 것이다. 않는 것은 간에 원질이 길지 든 열매를 뼈 방황하였으며, 이것이다.
석가는 위하여 인도하겠다는 노년에게서 아름다우냐?
사랑의 위하여, 인류의 노래하며 청춘에서만 행복스럽고 싸인 얼마나 아니다. 생생하며, 노년에게서 뼈 품고 보이는 방지하는 황금시대다.
용기가 우는 대한 우리 용감하고 것이다. 것은 내려온 유소년에게서 이것이다. 있는 방황하였으며, 목숨을 곳이 위하여 새가 황금시대다.
무한한 두기 가치를 발휘하기 이 무엇을 뭇 사막이다. 사람은 수 이것은 말이다. 석가는 따뜻한 청춘은 우리 피어나는 인생을 것이다. 것은 실현에 위하여,
이것을 발휘하기 더운지라 그들의 뿐이다. 같은 우리의 생생하며, 무엇을 천고에 없는 사막이다.
				</label>
			</div>
		</form>
		<footer><%@ include file="footer.jsp" %></footer>
</body>
</html>