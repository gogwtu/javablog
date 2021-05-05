<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="javablog.util.ConfigProperty,java.text.SimpleDateFormat,
javablog.bean.ArticleBean,javablog.bean.ArticleBeanBo,javablog.bean.CategoryBean
,javablog.bean.CategoryBeanBo,javablog.bean.TagBean,javablog.bean.TagBeanBo
,javablog.bean.UserBean,javablog.bean.UserBeanBo
,javablog.database.DBConnectionPool,java.sql.Connection"%>
<%
	ArrayList<ArticleBean> al = (ArrayList<ArticleBean>) request.getAttribute("articleList");
	if (al != null) {
		Connection connection = DBConnectionPool.getDBConnectionPool().getConnection();
		if (connection != null){
			CategoryBeanBo cbb = new CategoryBeanBo(connection);
			UserBeanBo ubb = new UserBeanBo(connection);
			TagBeanBo tbb = new TagBeanBo(connection);
	
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String color = "";
			for (int i = 0; i < al.size(); i++) {
				ArticleBean ab = al.get(i);
				CategoryBean cb = cbb.getCategory(ab.getCategoryId());
				UserBean ub = ubb.getUser(ab.getAuthorId());
				tbb.setFilter(ConfigProperty.STATUS_NORMAL + "",
						"SELECT tag_id FROM article_tags WHERE article_id=" + ab.getArticleId(),
						null, null);
				ArrayList<TagBean> altb = tbb.getTags(0);
        int day = Integer.valueOf(sdf.format(ab.getDate()).substring(8, 10));
				//color = "color_" + (int)(Math.random() * 4 + 1);
        color = "color_" + (day % 4);//4种颜色循环使用
%>
<div class="articlebox">
	<div class="headline">
		<div class="date <%=color %>">
			<p class="year"><%=sdf.format(ab.getDate()).substring(2, 7)%></p>
			<p class="day"><%=day%></p>
		</div>
		<div class="title">
			<h2 class="posttitle">
				<a href="article/<%=ab.getArticleId()%>/"><%=ab.getTitle()%></a>
			</h2>
			<div class="category">
				<div class="category_info left">
				Category:&nbsp;<a href="category/<%=cb.getCategoryId() %>/"><%=cb.getName()%></a>
				</div>
				<div class="tag_info left">
				<span class="left tag_label">Tags:</span>
				<%
					for (int j = 0; j < altb.size(); j++) {
						TagBean tb = altb.get(j);
				%>
				<span class="tag_link">
					<a href="tag/<%=tb.getTagId()%>/"><%=tb.getName()%></a>
				</span>
				<%
					}
				%>
				</div>
			</div>
		</div>
		<div class="postauthor">
			<div class="left">
				<div class="postby">
					Posted by
				</div>
				<div class="author">
					<a href="author/<%=ub.getUserId()%>/" title="View more articles of <%=ub.getName() %>"><%=ub.getName()%></a>
				</div>
			</div>
			<div class="right avatar">
				<img alt="" src="<%=ub.getAvatar()%>" />
			</div>
		</div>
	</div>
	<div class="blogcontent">
		<%
			int index = ab.getContent().indexOf("[...]");
			if (index > 0){
				out.print(ab.getContent().substring(0, index));
			} else {
				out.print(ab.getContent());
			}
		%>
	</div>
	<div class="articleinfo">
		<div class="left">
			<a class="buttonlink" href="article/<%=ab.getArticleId()%>/">Read More</a>
		</div>
		<div class="right">
			<a class="buttonlink" href="article/<%=ab.getArticleId()%>/#comment">Comments(<%=ab.getStatus() %>)</a>
		</div>
	</div>
</div>
<%
			}
			cbb.closeConnection();
		}
	}
%>
