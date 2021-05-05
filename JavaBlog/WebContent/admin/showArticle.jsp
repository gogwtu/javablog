<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="javablog.bean.ArticleBean,javablog.bean.ArticleBeanBo,javablog.util.StrFilter,javablog.bean.CommentBean,
javablog.util.ConfigProperty,javablog.bean.CommentBeanBo"%>
<%@page import="javablog.database.DBConnectionPool,java.sql.Connection,
java.text.SimpleDateFormat"%>
<%
	StrFilter sf=new StrFilter();
	int articleId = sf.parseNum(request.getParameter("articleId"));
	Connection connection = DBConnectionPool.getDBConnectionPool().getConnection();
	if (connection != null){
		ArticleBeanBo abb = new ArticleBeanBo(connection);
		ArticleBean ab = abb.getArticle(articleId);
		if (ab == null) {
			abb.closeConnection();
			response.sendRedirect("error.jsp");
		} else {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<jsp:include page="admin-base.jsp"></jsp:include>
		<title>Read article</title>
		<script type="text/javascript" src="admin/js/admin.js"></script>
		<link rel="stylesheet" type="text/css" href="admin/css/admin.css" />
		<link rel="stylesheet" type="text/css" href="css/comment.css" />
		<style type="text/css">
		#main{
			width:650px;
		}
		.article{
		width:620px;
		padding:10px;
		background:#FFFFFF;
		}
		ul,li{
			list-style-type:none;
			padding:0px;
			margin:0px;
		}
		</style>
		<script type="text/javascript">
		function reply(username){
			window.location.hash = "#comment";
			document.getElementById("content").value="reply to "+username+":";
		}

		function addComment(articleId) {
			var content = document.getElementById("content").value;
			var xmlHttp = createXMLHttpRequest(); //
			var url = "AddComment";
			xmlHttp.open("post", url, true); //
			xmlHttp.onreadystatechange = callback; //
			xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=UTF-8");
			xmlHttp.send("articleId="+articleId+"&userId=1&content=" + encodeURIComponent(content));
			function callback()//
			{
				if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
					var data = xmlHttp.responseText;
					if (data == "s") {
						showTip("Submit successful","submitmsg");
						document.getElementById("username").value = "";
						document.getElementById("email").value = "";
						document.getElementById("url").value = "";
						document.getElementById("content").value = "";
					} else {
						showTip("Submit fail","submitmsg");
					}
				}
			}
		}
		</script>
	</head>
	<body>
		<div class="titlebar">
			Read article
		</div>
		<div>
			<input class="button" type="button" onclick="javascript:history.back()" value="返回"/>
			<a href="admin/newArticle.jsp?articleId=<%=ab.getArticleId()%>">Edit</a>
			<a href="javascript:void(0)" onclick="deleteData(<%=ab.getArticleId()%>,4)">Delete</a>
		</div>
		<div id="main">
		<div class="article">
			<h2><%=ab.getTitle() %></h2>
			<div>发表时间:<%=sdf.format(ab.getDate()) %></div>
			<div><%=ab.getContent() %></div>
		</div>
		<%
			CommentBeanBo cbb=new CommentBeanBo(connection);
			cbb.setFilter(ConfigProperty.STATUS_NORMAL, ab.getArticleId(), 0, "comment_id","desc");
			ArrayList<CommentBean> al=cbb.getComments(0);
		%>
		<div>
		    Totally <%=al.size() %> Comments
		</div>
		<div id="comment_list">
			<ul>
			<%
				CommentBean cb;
				for(int i = 0; i< al.size(); i++){
				 	cb = al.get(i);
			%>
			<li class="comment<%=cb.getUserId() %>">
				<div class="userinfo">
					<div class="username">
						<a href="<%=cb.getUrl()%>" target="blank"><%=cb.getName()%></a>
					</div>
					<div class="avatar">
						<img src="images/avatar.png" alt="avatar" />
					</div>
					</div>
				<div class="commentinfo">
					<div class="reply">
						<div class="left"><%=sdf.format(cb.getDate()) %></div>
						<div class="right">
							<a class="left button" href="javascript:void(0)" onclick="reply('<%=cb.getName()%>')">Reply</a>
							<a class="right button" href="javascript:void(0)" onclick="deleteData(<%=ab.getArticleId()%>,5)">Delete</a>
						</div>
					</div>
					<div class="content">
						<%=cb.getContent() %>
					</div>
				</div>
			</li>
			 <%
			     }
			  %>
			</ul>
		</div>
		<div id="newcomment">
			<a name="comment"></a>
			<textarea id="content"></textarea>
			<div>
			<input class="button" type="button" value="提交" onclick="addComment(<%=ab.getArticleId() %>)"/>
			</div>
		</div>
		</div>
	</body>
</html>
<%
	        abb.closeConnection();
		}
	}
%>
