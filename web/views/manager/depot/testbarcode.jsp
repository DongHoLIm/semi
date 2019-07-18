<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/sp/js/jquery-barcode.js"></script>
</head>
<body>

<div id="bcTarget"></div>
</body>

<script type="text/javascript">
    $("#bcTarget").barcode("1234567890128", "codabar");
</script>
</html>