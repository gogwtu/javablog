<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String category=(String)request.getAttribute("category");
	if (category == null) {
		response.sendRedirect("error/");
	} else {
%>
<!DOCTYPE HTML>
<html>
	<head>
		<jsp:include page="include/base.jsp"></jsp:include>
		<script type="text/javascript" src="js/main.js"></script>
		<link rel="stylesheet" type="text/css" href="css/main.css" />
		<link rel="stylesheet" type="text/css" href="css/blog.css" />
		<title>Articles&nbsp;of&nbsp;<%=category %>&nbsp;-&nbsp;LeftGeek</title>
	</head>
	<body onload="scrollInit();">
		<div id="header">
			<div class="wrapper">
				<jsp:include page="include/header.jsp"></jsp:include>
			</div>
		</div>
		<div id="container">
			<div id="main">
			<div id="main_div">
				<h2 class="headtitle">Category:&nbsp;<%=category %></h2>
				<jsp:include page="include/articleList.jsp"></jsp:include>
				<div class="fy">
					<jsp:include page="include/page.jsp"></jsp:include>
				</div>
			</div>
			</div>
			<div id="sidebar">
				<jsp:include page="include/sideBar.jsp"></jsp:include>
			</div>
		</div>
		<div id="footer">
			<div class="wrapper">
				<jsp:include page="include/footer.jsp"></jsp:include>
			</div>
		</div>
	</body>
</html>
<%
}
%>
