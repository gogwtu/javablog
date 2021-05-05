<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE HTML>
<html>
	<head>
		<jsp:include page="include/base.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		<link rel="stylesheet" type="text/css" href="css/blog.css"/>
		<link rel="stylesheet" type="text/css" href="css/error.css"/>
		<title>404 Error(Page Not Found)&nbsp;-&nbsp;LeftGeek</title>
	</head>
	<body>
		<div id="header">
			<div class="wrapper">
				<jsp:include page="include/header.jsp"></jsp:include>
			</div>
		</div>
		<div id="container">
      <!--
			<div id="error_div">
				<img src="images/error404.png"/>
			</div>
      -->
      <iframe scrolling='no' frameborder='0' src='http://yibo.iyiyun.com/js/yibo404/key/SELECT * FROM `404_ad_place` WHERE ( url='http://leftgeek.com/' AND clrgb='rgb(95,95,95)' AND bgrgb='rgb(243,243,243)' AND width=640 AND height=462 ) LIMIT 1  66' width='640' height='462' style='display:block;'></iframe>
		</div>
		<div id="footer">
			<div class="wrapper">
				<jsp:include page="include/footer.jsp"></jsp:include>
			</div>
		</div>
	</body>
</html>
