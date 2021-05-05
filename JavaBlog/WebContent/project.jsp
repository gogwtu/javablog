<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="javablog.bean.ArticleBean,javablog.bean.ArticleBeanBo"%>
<!DOCTYPE HTML>
<html>
	<head>
		<jsp:include page="include/base.jsp"></jsp:include>
		<script type="text/javascript" src="js/main.js"></script>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		<link rel="stylesheet" type="text/css" href="css/blog.css" />
		<link rel="stylesheet" type="text/css" href="css/project.css" />
		<title>Projects&nbsp;-&nbsp;LeftGeek</title>
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
				<h2 class="headtitle">Projects</h2>
				<div class="project_item">
					<h3 class="project_title">
            <a href="https://github.com/gogwtu/javablog" target="blank">JavaBlog</a>
					</h3>
					<div class="project_content">
					JavaBlog是我在大学期间开发的JAVA博客系统，包括完整的前端与后台管理。
          它也是本网站的源代码，已经放到了<a href="https://github.com/gogwtu/javablog" target="blank">GitHub</a>上，欢迎找BUG。
					</div>
          <h3 class="project_title">
            <a href="happybirthday/" target="blank">Happy Birthday Tetris</a>
					</h3>
					<div class="project_content">
            Happy Birthday Tetris是一个简单的俄罗斯方块游戏，采用HTML5编写。
            当时是为了祝福一个朋友生日快乐才做的(其实只是想装*)，通关后你就知道是祝福谁了。
            虽然并没啥技术含量，留着当纪念也无妨。
					</div>
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
