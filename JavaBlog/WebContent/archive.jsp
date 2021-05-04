<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat,javablog.bean.ArticleBean,javablog.bean.ArticleBeanBo"%>
<%@page import="javablog.util.ConfigProperty"%>
<%
	ArrayList<ArticleBean> al = (ArrayList<ArticleBean>) request.getAttribute("articleList");
	if (al == null) {
		response.sendRedirect("error/");
	} else {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
%>
<!DOCTYPE HTML>
<html>
	<head>
		<jsp:include page="include/base.jsp"></jsp:include>
		<script type="text/javascript" src="js/main.js"></script>
		<link rel="stylesheet" type="text/css" href="css/main.css" />
		<link rel="stylesheet" type="text/css" href="css/blog.css" />
		<link rel="stylesheet" type="text/css" href="css/archive.css" />
		<title>Archives&nbsp;-&nbsp;<%=ConfigProperty.website_name %></title>
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
				<h2 class="headtitle">
					Archive
				</h2>
				<%
					for (int i = 0; i < al.size(); i++) {
						ArticleBean ab = al.get(i);
						String date = sdf.format(ab.getDate()).substring(0, 7);
				%>
				<h2 class="archivedate"><%=date%></h2>
				<ol class="archive">
					<li>
						<a href="article/<%=ab.getArticleId()%>/"><%=ab.getTitle()%></a>
					</li>
					<%
						while ((++i) < al.size()){
							ab = al.get(i);
							if (sdf.format(ab.getDate()).contains(date)){
						%>
							<li>
								<a href="article/<%=ab.getArticleId()%>/"><%=ab.getTitle()%></a>
							</li>
						<%
							} else {
								break;
							}
						}
					%>
				</ol>
				<%
					}
				%>
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
