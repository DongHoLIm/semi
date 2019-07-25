<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;}
    }
    li{
    	list-style: none;
    }
    a{
    	color:black;
    	text-decoration: none;
    }
     a:link {
     color: white;
     }
	 a:visited {
	  color: black;
	  text-decoration: none;
	  }
  </style>
</head>
<body>
 <div class="container" style="float: left; width: 20%; padding-top: 10%; ">
  <div class="panel-group" id="accordion" >
    <div class="panel panel-default">
      <div class="panel-heading" style="background: black; color:white">
        <h4 class="panel-title" >
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">PC</a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse in">
        <div class="w3-dropdown-content w3-bar-block w3-border">
        	<ul>
        		<li><a href="<%=request.getContextPath() %>/" class="w3-button">본체</a></li>
        		<li><a href="">모니터</a></li>
        	</ul>
        </div>
      </div>
    </div>
    <div class="panel panel-default" >
      <div class="panel-heading" style="background: black; color:white">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">노트북</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">
        	<ul>
        		<li><a href="">노트북</a></li>
        		<li><a href="<%=request.getContextPath()%>/search.pd">노트북가방</a></li>
        	</ul>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading" style="background: black; color:white">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">가전제품</a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">
        	<ul>
        		<li><a href="">주방용품</a></li>
        		<li><a href="">생활가전</a></li>
        	</ul>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>