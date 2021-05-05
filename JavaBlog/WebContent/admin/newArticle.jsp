<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="javablog.bean.ArticleBean,javablog.bean.ArticleBeanBo
,javablog.bean.CategoryBean,javablog.bean.CategoryBeanBo,
javablog.bean.TagBean,javablog.bean.TagBeanBo,javablog.bean.ArticleTagBeanBo
,javablog.util.StrFilter,javablog.util.ConfigProperty"%>
<%@page import="javablog.database.DBConnectionPool,java.sql.Connection"%>
<%
	String user = (String) session.getAttribute("userId");
	if (user != null) {
		String articleIdText = request.getParameter("articleId");
		int articleId = 0;
		int categoryId = 0;
		String title = "";
		String content = "";
		String tags = "";
		Connection connection = DBConnectionPool.getDBConnectionPool().getConnection();
		if (connection != null){
		    TagBeanBo tbb = new TagBeanBo(connection);
			if (articleIdText != null) {//如果是修改文章
				StrFilter sf=new StrFilter();
				articleId = sf.parseNum(articleIdText);
				ArticleBeanBo abb = new ArticleBeanBo(connection);
				ArticleBean ab = abb.getArticle(articleId);
				if (ab != null) {
					articleId = ab.getArticleId();
					title = ab.getTitle();
					content = ab.getContent();
					categoryId = ab.getCategoryId();
	                //show tags
	    			tbb.setFilter(ConfigProperty.STATUS_NORMAL + "",
	    					"SELECT tag_id FROM article_tags WHERE article_id=" + articleId,
	    					null, null);
	    			ArrayList<TagBean> altb = tbb.getTags(0);
	                for(int i=0; i<altb.size(); i++){
	                	TagBean tb = altb.get(i);
	                    tags += tb.getName() + ",";
	                }
				}
			}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<jsp:include page="admin-base.jsp"></jsp:include>
		<title>Write article</title>
		<script type="text/javascript" src="admin/js/admin.js"></script>
		<script type="text/javascript" src="admin/js/editor.js"></script>
		<link rel="stylesheet" type="text/css" href="admin/css/admin.css" />
		<link rel="stylesheet" type="text/css" href="admin/css/editor.css" />
	</head>
	<body onload="onLoad('contentText')">
		<div class="titlebar">
			Write article (Use [...] to seperate abstract)
		</div>
		<form action="" method="post">
			<div>
				<input maxlength="80" id="titleText" name="title" value="<%=title%>" type="text" />
			</div>
			<div id="editor_box">
				<div id="editor">
					<jsp:include page="editor.jsp"></jsp:include>
				</div>
				<div id="textarea_box">
					<textarea id="contentText" name="content"><%=content%></textarea>
				</div>
			</div>
		    <div>
                 <label>Category</label>
                 <select id="categoryText" name="category">
                    <%
                       CategoryBeanBo cbb = new CategoryBeanBo(connection);
                       cbb.setFilter(ConfigProperty.STATUS_NORMAL, null, null);
                        ArrayList<CategoryBean> alcb = cbb.getCategories(0);
                        for (int i = 0; i < alcb.size(); i++) {
                            CategoryBean cb = alcb.get(i);
                            %>
                            <option value="<%=cb.getCategoryId()%>"
                            <%if(cb.getCategoryId() == categoryId){out.print("selected='true'");}%>>
                            <%=cb.getName()%>
                            </option>
                            <%
                        }
                    %>
                </select>
		    </div>
		    <div>
		    	<label>Tags(Separated by ",")</label>
				<input type="text" id="tagText" name="tag" value="<%=tags %>"/>
				<div id="tagBox">
					<%
						tbb.setFilter(ConfigProperty.STATUS_NORMAL, null, null);
						ArrayList<TagBean> altb = tbb.getTags(0);
						for (int i = 0; i < altb.size(); i++) {
							TagBean tb = altb.get(i);
					%>
					    <span onclick="addTag(this)"><%=tb.getName()%></span>
					<%
					    }
						tbb.closeConnection();
			        %>
			    </div>
		    </div>
			<div>
			    <input type="hidden" id="articleIdText" name="articleId" value="<%=articleId%>" />
                <input type="hidden" id="statusText" name="status" value="0" />
                <input type="hidden" id="isSaved" name="isSaved" value="0" />
				<input class="button" type="button" value="Post" onclick="updateArticle(<%=ConfigProperty.STATUS_PENDING %>, 'post')"/>
				<input class="button" type="button" value="Draft" onclick="updateArticle(<%=ConfigProperty.STATUS_DRAFT %>, 'save')"/>
			</div>
		</form>
	</body>
</html>
<%
		}
	}
%>
